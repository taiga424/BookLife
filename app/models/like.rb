class Like < ApplicationRecord
  belongs_to :user
  belongs_to :book, counter_cache: :likes_count

  validates :user_id, presence: true
  validates :book_id, presence: true
  validates_uniqueness_of :book_id, scope: :user_id
end
