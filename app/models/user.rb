class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :role, presence: :true

  has_many :lessons, class_name: 'Lesson',foreign_key: :instructor_id
  has_many :bookings_as_instructor, class_name: 'Booking', foreign_key: :instructor_id
  has_many :bookings_as_client, class_name: 'Booking', foreign_key: :client_id

  acts_as_commentable
  acts_as_votable


end
