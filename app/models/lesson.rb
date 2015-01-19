class Lesson < ActiveRecord::Base
  belongs_to :instructor, class_name: 'User'
  has_many :bookings
  validates :name, :description, :price, :instructor_id, presence: :true
  validates :name, uniqueness: { scope: :instructor_id}

end
