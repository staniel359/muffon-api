module LastFM
  module User
    module Favorites
      class Tracks < LastFM::User::Base
        API_METHOD = 'user.getLovedTracks'.freeze
        COLLECTION_NAME = 'tracks'.freeze

        include Muffon::Utils::Pagination

        private

        def user_data
          { favorites: favorites_data }
        end

        def favorites_data
          favorites_base_data
            .merge(paginated_data)
        end

        def favorites_base_data
          {
            total_items:
              total_items_count
          }
        end

        def total_items_count
          tracks_data.dig(
            '@attr', 'total'
          ).to_i
        end

        def tracks_data
          response_data['lovedtracks']
        end

        def params
          super.merge(
            pagination_params
          )
        end

        def total_pages_count
          tracks_data.dig(
            '@attr', 'totalPages'
          ).to_i
        end

        def collection
          tracks_list.map do |t|
            track_formatted(t)
          end
        end

        def tracks_list
          tracks_data['track']
        end

        def track_formatted(track)
          LastFM::User::Favorites::Tracks::Track.call(
            track:
          )
        end
      end
    end
  end
end
