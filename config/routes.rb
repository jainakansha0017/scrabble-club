Rails.application.routes.draw do
  root "members#index"
  resources :members, except: [:show, :delete] do
  	collection do
  		get 'leader_board'
  	end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
