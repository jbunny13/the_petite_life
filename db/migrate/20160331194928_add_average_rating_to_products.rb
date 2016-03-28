class AddAverageRatingToProducts < ActiveRecord::Migration
  def change
    add_column :products, :average_rating, :decimal, precision: 3, scale: 2
  end
end
