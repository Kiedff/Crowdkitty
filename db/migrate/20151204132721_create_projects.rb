class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :target
      t.date :start_date
      t.date :end_date
      t.references :user, index: true, foreign_key: true
      t.string :location
      t.text :summary
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
