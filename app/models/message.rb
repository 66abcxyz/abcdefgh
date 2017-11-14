class Message < ApplicationRecord
  before_create :randomize_id
  belongs_to :user
  belongs_to :post
  validates :line1, length: { maximum: 3000 }
  private
  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000_000_000)
    end while Message.where(id: self.id).exists?
  end
end
