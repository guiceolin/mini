require 'omniauth'

module OmniAuth
  module Strategies
    class CeolIn < OmniAuth::Strategies::OAuth2
      # change the class name and the :name option to match your application name
      option :name, :ceolin
      option :client_id, ENV['CEOLIN_OAUTH_CLIENT_ID']
      option :client_secret, ENV['CEOLIN_OAUTH_CLIENT_SECRET']

      option :client_options, {
        :site => ENV['CEOLIN_OAUTH_CLIENT_URL'],
        :authorize_url => "/oauth/authorize"
      }

      uid { raw_info["id"] }

      info do
        {
          :email => raw_info["email"]
          # and anything else you want to return to your API consumers
        }
      end

      def callback_url
        full_host + script_name + callback_path
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me.json').parsed
      end
    end
  end
end
