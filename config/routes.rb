Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  resources :users, except: [:new, :create]

  scope module: 'mailbox' do
    get 'inbox', to: 'mailbox#inbox'

    resources :mailboxer_conversations, path: 'conversations', except: [:index], controller: 'conversations'
  end
end
