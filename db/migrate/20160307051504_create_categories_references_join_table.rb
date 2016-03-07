class CreateCategoriesReferencesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :categories, :references do |t|
      t.index [:category_id, :reference_id]
      t.index [:reference_id, :category_id]
    end
  end
end
