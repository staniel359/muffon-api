module Muffon
  module Profile
    module Favorites
      class Tracks < Muffon::Profile::Favorites::Base
        COLLECTION_NAME = 'tracks'.freeze
        include Muffon::Utils::Pagination

        private

        def total_items_count
          tracks.size
        end

        def tracks
          @tracks ||= profile.favorite_tracks
        end

        def collection_list
          tracks
            .created_desc_ordered
            .limit(limit)
            .offset(offset)
            .associated
        end

        def collection_item_data_formatted(track)
          Muffon::Profile::Favorites::Tracks::Track.call(
            track: track
          )
        end
      end
    end
  end
end
