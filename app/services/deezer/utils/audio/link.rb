module Deezer
  module Utils
    module Audio
      class Link < Deezer::Utils::Base
        def call
          return '' if @args.track_id.blank?

          data
        end

        private

        def data
          response_data.dig(
            'data', 0, 'media', 0, 'sources', 0, 'url'
          ).to_s
        end

        def response_data
          JSON.parse(response)
        end

        def response
          RestClient.post(link, payload)
        end

        def link
          'https://media.deezer.com/v1/get_url'
        end

        def payload
          {
            license_token: user_tokens[:license_token],
            media: [audio_data],
            track_tokens: [track_token]
          }.to_json
        end

        def audio_data
          { type: 'FULL', formats: [audio_format] }
        end

        def audio_format
          { cipher: 'BF_CBC_STRIPE', format: 'MP3_128' }
        end

        def track_token
          Deezer::Utils::Tokens::Track.call(
            track_id: @args.track_id
          )[:track_token]
        end
      end
    end
  end
end
