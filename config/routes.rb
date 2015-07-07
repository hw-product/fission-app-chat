Rails.application.routes.draw do
  get :chat, :to => 'chat#chat', :as => :chat
end
