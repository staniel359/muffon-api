module Muffon
  module Processor
    module Profile
      module Bookmarks
        module Artist
          class Creator < Muffon::Processor::Profile::Bookmarks::Base
            include Muffon::Utils::Artist

            private

            def primary_args
              super + [
                @args[:name]
              ]
            end

            def process_bookmark
              bookmark_artist

              return bookmark_artist.errors_data if
                  bookmark_artist.errors?

              { bookmark_id: bookmark_artist.id }
            end

            def bookmark_artist
              @bookmark_artist ||=
                profile.bookmark_artists.where(
                  artist_id: find_artist.id
                ).first_or_create
            end

            def name
              @args[:name]
            end
          end
        end
      end
    end
  end
end
