module Muffon
  module Profile
    module Library
      module Compatibility
        class Info < Muffon::Profile::Library::Compatibility::Base
          private

          def compatibility_data
            {
              percent:,
              artists_count:,
              albums_count:,
              tracks_count:
            }
          end

          def percent
            compatibility_percent_data.dig(
              :compatibility, :percent
            )
          end

          def compatibility_percent_data
            Muffon::Profile::Library::Compatibility::Percent.call(
              profile_id: @args[:profile_id],
              token: @args[:token],
              other_profile_id:
                @args[:other_profile_id]
            )
          end
        end
      end
    end
  end
end
