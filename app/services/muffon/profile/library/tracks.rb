module Muffon
  module Profile
    module Library
      class Tracks < Muffon::Profile::Library::Base
        COLLECTION_NAME = 'tracks'.freeze
        DEFAULT_ORDER = 'created_desc'.freeze

        include Muffon::Utils::Pagination

        private

        def total_items_count
          profile.library_tracks_count
        end

        def collection_list
          library_tracks
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
            .associated
        end

        def collection_item_data_formatted(library_track)
          Muffon::Profile::Library::Tracks::Track.call(
            library_track:,
            profile_id: @args[:other_profile_id],
            token: @args[:token]
          )
        end

        alias library_data paginated_data
      end
    end
  end
end
