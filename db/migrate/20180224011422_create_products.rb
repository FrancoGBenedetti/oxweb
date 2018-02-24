class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :cod
      t.string :tipo
      t.string :descripcion
      t.string :medidas
      t.string :material
      t.string :proveedor
      t.string :codigo_provedor
      t.string :precio_usa

      t.timestamps
    end
  end
end
