module Deezer
  module Utils
    module Track
      module Audio
        class Link
          class RawLink < Deezer::Base
            BASE_LINK = 'https://media.deezer.com/v1/get_url'.freeze
            AUDIO_FORMAT = 'MP3_128'.freeze

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
              response_data.dig(
                'data',
                0,
                'media',
                0,
                'sources',
                0,
                'url'
              )
            end

            def request_url
              BASE_LINK
            end

            def request_params
              {}
            end

            def request_payload
              {
                license_token:,
                media: [{
                  type: 'FULL',
                  formats: [{
                    cipher: 'BF_CBC_STRIPE',
                    format: AUDIO_FORMAT
                  }]
                }],
                track_tokens: [track_token]
              }.to_json
            end

            def license_token
              user_tokens_data[:license_token]
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
  end
end
