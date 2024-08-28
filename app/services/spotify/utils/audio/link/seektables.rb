module Spotify
  module Utils
    module Audio
      class Link
        class Seektables < Spotify::Utils::Audio::Link
          private

          def primary_args
            [@args[:file_id]]
          end

          def no_data?
            false
          end

          def link
            "https://seektables.scdn.co/seektable/#{file_id}.json"
          end

          def file_id
            @args[:file_id]
          end

          def data
            response_data
          rescue Faraday::ResourceNotFound
            nil
          end
        end
      end
    end
  end
end
