class Event < ApplicationRecord
	belongs_to :user
	belongs_to :sport
	belongs_to :place

	has_many :userevents, foreign_key: :attended_event_id
	has_many :attendees, through: :userevents

	default_scope -> { order(created_at: :desc) }
	validates :user_id, presence: true
	validates :sport_id, presence: true

	private

	def finish_cannot_be_earlier_than_start
      unless start.nil? || finish.nil?
        time_error if finish < start
      end
    end

    def time_error
      errors.add(:time_error, 'The fundamental laws of nature prevent time travel')
    end
end
