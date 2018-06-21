class CatalogosController < ApplicationController

  def create
    @catalogo = Catalogo.new(catalogo_params)
    @catalogo.save
    redirect_to admin_dashboard_path
  end


  def update
    @catalogo = Catalogo.last
    @catalogo.update(catalogo_params)
    redirect_to admin_dashboard_path
  end

  def download_catalogo
    image = Catalogo.last.url
    if image.try(:file).exists?
      data = open(image.url)
      send_data data.read, type: data.content_type, x_sendfile: true
    end
  end

  private
    def catalogo_params
      params.require(:catalogo).permit(:url)
    end
end
