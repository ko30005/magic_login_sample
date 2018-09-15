# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/index'

  resource :magic_tokens

  get 'magic_tokens/new'
  get 'magic_tokens/create'
  get 'magic_tokens/verify'
  delete 'magic_tokens/destroy'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
