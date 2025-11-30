module Spotify
  module Utils
    module Audio
      class Link
        class Track < Spotify::Utils::Audio::Link
          def call
            check_args

            check_if_not_found

            data
          rescue Faraday::UnauthorizedError
            raise Muffon::Error::ForbiddenError
          end

          private

          def required_args
            %i[
              track_id
            ]
          end

          def not_found?
            response_data['media'].blank?
          end

          def link
            "#{BASE_LINK}/track-playback/v1/media/#{spotify_track_uri}"
          end

          def spotify_track_uri
            "spotify:track:#{@args[:track_id]}"
          end

          def params
            { 'manifestFileFormat' => 'file_ids_mp4' }
          end

          alias data response_data
        end
      end
    end
  end
end
