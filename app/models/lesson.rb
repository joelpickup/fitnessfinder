class Lesson < ActiveRecord::Base
  belongs_to :instructor, class_name: 'User'
end
