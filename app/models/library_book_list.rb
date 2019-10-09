class LibraryBookList < ApplicationRecord
  validates :number, numericality: {greater_than_or_equal_to: 0}
  belongs_to :book
  has_many :wish_lists, :dependent => :destroy
end
