module YandexMusic
  module Utils
    module Track
      module Audio
        class Link < YandexMusic::Base
          REQUEST_BASE_URL =
            'https://api.music.yandex.net/get-file-info'.freeze
          REQUEST_DATA = {
            'quality' => 'nq',
            'codecs' => 'aac-mp4',
            'transports' => 'raw'
          }.freeze
          SIGNATURE_HMAC_SECRET = '7tvSmFbyf5hJnIHhCimDDD'.freeze

          def call
            check_args

            data
          rescue Faraday::BadRequestError
            raise bad_request_error
          end

          private

          def required_args
            %i[
              track_id
            ]
          end

          def data
            response_data.dig(
              'downloadInfo',
              'url'
            )
          end

          def response_data
            Muffon::Request.call(
              url: request_url,
              method: 'GET',
              params: request_params,
              headers: request_headers,
              proxy: request_proxy
            )
          end

          def request_url
            REQUEST_BASE_URL
          end

          def request_params
            {
              'ts' => timestamp,
              'trackId' => @args[:track_id],
              'quality' => REQUEST_DATA['quality'],
              'codecs' => REQUEST_DATA['codecs'],
              'transports' => REQUEST_DATA['transports'],
              'sign' => signature
            }
          end

          def timestamp
            return '1777725157' if test?

            @timestamp ||= current_time.to_i
          end

          def signature
            Base64.strict_encode64(
              hmac_signature
            )[0...-1]
          end

          def hmac_signature
            OpenSSL::HMAC.digest(
              'sha256',
              SIGNATURE_HMAC_SECRET,
              raw_signature
            )
          end

          def raw_signature
            [
              timestamp,
              @args[:track_id],
              REQUEST_DATA['quality'],
              REQUEST_DATA['codecs'],
              REQUEST_DATA['transports']
            ].join
          end
        end
      end
    end
  end
end
