class Post < ApplicationRecord
  before_create :randomize_id
  attr_accessor :image
  belongs_to :user
  belongs_to :profile
  has_many :messages, -> { order "created_at ASC" }, dependent: :destroy
  validates :line1, length: { maximum: 9000 }, presence: true, if: -> { image.blank? }
  mount_uploader :image, ImageUploader
  private
  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000_000_000)
    end while Post.where(id: self.id).exists?
  end

end
