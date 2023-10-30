module Spotify
  module Utils
    module Audio
      class Decrypter
        class File < Spotify::Utils::Audio::Decrypter
          FORMAT = 'OGG_VORBIS_160'.freeze

          private

          def primary_args
            [@args[:track_data]]
          end

          def no_data?
            false
          end

          def link
            "#{BASE_LINK}/storage-resolve/files" \
              "/audio/interactive/#{file_id}"
          end

          def file_id
            matched_file['file_id']
          end

          def matched_file
            file_ids.find do |f|
              matched_file?(f)
            end
          end

          def file_ids
            alternative_file_data ||
              file_data
          end

          def alternative_file_data
            @args[:track_data].dig(
              'alternative', 0, 'file'
            )
          end

          def file_data
            @args[:track_data]['file']
          end

          def matched_file?(file)
            file['format'] == FORMAT
          end

          alias data response_data
        end
      end
    end
  end
end
