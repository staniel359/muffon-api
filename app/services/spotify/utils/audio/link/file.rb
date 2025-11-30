module Spotify
  module Utils
    module Audio
      class Link
        class File < Spotify::Utils::Audio::Link
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

          def link
            "#{BASE_LINK}/storage-resolve/v2/files" \
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

          alias data response_data
        end
      end
    end
  end
end
