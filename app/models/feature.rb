class Feature < ApplicationRecord
    self.inheritance_column = nil
    has_many :comments
end
