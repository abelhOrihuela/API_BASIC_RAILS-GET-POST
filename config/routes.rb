Rails.application.routes.draw do

  namespace :api do
    resources :kindles,format: :json
  end
  
end
