Rails.application.routes.draw do
  get 'contacts/index'
  resources :greetions
  resources :contacts
  # get 'blogs/index'
  # get '/blogs', to: 'blogs#index'
  resources :blogs do
    collection do
      post :confirm
    end
  end
end

# この get ‘blogs/index’ というのが、rails g controller blogs indexコマンドで生成された記述です
# 追加get''時に rails generate controller stocks index