class LibraryBookList < ApplicationRecord
  belongs_to :book
  has_many :wish_lists, :dependent => :destroy
end
