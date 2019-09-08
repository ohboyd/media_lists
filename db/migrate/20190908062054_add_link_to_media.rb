class AddLinkToMedia < ActiveRecord::Migration[5.2]
  def change
    add_column :media, :link, :string
  end
end
