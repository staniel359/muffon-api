module Spotify
  module Utils
    module Audio
      class Link
        class Token
          class Secret < Spotify::Base
            def call
              return forbidden unless correct_extra_token?

              data
            end

            private

            def correct_extra_token?
              @args[:extra_token] ==
                secrets.spotify[:token_secret_extra_token]
            end

            def data
              {
                secret: secret_data['secret'],
                version: secret_data['version']
              }
            end

            def secret_data
              @secret_data ||=
                response_data.sort_by do |data|
                  data['version']
                end.last
            end

            def link
              secrets.spotify[:token_secret_link]
            end

            def headers
              {}
            end
          end
        end
      end
    end
  end
end
