class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.references :project, index: true, foreign_key: true
      t.text :description
      t.integer :value
      t.integer :quantity
      t.date :delivery
      t.string :ships_to

      t.timestamps null: false
    end
  end
end
