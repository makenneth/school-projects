Rails.application.routes.draw do
<<<<<<< HEAD
  root to: 'static_pages#root'

  namespace :api, defaults: {format: :json} do
    resources :pokemon, only: [:create, :destroy, :index, :show, :update]
    resources :toys, only: [:show, :update]
  end
end

=======
   root "bands#index"
   resources :users, except: [:update, :edit] do
      collection do #collection? or member?
         get 'activate'#get? 
      end
   end
   resource :session, only: [:new, :create, :destroy]

   resources :bands do
      resources :albums, only: [:new]
   end

   resources :albums, except: [:new, :index] do
      resources :tracks, only: [:new]
   end

   resources :tracks, except: [:new, :index] do
      resources :notes, only: [:new, :create, :show]
   end

   resources :notes, except: [:new, :create, :show]
end
>>>>>>> old_a/master
