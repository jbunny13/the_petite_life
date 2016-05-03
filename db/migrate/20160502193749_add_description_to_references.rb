class AddDescriptionToReferences < ActiveRecord::Migration
  def change
    add_column :references, :description, :string
  end
end
