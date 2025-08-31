module YandexMusic
  module Utils
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
            raw_link.blank?
        end

        def track_data
          @track_data ||=
            YandexMusic::Utils::Audio::Link::Track.call(
              track_id: @args[:track_id]
            )
        end

        def raw_link
          track_data['src']
        end

        def data
          first,
          second,
          third,
          fourth =
            response_data.values_at(
              'host',
              'ts',
              'path',
              's'
            )

          path_string =
            "#{SALT}#{third[1..]}#{fourth}"

          path_hash =
            Digest::MD5.hexdigest(
              path_string
            )

          "https://#{first}/get-mp3/#{path_hash}/#{second}#{third}"
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
