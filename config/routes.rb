# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                 user_subs POST   /users/:user_id/subs(.:format)                                                           subs#create
#              new_user_sub GET    /users/:user_id/subs/new(.:format)                                                       subs#new
#             edit_user_sub GET    /users/:user_id/subs/:id/edit(.:format)                                                  subs#edit
#                  user_sub PATCH  /users/:user_id/subs/:id(.:format)                                                       subs#update
#                           PUT    /users/:user_id/subs/:id(.:format)                                                       subs#update
#                     users GET    /users(.:format)                                                                         users#index
#                           POST   /users(.:format)                                                                         users#create
#                  new_user GET    /users/new(.:format)                                                                     users#new
#                 edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#                      user GET    /users/:id(.:format)                                                                     users#show
#                           PATCH  /users/:id(.:format)                                                                     users#update
#                           PUT    /users/:id(.:format)                                                                     users#update
#                           DELETE /users/:id(.:format)                                                                     users#destroy
#               new_session GET    /session/new(.:format)                                                                   sessions#new
#                   session DELETE /session(.:format)                                                                       sessions#destroy
#                           POST   /session(.:format)                                                                       sessions#create
#                      subs GET    /subs(.:format)                                                                          subs#index
#                       sub GET    /subs/:id(.:format)                                                                      subs#show
#                     posts POST   /posts(.:format)                                                                         posts#create
#                  new_post GET    /posts/new(.:format)                                                                     posts#new
#                 edit_post GET    /posts/:id/edit(.:format)                                                                posts#edit
#                      post GET    /posts/:id(.:format)                                                                     posts#show
#                           PATCH  /posts/:id(.:format)                                                                     posts#update
#                           PUT    /posts/:id(.:format)                                                                     posts#update
#                           DELETE /posts/:id(.:format)                                                                     posts#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do 
    resources :subs, only:[:new, :update, :create, :edit]
  end

  resource :session, only: [:new, :destroy, :create]

  resources :subs, except: [:new, :update, :create, :edit,:destroy]

  resources :posts, except: [:index]
end
