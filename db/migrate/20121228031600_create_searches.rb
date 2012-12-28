class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :input
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
