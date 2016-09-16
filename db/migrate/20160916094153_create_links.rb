class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :short
      t.integer :count, default: 0

      t.timestamps null: false
    end
  end
end
