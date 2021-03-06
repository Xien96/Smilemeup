Rails.application.routes.draw do


  get 'dashboard/index'

  get 'dashboard/inbox'

  get 'dashboard/orders'

  get 'dashboard/users'

  get 'dashboard/settings'

  get 'dashboard/analytics'

  devise_for :users
  
  get '/'                                               =>  "static#index"
  get '/about'                                          =>  "static#about"
  get '/contact'                                        =>  "static#contact"
  get '/faq'                                            =>  "static#faq"
  get '/privacy'                                        =>  "static#privacy"
  get '/legal-statement'                                =>  "static#legal"
  get '/terms-and-conditions'                           =>  "static#terms"
  get '/distributors'                                   =>  "static#distributors"

  get '/cart'                                           =>  "cart#index"
  post 'cart/add'                                       =>  "cart#add"
  get '/products/checkout'                                    =>  "cart#cart-2"
  post '/products/checkout'                             =>  "cart#cart"
  post '/checkout'                                      => 'cart#checkout'
  post '/execute'                                        =>  'cart#execute'
  get '/blog'                                           =>  "blog#index"
  get '/blog/5-reasons-why-invest-your-money-in-invisible-teeth-straightening'                                        =>  "blog#5-reason-blog"
  get '/blog/veneers-vswhite-bleaching'                 =>  "blog#veners-vs-white"
  get '/blog/Clear-braces-VS-metal-braces'              =>  "blog#clear-vs-metal"
  get '/blog/What-to-eat-after-veneers'                 =>  "blog#what-to-eat-after-veneers"

  get '/products'                                       =>  "static#products"
  get '/products/snapup'                                =>  "static#snapup"
  get '/products/snapup/customize'                      =>  "static#snapup_order"
  
  delete '/products/item/:id'                          ,to: "cart#remove_item", as: 'delete_item'
  get '/products/clearup'                               =>  "static#clearup"
  post '/products/address'                              => "cart#address"
  post '/products/sofort'                               => "cart#sofort_pay"
  get '/sofort_check'                                   => "cart#sofort_check"
  get 'products/clearup/candidate'                      =>  "clearup#candidate"
  post 'products/clearup/candidate'                      =>  "clearup#upload"

  get 'products/clearup/confirm'                      =>  "clearup#confirm"

  get 'products/clearup/clearup_impression'             => "static#clearup_impression"

  get 'products/clearup/clearup_shop'                   => "static#clearup_shop"
  resources :conversations
  get 'inbox' => 'conversations#inbox'
  get 'my_orders' => 'orders#my_orders'
end
