class Student < ApplicationRecord
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: {in: 6..15}
  validates :education_level, presence: true
  validates :university_id, presence: true
  validates :name, presence:true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :borrow_histories, :dependent => :destroy
  has_many :hold_lists, :dependent => :destroy
  has_many :wish_lists, :dependent => :destroy
  has_many :student_current_borrow_lists, :dependent => :destroy

  def self.show_library
    @libraries = Library.all
  end
end
