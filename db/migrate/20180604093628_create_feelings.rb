class CreateFeelings < ActiveRecord::Migration[5.2]
  def change
    create_table :feelings do |t|
      t.string :content
      t.monetize :price
      t.boolean :is_positive, default: false, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
