class Game < ApplicationRecord
  monetize :price_cents
  monetize :price_with_manual_cents

  mount_uploader :image, ImageUploader
  serialize :images, JSON
end
