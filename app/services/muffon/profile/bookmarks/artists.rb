module Muffon
  module Profile
    module Bookmarks
      class Artists < Muffon::Profile::Bookmarks::Base
        include Muffon::Utils::Pagination

        private

        def bookmarks_data
          {
            page: page,
            total_pages: total_pages_count,
            artists: artists_formatted
          }
        end

        def total_items_count
          artists.size
        end

        def artists
          @artists ||= profile.bookmark_artists
        end

        def artists_formatted
          artists_paginated.map do |a|
            artist_formatted(a)
          end
        end

        def artists_paginated
          artists_sorted
            .limit(limit)
            .offset(offset)
        end

        def artists_sorted
          artists_associated.order(
            created_at: :asc
          )
        end

        def artists_associated
          artists.includes(
            :artist
          )
        end

        def artist_formatted(artist)
          Muffon::Profile::Bookmarks::Artists::Artist.call(
            artist: artist
          )
        end
      end
    end
  end
end
