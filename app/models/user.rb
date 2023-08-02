class User < ApplicationRecord
  has_many :cat_feedings
  has_many :cats
end
