module LastFM
  module User
    module Playlist
      class Info
        class Tracks < LastFM::User::Playlist::Info
          COLLECTION_NAME = 'tracks'.freeze

          include Muffon::Utils::Pagination

          private

          def total_pages_count
            nil
          end

          def collection_list
            response_data.css(
              '.chartlist-row'
            )
          end

          def params
            super.merge(
              pagination_params
            )
          end

          def collection_item_data_formatted(track)
            LastFM::User::Playlist::Info::Tracks::Track.call(
              track:
            )
          end

          alias data paginated_data
        end
      end
    end
  end
end
