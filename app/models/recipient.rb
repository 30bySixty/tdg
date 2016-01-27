class Recipient < ActiveRecord::Base
	belongs_to :giver, class_name: 'User'
  has_many :occasions

  accepts_nested_attributes_for :occasions
end
