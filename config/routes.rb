Rails.application.routes.draw do
   devise_for :users, :controllers => {:registrations => :users}
   resources :users, only: [:create,:update,:destroy,:index]

   post 'tokens/verify', to:'tokens#verify'
end
