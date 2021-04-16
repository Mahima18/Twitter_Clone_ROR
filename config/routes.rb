Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tweets#index'

  resources :tweets

  resources :users do
  	collection do
  		get :normal_users
  	end

  	collection do
  		get :get_all_tweets
  	end
  end
end
