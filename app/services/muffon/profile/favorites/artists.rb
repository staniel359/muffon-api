module Muffon
  module Profile
    module Favorites
      class Artists < Muffon::Profile::Favorites::Base
        include Muffon::Utils::Pagination

        private

        def favorites_data
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
          @artists ||= profile.favorite_artists
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
            created_at: :desc
          )
        end

        def artists_associated
          artists.includes(
            :artist
          )
        end

        def artist_formatted(artist)
          Muffon::Profile::Favorites::Artists::Artist.call(
            artist: artist
          )
        end
      end
    end
  end
end
