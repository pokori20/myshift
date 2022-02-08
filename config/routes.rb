Rails.application.routes.draw do
    # 管理者用
    devise_for :admin, skip: [:passwords] , controllers: {
    registrations: "admin/registrations",
    sessions: 'admin/sessions'
  }
  namespace :admin do
   root :to => 'homes#top'
   resources :publics, only: [:index, :new, :edit, :update, :show]
   resources :shops, only: [:index, :create, :edit, :update]
   resources :shifts, only: [:show, :index, :create]
   resources :submit_offs, only: [:update, :index]
   resources :order_details, only: [:update]
  end

    # 従業員用
    devise_for :publics, skip: [:passwords] , controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
   scope module: :public do
    #homesコントローー
    root to: "homes#top"
    #publicsコントローラー
    get 'publics/my_page' => 'publics#show'
    get 'publics/my_page/edit' => 'publics#edit'
    patch 'publics/update' => 'publics#update'
    #shiftsコントローラー
    resources :shifts,only:[:index, :create, :show]
   
  end
  #shiftsコントローラー

end
