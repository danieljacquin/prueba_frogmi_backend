class Comment < ApplicationRecord
  belongs_to :feature
  validates :feature_id, presence: true
  validates :comment, presence: true
  validate :feature_exists

  private

  def feature_exists
    errors.add(:feature_id, 'does not exist') unless Feature.exists?(self.feature_id)
  end
end
