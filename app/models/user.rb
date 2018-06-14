class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :feelings, dependent: :destroy
  validates :username, presence: true
  acts_as_voter
  after_create :send_welcome_email

  def self.new_guest
    new do |u|
      u.username = "Guest"
      u.email    = "guest_#{Time.now.to_i}#{rand(100)}@example.com"
      u.guest    = true
    end
  end

  def move_to(user)
    feelings.update_all(user_id: user.id)
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

end
