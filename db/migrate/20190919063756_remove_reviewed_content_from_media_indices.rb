class RemoveReviewedContentFromMediaIndices < ActiveRecord::Migration[6.0]
  def change
    add_column :media, :reviewed, :boolean, default: false, null: false
  end
end
