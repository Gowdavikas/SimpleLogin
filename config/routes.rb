Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/top_headlines', to: 'news#top_headlines'
  get '/all_articles', to: 'news#all_articles'
  get '/sources', to: 'news#sources'
end 