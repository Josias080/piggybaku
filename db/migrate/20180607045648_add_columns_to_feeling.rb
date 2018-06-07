class AddColumnsToFeeling < ActiveRecord::Migration[5.2]
  def change
    add_column :feelings, :is_buried, :boolean, default: false, null: false
    add_column :feelings, :flowers, :integer, default: 0
  end
end
