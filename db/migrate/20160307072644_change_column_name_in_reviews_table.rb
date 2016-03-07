class ChangeColumnNameInReviewsTable < ActiveRecord::Migration
  def change
    rename_column :reviews, :comment, :content
  end
end
