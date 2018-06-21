class Catalogo < ApplicationRecord
  mount_uploader :url, ImageUploader
end
