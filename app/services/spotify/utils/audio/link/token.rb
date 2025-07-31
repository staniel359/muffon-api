module Spotify
  module Utils
    module Audio
      class Link
        class Token < Spotify::Base
          BASE_LINK =
            'http://localhost:3745/access_token'.freeze

          def call
            data
          end

          private

          def data
            response_data['token']
          end

          def link
            BASE_LINK
          end
        end
      end
    end
  end
end
