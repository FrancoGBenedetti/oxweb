class CreateCatalogos < ActiveRecord::Migration[5.1]
  def change
    create_table :catalogos do |t|
      t.string :url

      t.timestamps
    end
  end
end
