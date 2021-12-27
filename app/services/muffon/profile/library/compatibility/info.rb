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
            compatibility_percent_data.dig(
              :compatibility, :percent
            )
          end

          def compatibility_percent_data
            Muffon::Profile::Library::Compatibility::Percent.call(
              percent_args
            )
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
