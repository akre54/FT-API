FTApi::Application.routes.draw do
  resources :sessions

  get 'farms/me', to: 'farms#show_current', as: 'my_farm'

  post 'log_in',  to: 'sessions#create',  as: 'log_in'
  post 'log_out', to: 'sessions#destroy', as: 'log_out'

  resources :transactions, except: [:new, :edit, :update]

  resources :customers, except: :edit do
    resources :transactions, except: [:edit, :update, :delete]
  end

  root to: 'farms#show_current'
end
