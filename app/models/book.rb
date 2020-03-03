class Book < ApplicationRecord
  validates :title, :review, :image, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :book_categories, dependent: :destroy
  has_many :categories, through: :book_categories


  mount_uploader :image, ImageUploader
  
  def self.search(search)
    return Book.all unless search
    Book.where('title LIKE(?)', "%#{search}%")
  end

  def like_user?(user_id)
    likes.find_by(user_id: user_id)
  end

end
