module YandexMusic
  module Utils
    module Audio
      class Link < YandexMusic::Base
        def call
          return if not_all_args? || no_data?

          data
        end

        private

        def primary_args
          [@args[:track_id]]
        end

        def no_data?
          track_data.blank?
        end

        def track_data
          @track_data ||=
            YandexMusic::Utils::Audio::Track.call(
              track_id: @args[:track_id]
            )
        end

        def data
          host, ts, path =
            response_data.values_at(
              'host', 'ts', 'path'
            )

          "https://#{host}/get-mp3/0/#{ts}#{path}"
        end

        def link
          "https:#{track_data['src']}"
        end

        def headers
          { params: }
        end

        def params
          { format: 'json' }
        end
      end
    end
  end
end
