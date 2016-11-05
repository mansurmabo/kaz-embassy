class AddAttachmentPhotoToCitizens < ActiveRecord::Migration
  def self.up
    change_table :citizens do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :citizens, :photo
  end
end
