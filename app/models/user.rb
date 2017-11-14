class User < ActiveRecord::Base
  after_create :build_profile
  before_create :randomize_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :posts, -> { order "created_at DESC" }, dependent: :destroy
  validates :name, presence: true, length: { maximum: 28 }, format: { with: /\A[a-zA-Z ]+\Z/, message: "You can't have numbers and special characters in your Name. " }
  validates :username, presence: true, uniqueness: true, length: { maximum: 36 }, format: { with: /\A[a-z0-9_.]+\Z/, message: "You can't have capital letters, spaces and special characters in your Username. " }
  validates :email, presence: true, uniqueness: true, length: { maximum: 44 }, format: { with: /\A[a-z0-9_.@]+\Z/, message: "You can't have capital letters, spaces and special characters in your E-Mail. " }

  mount_uploader :image, ImageUploader

  def build_profile
    Profile.create(user: self, line1: username, id: id) # Associations must be defined correctly for this syntax, avoids using ID's directly.
  end

  private
  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000_000)
    end while User.where(id: self.id).exists?
  end
end
