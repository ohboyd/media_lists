class AddMediaTypeToMedia < ActiveRecord::Migration[5.2]
  def change
    add_column :media, :media_type, :integer
    add_column :media, :reason_for_suggestion, :string
    add_column :media, :review, :string
    add_column :media, :review_date, :date
    add_column :media, :pick, :boolean, default: false, null: false
    add_column :media, :creator, :string

    add_index :media, :media_type
  end
end
