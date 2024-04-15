class FeatureSerializer
    include JSONAPI::Serializer

    attributes :external_id, :magnitude, :place, :time, :tsunami, :mag_type, :title

    attribute :coordinates do |object|
      {
        longitude: object.longitude,
        latitude: object.latitude
      }
    end

    attribute :links do |object|
      {
        external_url: object.external_url
      }
    end
    def attributes(*args)
      data = super
      data[:coordinates] = data.delete(:coordinates)
      data[:links] = data.delete(:links)
      data
    end
  end