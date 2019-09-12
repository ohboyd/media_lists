class AddDatabaseConstraintsForRequiredFields < ActiveRecord::Migration[5.2]
  def change
    change_column_null :media, :media_type, false
    change_column_null :reviews, :comment, false
    change_column_null :reviews, :stars, false
    change_column_null :reviews, :medium_id, false
  end
end
