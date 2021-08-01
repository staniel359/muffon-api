module Muffon
  module Profile
    module Library
      class Artists < Muffon::Profile::Library::Base
        include Muffon::Utils::Pagination

        private

        def library_data
          {
            page: page,
            total_pages: total_pages_count,
            top_tracks_count: top_tracks_count,
            top_albums_count: top_albums_count,
            artists: artists_formatted
          }
        end

        def top_tracks_count
          return 0 if artists.blank?

          artists_tracks_count_sorted
            .first
            .profile_tracks_count
        end

        def artists_tracks_count_sorted
          artists.order(
            profile_tracks_count: :desc
          )
        end

        def top_albums_count
          return 0 if artists.blank?

          artist_albums_count_sorted
            .first
            .profile_albums_count
        end

        def artist_albums_count_sorted
          artists.order(
            profile_albums_count: :desc
          )
        end

        def total_items_count
          artists.size
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
          artists_associated
            .order(
              profile_tracks_count: :desc,
              created_at: :asc
            )
        end

        def artists_associated
          artists.includes(
            :artist
          )
        end

        def artist_formatted(artist)
          Muffon::Profile::Library::Artists::Artist.call(
            artist: artist
          )
        end
      end
    end
  end
end
