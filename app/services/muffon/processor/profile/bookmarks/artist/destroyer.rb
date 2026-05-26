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

            def not_found?
              super || bookmark_artist_record.blank?
            end

            def bookmark_artist_record
              if defined?(@bookmark_artist_record)
                @bookmark_artist_record
              else
                @bookmark_artist_record =
                  profile_record
                  .bookmark_artists
                  .find_by(
                    id: @args[:bookmark_id]
                  )
              end
            end

            def data
              bookmark_artist_record.destroy!

              { success: true }
            end
          end
        end
      end
    end
  end
end
