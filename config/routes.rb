FTApi::Application.routes.draw do
  resources :sessions

  post 'log_in',  to: 'sessions#create',  as: 'log_in'
  post 'log_out', to: 'sessions#destroy', as: 'log_out'

  namespace :v1 do
    get 'farms/me', to: 'farms#show_current', as: 'my_farm'

    resources :transactions, except: [:new, :edit, :update]

    resources :customers, except: :edit do
      resources :transactions, except: [:edit, :update, :delete]
    end
  end

  root to: 'v1/farms#show_current'
end
