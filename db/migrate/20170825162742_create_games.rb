class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string  :title
      t.string  :image
      t.float   :price
      t.float   :price_with_manual
      t.boolean :is_available

      t.timestamps
    end
  end
end
