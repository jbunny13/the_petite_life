class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :name
      t.text :uri

      t.timestamps null: false
    end
  end
end
