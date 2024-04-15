require  'net/http'
require 'json'

class FeaturesService

    def self.index(params)
        magtypes = params[:mag_type] || []
        per_page = params[:rows_per_page] || 5

        if magtypes.empty?
            features =  Feature.paginate(page: params[:page], per_page: per_page)
        else
            features =  Feature.where(mag_type: magtypes).paginate(page: params[:page], per_page: per_page)
        end

        return FeatureSerializer.new(features, meta: pagination_metadata(features))
    end

    def self.pagination_metadata(features)
        {
            pagination: {
                current_page: features.current_page,
                total: features.total_entries,
                per_page: features.per_page
            }
        }
    end

    def self.get_and_save_features
        allIds = get_all_ids
        @data = get_date_from_external_api

        if !allIds.empty?
            set = allIds.to_set
            @data = @data.reject { |hash| set.include?(hash["external_id"]) }
        end

        save(@data)
        return { success: true, dataCount: @data.length }
    end

    def self.save(features)
        Feature.insert_all(features)
    end


    def self.get_date_from_external_api
        uri = URI("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson")
        response = Net::HTTP.get(uri)
        parsed_response = JSON.parse(response)
        data = parsed_response["features"].map do |feature|

            if feature["properties"]["mag"].nil? || 
                feature["properties"]["title"].nil? || 
                feature["properties"]["url"].nil? || 
                feature["properties"]["place"].nil? || 
                feature["geometry"]["coordinates"][0].nil? ||
                feature["geometry"]["coordinates"][1].nil? || 
                !validate_range(feature["properties"]["mag"], -10, 10.0)|| 
                !validate_range(feature["geometry"]["coordinates"][0], -180.0, 180.0)||
                !validate_range(feature["geometry"]["coordinates"][1], -90.0, 90.0)
                    next
                end
            {
                "external_id" => feature["id"],
                "title" => feature["properties"]["title"],
                "type" => feature["type"],
                "magnitude" => feature["properties"]["mag"],
                "place" => feature["properties"]["place"],
                "time" => feature["properties"]["time"],
                "tsunami" => feature["properties"]["tsunami"],
                "mag_type" => feature["properties"]["magType"],
                "external_url" => feature["properties"]["url"],
                "longitude" => feature["geometry"]["coordinates"][0],
                "latitude" => feature["geometry"]["coordinates"][1],
            }
         end.reject(&:nil?)

         return data
    end

    def self.validate_range(num, min, max)
        num >= min && num <= max
    end


    def self.get_all_ids
        Feature.pluck(:external_id);
    end



end