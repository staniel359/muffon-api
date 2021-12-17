module Muffon
  module Profile
    module Library
      class Albums < Muffon::Profile::Library::Base
        COLLECTION_NAME = 'albums'.freeze
        include Muffon::Utils::Pagination

        private

        def total_items_count
          albums.size
        end

        def collection_list
          albums
            .profile_tracks_count_desc_ordered
            .created_asc_ordered
            .limit(limit)
            .offset(offset)
            .associated
        end

        def collection_item_data_formatted(album)
          Muffon::Profile::Library::Albums::Album.call(
            album: album,
            profile_id: @args[:profile_id]
          )
        end

        alias library_data paginated_data
      end
    end
  end
end
