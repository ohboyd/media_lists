class RemoveCommentAttributeFromReviews < ActiveRecord::Migration[6.0]
  def change
    change_column_null :reviews, :comment, true
    remove_column :reviews, :comment, :string
  end
end
