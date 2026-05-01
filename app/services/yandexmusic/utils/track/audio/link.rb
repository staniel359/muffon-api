module YandexMusic
  module Utils
    module Track
      module Audio
        class Link < YandexMusic::Base
          SALT = 'XGRlBW9FXlekgbPrRHuSiA'.freeze

          def call
            check_args

            return if no_data?

            data
          end

          private

          def required_args
            %i[
              track_id
            ]
          end

          def no_data?
            track_data.blank? ||
              file_raw_url.blank?
          end

          def track_data
            @track_data ||=
              YandexMusic::Utils::Track::Audio::Link::Track.call(
                track_id: @args[:track_id]
              )
          end

          def file_raw_url
            track_data['src']
          end

          def data
            "https://#{file_host}/get-mp3/#{file_path_hash}" \
              "/#{file_ts_value}#{file_path}"
          end

          def file_host
            response_data['host']
          end

          def response_data
            @response_data ||=
              Muffon::Request.call(
                url: request_url,
                method: 'GET',
                params: request_params,
                proxy: request_proxy
              )
          end

          def request_url
            "https:#{file_raw_url}"
          end

          def request_params
            { format: 'json' }
          end

          def file_path_hash
            Digest::MD5.hexdigest(
              file_path_string
            )
          end

          def file_path_string
            "#{SALT}#{file_path[1..]}#{file_s_value}"
          end

          def file_path
            response_data['path']
          end

          def file_s_value
            response_data['s']
          end

          def file_ts_value
            response_data['ts']
          end
        end
      end
    end
  end
end
