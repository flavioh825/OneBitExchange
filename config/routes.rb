Rails.application.routes.draw do
  root 'exchanges#index'
  get 'convert', to: 'exchanges#convert'
  get 'cryptocoin_convert', to: 'cryptocoins#convert'
end
