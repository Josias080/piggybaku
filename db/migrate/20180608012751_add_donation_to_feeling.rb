class AddDonationToFeeling < ActiveRecord::Migration[5.2]
  def change
    add_column :feelings, :donation, :jsonb
  end
end
