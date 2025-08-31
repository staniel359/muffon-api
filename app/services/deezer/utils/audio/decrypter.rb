module Deezer
  module Utils
    module Audio
      class Decrypter < Deezer::Base
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
          link.blank?
        end

        def link
          @link ||=
            Deezer::Utils::Audio::Decrypter::Link.call(
              track_id:
            )
        end

        def track_id
          @args[:track_id]
        end

        def params
          {}
        end

        def data
          Deezer::Utils::Audio::Decrypter::Binary.call(
            link:,
            track_id:
          )
        end
      end
    end
  end
end
