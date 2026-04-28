module Muffon
  module Processor
    module Profile
      module Bookmarks
        module Artist
          class Creator < Muffon::Processor::Profile::Base
            include Muffon::Mixins::Artist

            private

            def required_args
              [
                *super,
                :artist_name
              ]
            end

            def data
              bookmark_artist_record

              { bookmark_artist: bookmark_artist_data }
            end

            def bookmark_artist_record
              @bookmark_artist_record ||=
                profile_record
                .bookmark_artists
                .where(
                  artist_id: artist_record.id
                )
                .first_or_create!
            end

            def name
              @args[:artist_name]
            end

            def bookmark_artist_data
              { id: bookmark_artist_record.id }
            end
          end
        end
      end
    end
  end
end
