module Spotify
  module Utils
    module Audio
      class Link
        class GlobalId < Spotify::Utils::Audio::Link
          private

          def primary_args
            [@args[:track_id]]
          end

          def no_data?
            false
          end

          def data
            Base62
              .decode(track_id)
              .to_s(16)
              .rjust(32, '0')
          end

          def track_id
            @args[:track_id]
          end
        end
      end
    end
  end
end
