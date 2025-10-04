module Spotify
  module Utils
    module Audio
      class Link
        class Key < Spotify::Utils::Audio::Link
          BASE_LINK =
            'http://localhost:3745/audiokey'.freeze

          private

          def primary_args
            [
              @args[:track_id],
              @args[:file_id]
            ]
          end

          def no_data?
            false
          end

          def data
            return test_key if test?

            if response.status != 200
              raise StandardError.new(response.body)
            end

            response
              .body
              .unpack1('H*')
          rescue Faraday::BadRequestError, Faraday::ConnectionFailed
            nil
          end

          def test_key
            'e9730e75426d748290f56f1f94074efc'
          end

          def link
            "#{BASE_LINK}/#{track_id}*#{file_id}"
          end

          def track_id
            @args[:track_id]
          end

          def file_id
            @args[:file_id]
          end
        end
      end
    end
  end
end
