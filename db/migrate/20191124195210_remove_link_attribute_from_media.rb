class RemoveLinkAttributeFromMedia < ActiveRecord::Migration[6.0]
  def change
    remove_column :media, :link, :string
  end
end
