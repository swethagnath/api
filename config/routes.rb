Rails.application.routes.draw do
	#root to: "devise/sessions#new"
  devise_for :users
end
