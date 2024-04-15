require 'dry/schema'

class CommentSchema < Dry::Schema::Params
  define do
    required(:feature_id).filled(:string)
    required(:comment).filled(:string)
  end
end
