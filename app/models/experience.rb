class Experience < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 255 }
  validates :year, numericality: true, length: { is: 4 }
end
