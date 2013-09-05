class Group < ActiveRecord::Base
  belongs_to :charity
  has_many :events
  has_many :groups_leaders, dependent: :destroy
  has_many :groups_volunteers, dependent: :destroy
  has_many :leaders, through: :groups_leaders, foreign_key: :leader_id
  has_many :volunteers, through: :groups_volunteers, foreign_key: :volunteer_id

  attr_accessible :email, :location, :name, :phone, :website, :description, :causes, :logo, :cause_list, :splash_image, :video, :splash_image_html, :video_html, :slogan, :cause_search_hack

  include AutoHtml

  # GEOCODER SETTINGS
  geocoded_by :location
  after_validation :geocode

  # CAUSES USING ACTS-AS-TAGGABLE-ON GEM
  acts_as_taggable_on :causes

  # gmaps4rails setting
  acts_as_gmappable

  # Image uploader
  mount_uploader :logo, ImageUploader

  # VALIDATIONS
  validates :description, presence: true
  validates :location, presence: true
  validates :name, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates :website, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def gmaps4rails_address
    "#{self.location}"
  end

  auto_html_for :video do
    html_escape
    image
    youtube(:width => 560, :height => 350)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

  auto_html_for :splash_image do
    html_escape
    image
    flickr(:maxwidth => 1200)
    link :target => "none", :rel => "nofollow"
  end

end
