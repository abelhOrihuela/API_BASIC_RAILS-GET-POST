class CreateKindles < ActiveRecord::Migration
  def change
    create_table :kindles do |t|
      t.string :inventory_id
      t.string :status

      t.timestamps null: false
    end
  end
end
