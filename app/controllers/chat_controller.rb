class ChatController < ApplicationController

  before_action :validate_access!, :except => [:chat]

  def chat
    respond_to do |format|
      format.js do
        flash[:error] = 'Unsupported request!'
        javascript_redirect_to dashboard_url
      end
      format.html do
        url = Rails.application.config.settings.get(:chat, :url)
        if(url)
          irc_username = "#{isolated_product? ? @product.internal_name : 'fission'}-#{current_user.id}"
          @chat_endpoint = URI.parse(url)
          @chat_endpoint.query = {
            :nick => current_user.username,
            :username => irc_username,
            :realname => [
              (current_user.name || current_user.username),
              isolated_product? ? @product.name : 'Fission'
            ].join(' @ ')
          }.to_query
        else
          flash[:error] = 'No chat server endpoint configured!'
          redirect_to dashboard_path
        end
      end
    end
  end

end
