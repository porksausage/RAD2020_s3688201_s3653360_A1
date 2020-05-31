class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    validates :city, presence: true, length: { maximum: 50 }
    VALID_MOBILE_REGEX = /[0-9]{10,13}/
    validates :mobile,  presence: true, format: { with: VALID_MOBILE_REGEX }
                      # format: { with: VALID_MOBILE_REGEX } 
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 8,maximum:20 }

      # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
