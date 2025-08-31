module Muffon
  module Processor
    module Profile
      module Bookmarks
        module Artist
          class Creator < Muffon::Processor::Profile::Bookmarks::Base
            include Muffon::Utils::Artist

            private

            def required_args
              super + %i[
                artist_name
              ]
            end

            def process_bookmark
              bookmark_artist

              {
                bookmark_artist:
                  bookmark_artist_data
              }
            end

            def bookmark_artist
              @bookmark_artist ||=
                profile
                .bookmark_artists
                .where(
                  artist_id: find_artist.id
                )
                .first_or_create!
            end

            def name
              @args[:artist_name]
            end

            def bookmark_artist_data
              { id: bookmark_artist.id }
            end
          end
        end
      end
    end
  end
end
