class AddDurationToCampaigns < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :duration, :integer
  end
end
