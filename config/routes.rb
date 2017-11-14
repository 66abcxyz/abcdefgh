Rails.application.routes.draw do
  devise_for :users
  resources :users, :path => 'user' do
    collection do
  		get 'search'
  	end
  end
  resources :profiles, :path => '', :shallow => true do
    resources :posts, :path => 'conversations' do
      resources :messages, :path => 'message' do
      end
    end
  end
  get "search" => "search#show", as: :search
  root 'profiles#index'
end
