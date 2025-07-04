module LastFM
  module Utils
    module Web
      module Proxy
        include LastFM::Utils::Web

        private

        def response
          format_get_request(
            link:,
            params:,
            headers:,
            cookies:,
            proxy:
          )
        end

        def proxy
          secrets.proxy[:us]
        end

        def headers
          { 'User-Agent' => Muffon::Utils::Request::USER_AGENT }
        end
      end
    end
  end
end
