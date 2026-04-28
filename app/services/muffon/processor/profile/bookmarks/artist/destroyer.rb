module Muffon
  module Processor
    module Profile
      module Bookmarks
        module Artist
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :bookmark_id
              ]
            end

            def data
              bookmark_artist_record.destroy!

              { success: true }
            end

            def bookmark_artist_record
              profile_record
                .bookmark_artists
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
