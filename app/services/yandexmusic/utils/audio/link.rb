module YandexMusic
  module Utils
    module Audio
      class Link < YandexMusic::Base
        SALT = 'XGRlBW9FXlekgbPrRHuSiA'.freeze

        def call
          return if not_all_args? || no_data?

          data
        end

        private

        def primary_args
          [@args[:track_id]]
        end

        def no_data?
          track_data.blank? ||
            raw_link.blank?
        end

        def track_data
          @track_data ||=
            YandexMusic::Utils::Audio::Track.call(
              track_id: @args[:track_id]
            )
        end

        def raw_link
          track_data['src']
        end

        def data
          host, ts, path, s =
            response_data.values_at(
              'host', 'ts', 'path', 's'
            )

          path_hash =
            Digest::MD5.hexdigest(
              "#{SALT}#{path[1..]}#{s}"
            )

          "https://#{host}/get-mp3/#{path_hash}/#{ts}#{path}"
        end

        def link
          "https:#{raw_link}"
        end

        def params
          { format: 'json' }
        end
      end
    end
  end
end
