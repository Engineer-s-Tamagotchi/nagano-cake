Rails.application.routes.draw do
  devise_for :admin,skip:[:registrations,:passwords], controllers:{
    sessions: "admin/sessions"
  }


  devise_for :customers,skip:[:passwords], controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    root to: "homes#top"
    get "home/about" => "homes#about"

    resources :items, only:[:index,:show]

    resource :customers, only:[:show,:edit,:update] do
      get "unsubscribe" => "customers#unsubscribe"
      patch "quit" => "customers/quit"
    end

    resources :cart_items, only:[:index,:update,:destroy,:create] do
      delete "destroy_all" => "cart_items#destroy_all"
    end

    resources :orders, only:[:new,:create,:index,:show] do
      post "confirm" => "orders#confirm"
      get "complete" => "orders#complete"
    end

    resources :addresses, except:[:new,:show]

  end




  namespace :admin do

    root to: "homes#top"

    resources :items, except:[:destroy]
    resources :genres, only:[:index,:create,:edit,:update]
    resources :customers, only:[:index,:show,:edit,:update]
    resources :orders, only:[:show,:update] do
      resources :order_details, only:[:update]
    end


  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
