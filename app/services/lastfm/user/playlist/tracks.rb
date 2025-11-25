module LastFM
  module User
    module Playlist
      class Tracks < LastFM::User::Playlist::Info
        private

        def data
          paginated_data(
            collection_name: 'tracks',
            raw_collection:,
            page:,
            limit:
          )
        end

        def raw_collection
          response_data.css(
            '.chartlist-row'
          )
        end

        def params
          {
            **super,
            page:
          }
        end

        def collection_item_data_formatted(track)
          LastFM::User::Playlist::Tracks::Track.call(
            track:
          )
        end
      end
    end
  end
end
