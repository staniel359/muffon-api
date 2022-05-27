module SoundCloud
  module Utils
    module Audio
      class Link < SoundCloud::API::V1::Base
        private

        def primary_args
          [@args[:track_id]]
        end

        def data
          response_data[
            'http_mp3_128_url'
          ]
        rescue RestClient::Forbidden
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
