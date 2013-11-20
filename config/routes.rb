FTApi::Application.routes.draw do
  resources :sessions

  get '/farms/me' => 'v1/farms#show_current', as: 'my_farm'
  get 'log_in' => 'sessions#new', as: 'log_in'
  get 'log_out' => 'sessions#destroy', as: 'log_out'

  resources :transactions, except: [:new, :edit, :update]

  resources :farms, except: [:show, :edit, :delete]

  resources :customers, except: :edit do
    resources :transactions, except: [:edit, :update, :delete]
  end

  root to: 'farms#index'
end
