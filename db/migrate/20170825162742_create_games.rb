class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string     :title
      t.string     :image
      t.monetize   :price
      t.monetize   :price_with_manual
      t.boolean    :is_available

      t.timestamps
    end
  end
end
