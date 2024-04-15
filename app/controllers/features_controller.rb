class FeaturesController < ApplicationController

    def initialize(features_service = FeaturesService)
        @features_service = features_service
      end

    def index
        @features = @features_service.index(params)
        render json: @features
     end

    def get_and_save_features
        @data = @features_service.get_and_save_features
        render json: @data
    end
end
