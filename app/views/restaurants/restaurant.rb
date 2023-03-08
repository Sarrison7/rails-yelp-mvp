class Restaurant < ApplicationRecord
  validates :name, :category, address: { in: ["chinese", "italian", "japanese", "french", "belgian"] }
end
