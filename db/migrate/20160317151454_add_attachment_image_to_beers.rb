class AddAttachmentImageToBeers < ActiveRecord::Migration
  def self.up
    change_table :beers do |t|
      t.attachment :beer_image
    end
  end

  def self.down
    remove_attachment :beers, :beer_image
  end
end
