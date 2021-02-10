json.set! 'products' do # setting the keyword for json response
  json.array! @products do |product|
    json.(product, :name, :price)
    json.created product.created_at.strftime('%F')
  end
end
