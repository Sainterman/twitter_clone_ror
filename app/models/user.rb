class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy

  # A follower is a user that follows another user.
  has_many :follower_followships,
           class_name: 'Followship',
           foreign_key: 'follower_id',
           dependent: :destroy

  # To see the users that the user follows, we reference them through the join
  # table.
  has_many :followees, through: :follower_followships

  has_many :followee_followships,
           class_name: 'Followship',
           foreign_key: 'followee_id',
           dependent: :destroy

  has_many :followers, through: :followee_followships



  #Field validations
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :username, length: { maximum: 16 }, presence: true, uniqueness: true
  validates_format_of :username, with: /\A(?=.*[a-z])[a-z\d]+\Z/i
  require 'uri'
  validates :email, presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: 'must be a valid email address' },
                    uniqueness: { case_sensitive: false }


  
  def follow(user)
    followees << user
  end

  def unfollow(followed_user)
    followees.delete followed_user
  end
end
