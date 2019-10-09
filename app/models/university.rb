class University < ApplicationRecord
  validates :name, presence: true
  has_many :libraries, :dependent => :destroy
  has_many :students, :dependent => :destroy
  has_many :books, :dependent => :destroy
end
