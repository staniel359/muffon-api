module LastFM
  module User
    module Favorites
      class Tracks < LastFM::User::Base
        API_METHOD = 'user.getLovedTracks'.freeze

        private

        def user_data
          { favorites: favorites_data }
        end

        def favorites_data
          paginated_data(
            collection_name: 'tracks',
            raw_collection:,
            page:,
            limit:,
            items_count:,
            is_with_items_count: true
          )
        end

        def items_count
          response_data
            .dig(
              'lovedtracks',
              '@attr',
              'total'
            )
            .to_i
        end

        def params
          {
            **super,
            page:,
            limit:
          }
        end

        def raw_collection
          response_data.dig(
            'lovedtracks',
            'track'
          )
        end

        def collection_item_data_formatted(track)
          LastFM::User::Favorites::Tracks::Track.call(
            track:
          )
        end
      end
    end
  end
end
