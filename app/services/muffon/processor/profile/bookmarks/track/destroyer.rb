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

            def not_found?
              super || bookmark_track_record.blank?
            end

            def bookmark_track_record
              if defined?(@bookmark_track_record)
                @bookmark_track_record
              else
                @bookmark_track_record =
                  profile_record
                  .bookmark_tracks
                  .find_by(
                    id: @args[:bookmark_id]
                  )
              end
            end

            def data
              bookmark_track_record.destroy!

              { success: true }
            end
          end
        end
      end
    end
  end
end
