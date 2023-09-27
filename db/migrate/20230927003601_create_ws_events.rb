class CreateWsEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :ws_events do |t|
      t.references :shoe_store, null: false, foreign_key: true
      t.references :shoe_model, null: false, foreign_key: true
      t.integer :qty_left

      t.timestamps
    end
  end
end
