Rails.application.routes.draw do
  get "events/index"
  get "events/show"
  get "events/new"
  get "events/create"
  get "events/edit"
  get "events/update"
  get "events/destroy"
  devise_for :users

  resources :events do
    resources :attendances, only: [ :create, :destroy ]

    collection do
      get :attending
      get :created
    end
  end

  root "events#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
