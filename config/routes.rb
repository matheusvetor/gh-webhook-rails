# frozen_string_literal: true

Rails.application.routes.draw do
  root 'repositories#index'

  resources :issues, only: %i[show]
  resources :repositories, only: %i[show index] do
    resources :issues, only: %i[index]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :issues, only: %i[show create]

      get 'repositories/:repository_id/issues' => 'issues#index'
    end
  end
end
