class AddAutocadToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :autocad, :string
  end
end
