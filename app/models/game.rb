class Game < ApplicationRecord
  enum region: [ :ntsc_u, :ntsc_j, :pal ]

  monetize :price_cents, default: nil
  monetize :price_with_manual_cents

  mount_uploader :image, ImageUploader
  serialize :images, JSON

  validates :title, presence: true
  validates :disc_quantity, presence: true

  def self.translate_region region
    I18n.t("activerecord.attributes.#{model_name.i18n_key}.region.#{region}")
  end

  def self.region_attributes_for_select
    regions.map do |region, _|
      [self.translate_region(region), region]
    end
  end
end
