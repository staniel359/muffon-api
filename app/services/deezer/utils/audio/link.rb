module Deezer
  module Utils
    module Audio
      class Link < Deezer::Base
        BASE_LINK = 'https://media.deezer.com/v1/get_url'.freeze

        def call
          data
        end

        private

        def data
          return '' if @args[:track_id].blank?

          response_data.dig(
            'data', 0, 'media', 0,
            'sources', 0, 'url'
          ).to_s
        end

        def response
          RestClient.post(
            link, payload
          )
        end

        def link
          BASE_LINK
        end

        def payload
          {
            license_token:,
            media:,
            track_tokens:
          }.to_json
        end

        def license_token
          user_tokens[:license_token]
        end

        def media
          [audio_data]
        end

        def audio_data
          {
            type: 'FULL',
            formats: audio_formats
          }
        end

        def audio_formats
          [audio_format]
        end

        def audio_format
          {
            cipher: 'BF_CBC_STRIPE',
            format: 'MP3_128'
          }
        end

        def track_tokens
          [track_token]
        end

        def track_token
          Deezer::Utils::Token::Track.call(
            track_id: @args[:track_id]
          )[:track_token]
        end
      end
    end
  end
end
