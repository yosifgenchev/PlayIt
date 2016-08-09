class User < ApplicationRecord
  has_many :events, dependent: :destroy

  has_many :userevents, foreign_key: :attendee_id
  has_many :attended_events, through: :userevents

  attr_accessor :remember_token
	before_save { self.email = email.downcase }
  mount_uploader :picture, PictureUploader
	validates :name,  presence: true, 
					  length: { maximum: 50 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  	validates :email, presence: true, 
  					  length: { maximum: 255 },
  				      format: { with: VALID_EMAIL_REGEX },
  				      uniqueness: { case_sensitive: false }

 	validates :password, presence: true, 
 						 length: { minimum: 6 },
             allow_nil: true

 	has_secure_password

  validate  :picture_size

 	class << self
    # Returns the hash digest of the given string.
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token.
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  def self.from_omniauth(auth)
    where(auth.slice( auth[:provider], auth[:uid])).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def attending?(event)
    event.attendees.include?(self)
  end
  
  def attend!(event)
    self.userevents.create!(attended_event_id: event.id)
  end

  def cancel!(event)
    self.userevents.find_by(attended_event_id: event.id).destroy
  end

  private

  # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end