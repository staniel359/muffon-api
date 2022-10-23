module Muffon
  module Profile
    module Playlist
      class Tracks < Muffon::Profile::Playlist::Base
        COLLECTION_NAME = 'tracks'.freeze
        DEFAULT_ORDER = 'updated_asc'.freeze

        include Muffon::Utils::Pagination

        private

        def total_items_count
          playlist.tracks_count
        end

        def collection_list
          tracks
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
            .associated
        end

        def tracks
          playlist.playlist_tracks
        end

        def collection_item_data_formatted(playlist_track)
          Muffon::Profile::Playlist::Tracks::Track.call(
            playlist_track:,
            profile_id: @args[:other_profile_id]
          )
        end

        alias playlist_data paginated_data
      end
    end
  end
end
