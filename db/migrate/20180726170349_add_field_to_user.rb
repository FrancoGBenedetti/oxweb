class AddFieldToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :company, :string
    add_column :users, :phone, :string, null: false
    add_column :users, :role, :integer, default: 0
  end
end
