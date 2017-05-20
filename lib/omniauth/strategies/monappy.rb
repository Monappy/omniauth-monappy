require "omniauth-oauth2"

module OmniAuth
    module Strategies
        class Monappy < OmniAuth::Strategies::OAuth2
            option :name, :monappy

            option :client_options, site: 'https://api.monappy.jp', authorize_path: '/oauth/authorize', token_path: '/oauth/token'
            option :response_type, 'code'


            uid { raw_info['User']['id'] }

            info do
                {
                    id: raw_info['User']['id'],
                    nickname: raw_info['User']['nickname'],
                    mail: raw_info['User']['mail'],
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
