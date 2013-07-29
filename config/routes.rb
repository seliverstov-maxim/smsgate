require 'sidekiq/web'

Smsgetway::Application.routes.draw do
  mount Sidekiq::Web, at: '/sidekiq'

  scope module: 'web' do
    resources :sms
  end
end
