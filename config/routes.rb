Rails.application.routes.draw do
  scope :api do
    post 'statistics', to: 'statistics#update'
  end
end
