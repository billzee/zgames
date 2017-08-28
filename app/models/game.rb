class Game < ApplicationRecord
  enum regions: [ :ntsc_u, :ntsc_j, :pal ]

  monetize :price_cents
  monetize :price_with_manual_cents

  mount_uploader :image, ImageUploader
  serialize :images, JSON

  validates :title, presence: true
  validates :disc_quantity, presence: true

  def self.region_attributes_for_select
    regions.map do |region, _|
      [I18n.t("activerecord.attributes.#{model_name.i18n_key}.regions.#{region}"), region]
    end
  end
end
