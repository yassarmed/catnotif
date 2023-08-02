class Cat < ApplicationRecord
  has_many :cat_feedings
  belongs_to :user
  has_many :feeding_times
  accepts_nested_attributes_for :feeding_times

  attr_accessor :feeding_datetime
end
