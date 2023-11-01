module Deezer
  module Utils
    module Audio
      class Decrypter < Deezer::Base
        def call
          return if not_all_args? || no_data?

          data
        end

        private

        def primary_args
          [@args[:track_id]]
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

        def headers
          nil
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
