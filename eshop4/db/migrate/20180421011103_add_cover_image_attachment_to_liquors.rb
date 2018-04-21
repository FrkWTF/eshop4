class AddCoverImageAttachmentToLiquors < ActiveRecord::Migration
  def up
    add_attachment :liquors, :cover_image
  end

  def down
    remove_attachment :liquors, :cover_image
  end
end
