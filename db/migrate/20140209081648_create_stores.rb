class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :coffee

      t.timestamps
    end
  end
end
