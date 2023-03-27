Rails.application.routes.draw do
  resources :greetions
  resources :contacts
  resources :blogs do
    collection do
      post :confirm
    end
  end
end

# この get ‘blogs/index’ というのが、rails g controller blogs indexコマンドで生成された記述です
# 追加get''時に rails generate controller stocks index
# only: %w[new create]