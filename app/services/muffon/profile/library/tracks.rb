module Muffon
  module Profile
    module Library
      class Tracks < Muffon::Profile::Library::Base
        COLLECTION_NAME = 'tracks'.freeze
        include Muffon::Utils::Pagination

        private

        def total_items_count
          tracks.size
        end

        def collection_list
          tracks
            .created_desc_ordered
            .limit(limit)
            .offset(offset)
            .associated
        end

        def collection_item_data_formatted(profile_track)
          Muffon::Profile::Library::Tracks::Track.call(
            profile_track: profile_track,
            profile_id: @args[:profile_id]
          )
        end

        alias library_data paginated_data
      end
    end
  end
end
