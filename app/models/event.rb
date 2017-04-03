class Event < ApplicationRecord
	belongs_to :user
	belongs_to :place
	belongs_to :sport

	has_many :userevents, foreign_key: :attended_event_id, dependent: :destroy
	has_many :attendees, through: :userevents, dependent: :destroy

	default_scope -> { order(created_at: :asc) }
	validates :user_id, presence: true
	validates :sport_id, presence: true
	
	validates :number_of_attendees_needed, presence: true
	validates_presence_of :title

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
