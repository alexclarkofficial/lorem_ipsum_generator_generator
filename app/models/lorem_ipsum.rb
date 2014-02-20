class LoremIpsum < ActiveRecord::Base
  belongs_to :generator
  validates :generator_id, presence: true
  validates :content, length: { minimum: 12 }
  scope :approved_scope, -> { where(approved: true) }
  default_scope order('approved')
end
