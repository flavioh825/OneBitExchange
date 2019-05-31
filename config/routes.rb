Rails.application.routes.draw do
  get 'cryptocoins/convert'
  root 'exchanges#index'
  get 'convert', to: 'exchanges#convert'
end
