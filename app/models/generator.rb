class Generator < ActiveRecord::Base
  attr_accessor :last_ipsum

  has_attached_file :bg_image, default_url: ""
  has_attached_file :image, default_url: ""
  has_attached_file :logo, default_url: ""

  has_many :lorem_ipsums

  validates(:name, presence: true, uniqueness: true)
end
