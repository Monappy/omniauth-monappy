require "omniauth-oauth2"

module OmniAuth
    module Strategies
        class Monappy < OmniAuth::Strategies::OAuth2
            option :name, :monappy

            option :client_options, site: 'https://api.monappy.jp', authorize_path: '/oauth/authorize', token_path: '/oauth/token'
            option :response_type, 'code'

            option :token_params, {
                :parse => :json
            }


            uid { raw_info['id'] }

            info do
                {
                    id: raw_info['id'],
                    nickname: raw_info['nickname'],
                    mail: raw_info['mail'],
                    image: raw_info['image_url'],
                    monacoin_address: raw_info['monacoin_address']
                }
            end

            def raw_info
		puts "get..."
		@raw_info ||= JSON.parse(access_token.get('/oauth/userinfo').body)
		p @raw_info
            end

            def callback_url
                full_host + script_name + callback_path
            end
        end
    end
end
