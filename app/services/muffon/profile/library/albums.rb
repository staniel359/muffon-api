module Muffon
  module Profile
    module Library
      class Albums < Muffon::Profile::Library::Base
        include Muffon::Utils::Pagination

        private

        def library_data
          {
            page: page,
            total_pages: total_pages_count,
            albums: albums_formatted
          }
        end

        def total_items_count
          albums.size
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
          albums_associated
            .order(
              profile_tracks_count: :desc,
              created_at: :asc
            )
        end

        def albums_associated
          albums
            .includes(
              :album,
              [profile_artist: :artist],
              [image_attachment: :blob]
            )
        end

        def album_formatted(album)
          Muffon::Profile::Library::Albums::Album.call(
            album: album
          )
        end
      end
    end
  end
end
