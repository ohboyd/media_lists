class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :stars
      t.boolean :pick, default: false, null: false
      t.references :medium, foreign_key: true

      t.timestamps
    end

    remove_column :media, :review, :string
    remove_column :media, :review_date, :date
    remove_column :media, :pick, :boolean, default: false, null: false
  end
end
