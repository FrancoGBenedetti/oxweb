class AddSessionToOrden < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :session, :string
  end
end
