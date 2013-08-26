class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role, :firstname, :lastname, :phone, :t_and_c, :email, :password, :password_confirmation, :remember_me

  # ASSOCIATIONS
  # has_and_belongs_to_many :events
  has_many :events_volunteers, dependent: :destroy, foreign_key: :volunteer_id
  has_many :events, through: :events_volunteers
  has_many :groups_volunteers, dependent: :destroy, foreign_key: :volunteer_id
  has_many :groups, through: :groups_volunteers
  has_many :groups_leaders, dependent: :destroy, foreign_key: :leader_id
  has_many :led_groups, through: :groups_leaders, source: :groups

  belongs_to :charity

  # VALIDATIONS
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :on => :create
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :phone, presence: true, format: { with: /\A[+]?[\d]+\z/,
    message: "Please check the phone number you entered" }
  validates :t_and_c, presence: true



end
