class AddAttachmentLogoImageBgImageToGenerators < ActiveRecord::Migration
  def self.up
    change_table :generators do |t|
      t.attachment :logo
      t.attachment :image
      t.attachment :bg_image
    end
  end

  def self.down
    drop_attached_file :generators, :logo
    drop_attached_file :generators, :image
    drop_attached_file :generators, :bg_image
  end
end
