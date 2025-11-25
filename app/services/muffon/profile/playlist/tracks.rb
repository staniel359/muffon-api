module Muffon
  module Profile
    module Playlist
      class Tracks < Muffon::Profile::Playlist::Base
        DEFAULT_ORDER = 'updated_asc'.freeze

        private

        def playlist_data
          {
            **tracks_data
          }
        end

        def tracks_data
          paginated_data(
            collection_name: 'tracks',
            raw_collection:,
            page:,
            limit:,
            items_count:
          )
        end

        def raw_collection
          tracks
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
            .associated
        end

        def tracks
          @tracks ||= playlist.playlist_tracks
        end

        def items_count
          playlist.tracks_count
        end

        def collection_item_data_formatted(playlist_track)
          Muffon::Profile::Playlist::Tracks::Track.call(
            playlist_track:,
            profile_id: @args[:other_profile_id],
            token: @args[:token]
          )
        end
      end
    end
  end
end
