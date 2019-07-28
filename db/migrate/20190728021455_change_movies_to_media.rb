class ChangeMoviesToMedia < ActiveRecord::Migration[5.2]
  def change
    rename_table :movies, :media
  end
end
