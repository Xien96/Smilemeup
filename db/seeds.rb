products = [
  {name: "snap_up", prices:
    [
      {currency: "euro", price: 899},
      {currency: "gbp", price: 699},
      {currency: "aud", price: 1399},
      {currency: "usd", price: 999},
    ]
  },
  {name: 'clear_up', prices:
    [
      {currency: "euro", price: 1499},
      {currency: "gbp", price: 1299},
      {currency: "aud", price: 2399},
      {currency: "usd", price: 1599},
    ]
  },
  {
    name: 'impression_kit',
    prices:[
      {currency: "euro", price: 39},
      {currency: "gbp", price: 39},
      {currency: "aud", price: 39},
      {currency: "usd", price: 39}
    ]
  }
]
styles = [
  {name: "hollywood", tagline: "(The typical Hollywood smile)"},
  {name: "natural", tagline: "(Natural healthy shape)"},
  {name: "sharp", tagline: "(Edgy attractive looks)"},
  {name: "soft", tagline: "(Smooth detailed edges)"}
]
products.map do |product_hash|
  product = Product.where(name: product_hash[:name]).first_or_create!
  product_hash[:prices].map do |price_hash|
    product.product_prices.where(price_hash).first_or_create!
  end
end
styles.map do |style|
  Style.create!(style) unless Style.where(name: style[:name]).exists?
end
