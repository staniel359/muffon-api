module Muffon
  module Profile
    module Favorites
      class Albums < Muffon::Profile::Favorites::Base
        include Muffon::Utils::Pagination

        private

        def favorites_data
          {
            page: page,
            total_pages: total_pages_count,
            albums: albums_formatted
          }
        end

        def total_items_count
          albums.size
        end

        def albums
          @albums ||= profile.favorite_albums
        end

        def albums_formatted
          albums_paginated.map do |a|
            album_formatted(a)
          end
        end

        def albums_paginated
          albums_sorted
            .limit(limit)
            .offset(offset)
        end

        def albums_sorted
          albums_associated.order(
            created_at: :desc
          )
        end

        def albums_associated
          albums.includes(
            :album,
            [album: :artist]
          )
        end

        def album_formatted(album)
          Muffon::Profile::Favorites::Albums::Album.call(
            album: album
          )
        end
      end
    end
  end
end
