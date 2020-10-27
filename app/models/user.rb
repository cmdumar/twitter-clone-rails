class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attr_writer :login
  validate :validate_username

  validates :username, presence: true, uniqueness: true, length: { in: 4..16 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :password, presence: true, length: { minimum: 6, maximum: 35 }

  has_one_attached :profile_picture

  has_one_attached :cover_picture

  validates :profile_picture, attached: false, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                              size: { less_than: 1024.kilobytes },
                              limit: { max: 1 }

  validates :cover_picture, attached: false, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                            size: { less_than: 2048.kilobytes },
                            limit: { max: 1 }

  has_many :opinions, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :active_relationships, class_name: 'Following', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Following', foreign_key: 'followed_id', dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # Following helper methods
  def follow(other)
    active_relationships.create(followed_id: other.id)
  end

  def unfollow(other)
    active_relationships.find_by(followed_id: other.id).destroy
  end

  def following?(other)
    following.include?(other)
  end

  # Devise helper methods
  def login
    @login || username || email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(['lower(username) = :value OR lower(email) = :value',
                                    { value: login.downcase }]).first
    elsif conditions.key?(:username) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end

  def validate_username
    errors.add(:username, :invalid) if User.where(email: username).exists?
  end
end
