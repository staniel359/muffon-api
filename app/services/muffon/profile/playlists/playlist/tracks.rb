module Muffon
  module Profile
    class Playlists
      class Playlist
        class Tracks < Muffon::Profile::Playlists::Playlist::Base
          include Muffon::Utils::Pagination

          private

          def playlist_data
            {
              page: page,
              total_pages: total_pages_count,
              tracks: tracks_formatted
            }
          end

          def total_items_count
            playlist.playlist_tracks_count
          end

          def tracks_formatted
            tracks_paginated.map do |t|
              track_formatted(t)
            end
          end

          def tracks_paginated
            tracks_sorted
              .limit(limit)
              .offset(offset)
          end

          def tracks_sorted
            playlist.playlist_tracks.order(
              created_at: :asc
            )
          end

          def track_formatted(track)
            Muffon::Profile::Playlists::Playlist::Tracks::Track.call(
              track: track
            )
          end
        end
      end
    end
  end
end
