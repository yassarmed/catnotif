class Cat < ApplicationRecord
  has_many :cat_feedings
  belongs_to :user
end
