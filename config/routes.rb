Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'gallery#index'

  resources :gallery, only: [:create, :show] do
    post :add_image, on: :member
    post :add_similar_images, on: :member
    get :similar_images, on: :member
  end
end
