# frozen_string_literal: true

Rails.application.routes.draw do
  resources :issues, only: %i[show create]
end
