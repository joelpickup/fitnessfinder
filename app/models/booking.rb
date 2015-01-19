class Booking < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :instructor, class_name: 'User'
  belongs_to :client, class_name: 'User'
end
