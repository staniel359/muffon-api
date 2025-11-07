module Spotify
  module Utils
    module Audio
      class Link
        class Track < Spotify::Utils::Audio::Link
          def call
            check_args

            data
          rescue Faraday::ResourceNotFound
            raise not_found_error
          rescue Faraday::UnauthorizedError
            raise Muffon::Error::ForbiddenError
          end

          private

          def required_args
            %i[
              track_id
            ]
          end

          def link
            "#{BASE_LINK}/metadata/4/track/#{global_id}"
          end

          def global_id
            Base62
              .decode(track_id)
              .to_s(16)
              .rjust(32, '0')
          end

          alias data response_data
        end
      end
    end
  end
end
