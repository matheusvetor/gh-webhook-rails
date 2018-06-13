# frozen_string_literal: true

Rails.application.routes.draw do
  resources :issues, only: %i[show]
  get '/repositories/:repository_id/issues' => 'issues#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :issues, only: %i[show create]

      get 'repositories/:repository_id/issues' => 'issues#index'
    end
  end
end
