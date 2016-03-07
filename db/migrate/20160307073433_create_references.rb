class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :name
      t.text :uri
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
