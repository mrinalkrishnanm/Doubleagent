Rails.application.routes.draw do
   devise_for :users, :controllers => {:registrations => :users}
   resources :users, only: [:create,:update,:destroy,:index]
   resources :codes, only: [:create,:show,:index]
   
   post 'tokens/verify', to:'tokens#verify'
   post 'codes/search', to: 'codes#search';

end
