class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.integer :brooklyn
      t.integer :downtown
      t.integer :midtown
      t.datetime :graph_timestamp 

      t.timestamps
    end
  end
end