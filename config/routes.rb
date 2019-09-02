Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#show'
  resources :users do
    resources :bank_accounts do
      collection do
        get'amount_transfer'
        post 'transfer'
      end
      resources :transactions
    end
  end
end
