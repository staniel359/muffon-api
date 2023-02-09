module Deezer
  module Utils
    module Audio
      class Binary < Deezer::Base
        def call
          return if not_all_args? || no_data?

          data
        end

        private

        def primary_args
          [@args[:track_id]]
        end

        def no_data?
          raw_audio_link.blank?
        end

        def raw_audio_link
          @raw_audio_link ||=
            Deezer::Utils::Audio::Link.call(
              track_id: @args[:track_id]
            )
        end

        def data
          RestClient.get(
            raw_audio_link
          )
        rescue RestClient::Forbidden
          nil
        end
      end
    end
  end
end
