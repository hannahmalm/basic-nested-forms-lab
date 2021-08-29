class Recipe < ActiveRecord::Base
  has_many :ingredients 
  #a recipie should accept many ingredients
  accepts_nested_attributes_for :ingredients
end
