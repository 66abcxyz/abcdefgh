class Profile < ApplicationRecord
  extend FriendlyId
	friendly_id :slug_candidates, use: :slugged
  def slug_candidates
    [
      :line1,
      [:line1, :id]
    ]
  end
	def should_generate_new_friendly_id?
    line1_changed?
  end
  belongs_to :user
  has_many :posts, -> { order "created_at DESC" }, dependent: :destroy
  validates :line1, presence: true, uniqueness: true, length: { maximum: 48 }, format: { with: /\A[a-z0-9_]+\Z/ }
end
