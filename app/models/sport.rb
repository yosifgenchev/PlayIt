class Sport < ApplicationRecord
	has_many :events, dependent: :destroy

	validates :name, presence: true
end
