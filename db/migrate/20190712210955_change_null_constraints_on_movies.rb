class ChangeNullConstraintsOnMovies < ActiveRecord::Migration[5.2]
  def change
    change_column_null :movies, :title, false
    change_column_null :movies, :suggested_by, false
  end
end
