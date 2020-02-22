class Book < ApplicationRecord
  validates :title, :review, :image, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader
  
  def self.search(search)
    return Book.all unless search
    Book.where('title LIKE(?)', "%#{search}%")
  end

end
