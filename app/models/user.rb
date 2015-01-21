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
