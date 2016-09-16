class Changelinkcounttocounter < ActiveRecord::Migration
  def change
    rename_column :links, :count, :counter
  end
end
