module SoundCloud
  module Utils
    module Audio
      class Link < SoundCloud::Base
        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            track_id
          ]
        end

        def data
          audio_link
        rescue Faraday::ForbiddenError, Faraday::UnauthorizedError
          alternative_audio_link
        end

        def audio_link
          response_data['http_mp3_128_url']
        end

        def link
          "#{BASE_LINK}/tracks/#{@args[:track_id]}/streams"
        end

        def params
          {}
        end

        def alternative_audio_link
          SoundCloud::Utils::Audio::AlternativeLink.call(
            track_id: @args[:track_id],
            link: @args[:link]
          )
        end
      end
    end
  end
end
