class Book < ApplicationRecord
  validates :title, :review, :image, presence: true
  belongs_to :user
  has_many :comments

  def self.search(search)
    return Book.all unless search
    Book.where('title LIKE(?)', "%#{search}%")
  end
end
