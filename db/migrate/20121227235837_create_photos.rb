class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :hashie

      t.timestamps
    end
  end
end
