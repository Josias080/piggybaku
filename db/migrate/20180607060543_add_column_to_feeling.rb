class AddColumnToFeeling < ActiveRecord::Migration[5.2]
  def change
    add_column :feelings, :is_donated, :boolean, default: false, null: false
  end
end
