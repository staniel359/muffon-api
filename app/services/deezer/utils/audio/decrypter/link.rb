module Deezer
  module Utils
    module Audio
      class Decrypter
        class Link < Deezer::Utils::Audio::Decrypter
          BASE_LINK =
            'https://media.deezer.com/v1/get_url'.freeze
          FORMAT = 'MP3_128'.freeze

          private

          def primary_args
            [@args[:track_id]]
          end

          def no_data?
            false
          end

          def data
            response_data.dig(
              'data', 0, 'media', 0,
              'sources', 0, 'url'
            )
          rescue Faraday::BadRequestError, Faraday::ForbiddenError, Faraday::UnprocessableEntityError
            nil
          end

          def link
            BASE_LINK
          end

          def payload
            {
              license_token:,
              media: [audio_data],
              track_tokens: [track_token]
            }.to_json
          end

          def license_token
            user_tokens[:license_token]
          end

          def audio_data
            {
              type: 'FULL',
              formats: [audio_format]
            }
          end

          def audio_format
            {
              cipher: 'BF_CBC_STRIPE',
              format: FORMAT
            }
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
