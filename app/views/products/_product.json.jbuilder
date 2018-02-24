json.extract! product, :id, :cod, :tipo, :descripcion, :medidas, :material, :proveedor, :codigo-provedor, :precio-usa, :created_at, :updated_at
json.url product_url(product, format: :json)
