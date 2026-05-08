module Spotify
  module User
    module Playlist
      class Tracks < Spotify::User::Playlist::Base
        private

        def playlist_data
          paginated_data(
            collection_name: 'tracks',
            raw_collection:,
            page:,
            limit:,
            items_count:,
            is_with_items_count: true
          )
        end

        def raw_collection
          raw_playlist_data['items']
        end

        def request_url
          "#{super}/items"
        end

        def request_params
          {
            limit:,
            offset:
          }
        end

        def items_count
          raw_playlist_data['total']
        end

        def collection_item_data_formatted(
          raw_track_data
        )
          Spotify::User::Playlist::Tracks::Track.call(
            raw_track_data:
          )
        end
      end
    end
  end
end
