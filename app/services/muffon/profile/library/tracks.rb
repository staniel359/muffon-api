module Muffon
  module Profile
    module Library
      class Tracks < Muffon::Profile::Library::Base
        DEFAULT_ORDER = 'created_desc'.freeze

        private

        def library_data
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
          library_tracks
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
            .associated
        end

        def items_count
          profile.library_tracks_count
        end

        def collection_item_data_formatted(library_track)
          Muffon::Profile::Library::Tracks::Track.call(
            library_track:,
            profile_id: @args[:other_profile_id],
            token: @args[:token]
          )
        end
      end
    end
  end
end
