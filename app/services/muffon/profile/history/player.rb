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
          @tracks ||= profile_record.playing_events
        end

        def items_count
          tracks.count
        end

        def collection_item_data_formatted(
          event_record
        )
          Muffon::Formatter::History::Player::Event.call(
            event_record:,
            **self_args
          )
        end
      end
    end
  end
end
