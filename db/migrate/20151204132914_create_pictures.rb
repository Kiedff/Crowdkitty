class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :image
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
