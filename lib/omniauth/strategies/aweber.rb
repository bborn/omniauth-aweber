require 'omniauth-oauth2'
require 'multi_json'


module OmniAuth
  module Strategies
    class Aweber < OmniAuth::Strategies::OAuth2

      option :name, 'aweber'
      option :scope, 'account.read email.read list.read'
      option :client_options, {
        :authorize_url => 'https://auth.aweber.com/oauth2/authorize',
        :token_url => 'https://auth.aweber.com/oauth2/token'
      }

      def callback_url
        full_host + script_name + callback_path
      end

      # credentials do
      #   hash = {"token" => access_token.token}
      #   hash["refresh_token"] = access_token.refresh_token
      #   hash["expires"] = true
      #   hash
      # end      

      uid { raw_info['id'] }

      info do
        {
          id: raw_info['id']
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get('https://api.aweber.com/1.0/accounts').body)['entries'].first
      end
    end
  end
end

# OmniAuth.config.add_camelization 'aweber', 'Aweber'
