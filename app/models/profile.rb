class Profile < ApplicationRecord
  extend FriendlyId
	friendly_id :slug_candidates, use: :slugged
  def slug_candidates
    [
      :id
    ]
  end
	def should_generate_new_friendly_id?
    line1_changed?
  end
  belongs_to :user
  has_many :posts, -> { order "created_at DESC" }, dependent: :destroy
  validates :line1, uniqueness: true, length: { maximum: 48 }, format: { with: /\A[a-z0-9_]+\Z/ }
  include PgSearch
  pg_search_scope :search, :against => [:line2, :line3, :line11, :line12, :line13]
end
