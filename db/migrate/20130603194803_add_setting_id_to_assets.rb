class AddSettingIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :setting_id, :integer
  end
end
