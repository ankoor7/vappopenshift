class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role, :firstname, :lastname, :phone, :t_and_c, :email, :password, :password_confirmation, :remember_me, :image, :provider, :uid, :name

  # Image uploader
  mount_uploader :image, ImageUploader

  # ASSOCIATIONS
  has_many :events_volunteers, dependent: :destroy, foreign_key: :volunteer_id
  has_many :events, through: :events_volunteers
  has_many :groups_volunteers, dependent: :destroy, foreign_key: :volunteer_id
  has_many :groups, through: :groups_volunteers
  has_many :groups_leaders, dependent: :destroy, foreign_key: :leader_id
  has_many :led_groups, through: :groups_leaders, source: :group

  belongs_to :charity

  # VALIDATIONS
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :on => :create
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :phone, presence: true, format: { with: /\A[+]?[\d]+\z/,
    message: "Please check the phone number you entered" }
  validates :t_and_c, presence: true

  # scope :by_date, -> {order('date')}

  def registered_for?(event)
    event.volunteer_ids.include? self.id
  end

  def attending_events?
    events.count > 0
  end

  def can_see_attendees_of?(event)
    event.group.leader_ids.include? self.id
  end

  def leads_a_group?
    led_groups.count > 0
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20]
                           )
    end
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
