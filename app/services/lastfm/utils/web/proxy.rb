module LastFM
  module Utils
    module Web
      module Proxy
        include LastFM::Utils::Web

        private

        def response
          Muffon::Utils::Proxy.call(
            link:,
            params:,
            cookies:
          )
        end
      end
    end
  end
end
