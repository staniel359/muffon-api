module Spotify
  module Utils
    module Track
      module Audio
        class Link
          class File < Spotify::Utils::Track::Audio::Link
            def call
              check_args

              data
            end

            private

            def required_args
              %i[
                track_data
              ]
            end

            def data
              Muffon::Request.call(
                url: request_url,
                method: 'GET',
                params: request_params,
                headers: request_headers
              )
            end

            def request_url
              "#{REQUEST_BASE_URL}/storage-resolve/v2/files" \
                "/audio/interactive/10/#{file_id}"
            end

            def file_id
              files.find do |file_data|
                file_data['format'] == '10' # MP4_128
              end['file_id']
            end

            def files
              @args[:track_data]['media'].first.dig(
                1,
                'item',
                'manifest',
                'file_ids_mp4'
              )
            end
          end
        end
      end
    end
  end
end
