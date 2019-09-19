class ChangeStarsToDecimal < ActiveRecord::Migration[6.0]
  def change
    change_column :reviews, :stars, :decimal
  end
end
