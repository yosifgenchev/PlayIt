class Event < ApplicationRecord
	belongs_to :user
	belongs_to :sport
	validates :user_id, presence: true
	validates :sport_id, presence: true 
end
