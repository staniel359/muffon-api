module SoundCloud
  module Utils
    module Audio
      class Link < SoundCloud::API::V1::Base
        def call
          return if not_all_args?

          data
        end

        private

        def primary_args
          [@args[:track_id]]
        end

        def data
          response_data[
            'http_mp3_128_url'
          ]
        rescue Faraday::ForbiddenError
          nil
        end

        def link
          "#{BASE_LINK}/tracks/#{@args[:track_id]}/streams"
        end

        def params
          {}
        end
      end
    end
  end
end
