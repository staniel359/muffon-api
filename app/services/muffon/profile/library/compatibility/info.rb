module Muffon
  module Profile
    module Library
      module Compatibility
        class Info < Muffon::Profile::Library::Compatibility::Base
          private

          def compatibility_data
            {
              percent: percent,
              artists_count: artists_count,
              albums_count: albums_count,
              tracks_count: tracks_count
            }
          end

          def percent
            Muffon::Profile::Library::Compatibility::Percent.call(
              percent_args
            ).dig(:compatibility, :percent)
          end

          def percent_args
            @args.slice(
              *%i[profile_id other_profile_id]
            )
          end
        end
      end
    end
  end
end
