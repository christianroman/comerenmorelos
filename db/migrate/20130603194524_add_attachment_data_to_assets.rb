class AddAttachmentDataToAssets < ActiveRecord::Migration
  def self.up
    change_table :assets do |t|
      t.attachment :data
    end
  end

  def self.down
    drop_attached_file :assets, :data
  end
end
