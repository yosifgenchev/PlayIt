class Event < ApplicationRecord
	belongs_to :user
	belongs_to :sport
	default_scope -> { order(created_at: :desc) }
	validates :user_id, presence: true
	validates :sport_id, presence: true 
end
