json.set! 'product' do
  json.(@product, :name, :price, :description)
  json.created @product.created_at.strftime('%F')
end