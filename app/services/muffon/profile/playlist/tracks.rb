module Muffon
  module Profile
    module Playlist
      class Tracks < Muffon::Profile::Playlist::Base
        COLLECTION_NAME = 'tracks'.freeze
        include Muffon::Utils::Pagination

        private

        def primary_args
          [@args[:playlist_id]]
        end

        def total_items_count
          playlist.playlist_tracks_count
        end

        def collection
          tracks_paginated.map do |t|
            track_formatted(t)
          end
        end

        def tracks_paginated
          tracks_associated
            .limit(limit)
            .offset(offset)
        end

        def tracks_associated
          tracks_sorted.includes(
            :track,
            :artist
          )
        end

        def tracks_sorted
          playlist.playlist_tracks.order(
            created_at: :asc
          )
        end

        def track_formatted(track)
          Muffon::Profile::Playlist::Tracks::Track.call(
            track: track
          )
        end

        alias playlist_data paginated_data
      end
    end
  end
end
