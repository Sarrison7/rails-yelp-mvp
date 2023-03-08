class Review < ApplicationRecord
  belong_to :restaurant
  validates :content, presence: true

end
