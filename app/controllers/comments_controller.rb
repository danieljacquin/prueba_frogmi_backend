
class CommentsController < ApplicationController
    protect_from_forgery with: :null_session

    def initialize(comments_service = CommentsService)
      @comments_service = comments_service
    end

    def create
      @comment = @comments_service.create(comment_params)
      render json: @comment
    end

    def comment_params
      params.permit(:feature_id, :comment)
    end

    def find_by_feature_id
      @comments = @comments_service.find_by_feature_id(params[:feature_id])
      render json: @comments
    end

end
