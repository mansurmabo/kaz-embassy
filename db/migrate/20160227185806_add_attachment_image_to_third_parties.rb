class AddAttachmentImageToThirdParties < ActiveRecord::Migration
  def self.up
    change_table :third_parties do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :third_parties, :image
  end
end
