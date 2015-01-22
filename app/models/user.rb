  class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]
  validates :first_name, :last_name, :role, presence: :true

  mount_uploader :avatar, AvatarUploader

  has_many :lessons, class_name: 'Lesson',foreign_key: :instructor_id
  has_many :bookings_as_instructor, class_name: 'Booking', foreign_key: :instructor_id
  has_many :bookings_as_client, class_name: 'Booking', foreign_key: :client_id

  before_create :default_role

  acts_as_commentable
  acts_as_votable
  acts_as_messageable

  def default_role
    self.role = "client"
  end

  def name
    return "You should add method :name in your Messageable model"
  end

  AVAILABLE_TIMES = ["07:00", "07:15","07:30","07:45","08:00","08:15","08:30","08:45","09:00","09:15","09:30","09:45","10:00","10:15","10:30","10:45","11:00","11:15","11:30","11:45","12:00","12:15","12:30","12:45","13:00","13:15","13:30","13:45","14:00","14:15","14:30","14:45","15:00","15:15","15:30","15:45","16:00","16:15","16:30","16:45","17:00","17:15","17:30","17:45","18:00","18:15","18:30","18:45","19:00","19:15","19:30","19:45","20:00"]

  def available_times(date)
    bookings_on_this_date = bookings_as_instructor.where("start_time::date = ?", date)
    start_times = bookings_on_this_date.where(status: "approved").map do |x| x.start_time.strftime("%H:%M") end
    end_times = bookings_on_this_date.where(status: "approved").map do |x| x.end_time.strftime("%H:%M") end
    times_set = start_times.zip(end_times)
    a = []
    if times_set.empty?
      return AVAILABLE_TIMES
    else
    times_set.each do |set|
      start = AVAILABLE_TIMES.index(set[0])
      stop = AVAILABLE_TIMES.index(set[1])
      (start..stop).each{|time|
        a << AVAILABLE_TIMES[time]
      }
    end
    end
    AVAILABLE_TIMES - a
  end

  def mailboxer_email(object)
    #Check if an email should be sent for that object
    #if true
    return "define_email@on_your.model"
    #if false
    #return nil
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name   # assuming the user model has a name
      user.last_name = auth.info.last_name
      user.role = "client"
      # user.image = auth.info.image # assuming the user model has an image
    end
  end
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
