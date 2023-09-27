class CreateShoeStores < ActiveRecord::Migration[7.0]
  def change
    create_table :shoe_stores do |t|
      t.string :name

      t.timestamps
    end
  end
end
