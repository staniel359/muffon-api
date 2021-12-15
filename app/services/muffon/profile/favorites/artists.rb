module Muffon
  module Profile
    module Favorites
      class Artists < Muffon::Profile::Favorites::Base
        COLLECTION_NAME = 'artists'.freeze
        include Muffon::Utils::Pagination

        private

        def total_items_count
          artists.size
        end

        def artists
          @artists ||= profile.favorite_artists
        end

        def collection
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
          Muffon::Profile::Favorites::Artists::Artist.call(
            artist: artist
          )
        end
      end
    end
  end
end
