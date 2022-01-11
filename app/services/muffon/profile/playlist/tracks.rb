module Muffon
  module Profile
    module Playlist
      class Tracks < Muffon::Profile::Playlist::Base
        COLLECTION_NAME = 'tracks'.freeze
        include Muffon::Utils::Pagination

        private

        def total_items_count
          playlist.playlist_tracks_count
        end

        def collection_list
          tracks
            .created_asc_ordered
            .limit(limit)
            .offset(offset)
            .associated
        end

        def tracks
          playlist.playlist_tracks
        end

        def collection_item_data_formatted(playlist_track)
          Muffon::Profile::Playlist::Tracks::Track.call(
            playlist_track:
          )
        end

        alias playlist_data paginated_data
      end
    end
  end
end
