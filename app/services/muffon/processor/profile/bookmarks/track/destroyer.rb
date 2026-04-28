module Muffon
  module Processor
    module Profile
      module Bookmarks
        module Track
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :bookmark_id
              ]
            end

            def data
              bookmark_track_record.destroy!

              { success: true }
            end

            def bookmark_track_record
              profile_record
                .bookmark_tracks
                .find_by(
                  id: @args[:bookmark_id]
                )
            end
          end
        end
      end
    end
  end
end
