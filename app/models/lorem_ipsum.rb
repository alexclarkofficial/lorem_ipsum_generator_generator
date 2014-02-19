class LoremIpsum < ActiveRecord::Base
  belongs_to :generator, dependent: :destroy
  validates :generator_id, presence: true
  validates :content, length: { minimum: 12 }
end
