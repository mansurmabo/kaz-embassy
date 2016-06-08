class AddAttachmentImageToCoEvents < ActiveRecord::Migration
  def self.up
    change_table :co_events do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :co_events, :image
  end
end
