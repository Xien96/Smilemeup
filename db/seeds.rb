Product.create!([
  {name: "snap_up"},
  {name: "clear_up"},
  {name: "impression_kit"}
])
ProductPrice.create!([
  {product_id: 1, currency: "eur", price: 899},
  {product_id: 1, currency: "gbp", price: 699},
  {product_id: 1, currency: "aud", price: 1399},
  {product_id: 1, currency: "usd", price: 999},
  {product_id: 2, currency: "eur", price: 1499},
  {product_id: 2, currency: "gbp", price: 1299},
  {product_id: 2, currency: "aud", price: 2399},
  {product_id: 2, currency: "usd", price: 1599},
  {product_id: 3, currency: "eur", price: 39},
  {product_id: 3, currency: "gbp", price: 39},
  {product_id: 3, currency: "aud", price: 39},
  {product_id: 3, currency: "usd", price: 39}
])
Style.create!([
  {name: "hollywood", tagline: "(The typical Hollywood smile)"},
  {name: "natural", tagline: "(Natural healthy shape)"},
  {name: "sharp", tagline: "(Edgy attractive looks)"},
  {name: "soft", tagline: "(Smooth detailed edges)"}
])
