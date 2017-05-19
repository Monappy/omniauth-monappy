require "omniauth-oauth2"

module OmniAuth
    module Strategies
        class Monappy < OmniAuth::Strategies::OAuth2
            option :name, :monappy

            option :client_options, site: 'https://api.monappy.jp', authorize_path: '/oauth/authorize'

            uid { raw_info['User']['id'] }

            info do
                {
                    id: raw_info['User']['id'],
                    id: raw_info['User']['nickname'],
                    id: raw_info['User']['mail'],
                    id: raw_info['User']['id'],
                }
            end

            def raw_info
                @raw_info ||= access_token.get('/oauth/userinfo').parsed
            end

            def callback_url
                full_host + script_name + callback_path
            end
        end
    end
end
