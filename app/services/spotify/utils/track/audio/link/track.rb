module Spotify
  module Utils
    module Track
      module Audio
        class Link
          class Track < Spotify::Utils::Track::Audio::Link
            def call
              check_args

              check_if_not_found

              data
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

            def response_data
              @response_data ||=
                Muffon::Request.call(
                  url: request_url,
                  method: 'GET',
                  params: request_params,
                  headers: request_headers
                )
            end

            def request_url
              "#{REQUEST_BASE_URL}/track-playback/v1/media/#{spotify_track_uri}"
            end

            def spotify_track_uri
              "spotify:track:#{@args[:track_id]}"
            end

            def request_params
              { 'manifestFileFormat' => 'file_ids_mp4' }
            end

            alias data response_data
          end
        end
      end
    end
  end
end
