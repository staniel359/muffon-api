module Muffon
  module Utils
    module Request
      module Client
        private

        def set_cookies(
          headers:,
          cookies:
        )
          return if cookies.blank?

          headers['Cookie'] =
            cookie_formatted(
              cookies
            )
        end

        def cookie_formatted(cookies)
          cookies
            .map do |array|
              array.join('=')
            end
            .join(
              '; '
            )
        end

        def client(
          proxy:,
          params: {},
          is_redirect: true,
          payload: nil
        )
          Faraday.new(
            params:,
            proxy:,
            request: request_options
          ) do |connection|
            set_connection(
              connection:,
              is_redirect:,
              payload:
            )
          end
        end

        def set_connection(
          connection:,
          is_redirect: true,
          payload: nil
        )
          connection.response(
            :raise_error
          )

          if is_redirect
            connection.response(
              :follow_redirects
            )
          end

          if payload.is_a?(String)
            connection.request(
              :json
            )
          else
            connection.request(
              :url_encoded
            )
          end
        end

        def request_options
          {
            params_encoder:
              Faraday::FlatParamsEncoder
          }
        end

        def get_cookie(
          response:,
          cookie:
        )
          cookies =
            response.headers['set-cookie']

          cookies
            &.match(
              /#{cookie}=(\S+);/
            ).try(
              :[], 1
            )
        end
      end
    end
  end
end

module Faraday
  module FlatParamsEncoder
    def self.escape(arg)
      if arg.is_a?(String) && arg.include?('=')
        arg
      else
        Faraday::Utils.escape(arg)
      end
    end
  end
end
