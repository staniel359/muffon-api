module Muffon
  module Processor
    module Profile
      module Bookmarks
        module Album
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :bookmark_id
              ]
            end

            def data
              bookmark_album_record.destroy!

              { success: true }
            end

            def bookmark_album_record
              profile_record
                .bookmark_albums
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
