class CommentsService
    def self.create(comment_params)
        comment = Comment.new(comment_params)

        if comment.save
            { success: true, comment: comment }
          else
            { success: false, errors: comment.errors.full_messages }
          end
    end

    def self.find_by_feature_id(feature_id)
        feature = Feature.find_by(id: feature_id)

        if feature.nil?
          { success: false, error: "Feature with ID #{feature_id} does not exist" }
        else
          comments = Comment.where(feature_id: feature_id)
          { success: true, comments: comments }
        end
    end
end