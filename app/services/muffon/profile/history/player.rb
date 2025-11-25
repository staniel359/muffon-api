module Muffon
  module Profile
    module History
      class Player < Muffon::Profile::History::Base
        private

        def profile_data
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
        end

        def tracks
          @tracks ||= profile.playing_events
        end

        def items_count
          tracks.count
        end

        def collection_item_data_formatted(event)
          Muffon::Profile::History::Player::Track.call(
            event:,
            profile_id: @args[:profile_id],
            token: @args[:token]
          )
        end
      end
    end
  end
end
