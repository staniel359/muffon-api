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

            def not_found?
              super || bookmark_album_record.blank?
            end

            def bookmark_album_record
              if defined?(@bookmark_album_record)
                @bookmark_album_record
              else
                @bookmark_album_record =
                  profile_record
                  .bookmark_albums
                  .find_by(
                    id: @args[:bookmark_id]
                  )
              end
            end

            def data
              bookmark_album_record.destroy!

              { success: true }
            end
          end
        end
      end
    end
  end
end
