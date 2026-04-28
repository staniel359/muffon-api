module Muffon
  module Processor
    module Profile
      module Favorites
        module Track
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :favorite_id
              ]
            end

            def data
              favorite_track_record.destroy!

              { success: true }
            end

            def favorite_track_record
              profile_record
                .favorite_tracks
                .find_by(
                  id: @args[:favorite_id]
                )
            end
          end
        end
      end
    end
  end
end
