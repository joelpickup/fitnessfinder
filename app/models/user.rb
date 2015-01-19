class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :lessons, class_name: 'Lesson',foreign_key: :instructor_id
  has_many :bookings
  has_many :bookings_as_instructor, class_name: 'Booking', foreign_key: :instructor_id
  has_many :bookings_as_client, class_name: 'Booking', foreign_key: :client_id
end
