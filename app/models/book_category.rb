class Book_category < ApplicationRecord
  belongs_to :book
  belongs_to :category
end
