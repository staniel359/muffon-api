module Muffon
  module Profile
    module Library
      class Artists < Muffon::Profile::Library::Base
        COLLECTION_NAME = 'artists'.freeze
        include Muffon::Utils::Pagination

        private

        def library_data
          artist_data
            .merge(paginated_data)
        end

        def artist_data
          {
            top_tracks_count: top_tracks_count,
            top_albums_count: top_albums_count
          }
        end

        def total_items_count
          artists.size
        end

        def collection_list
          artists
            .profile_tracks_count_desc_ordered
            .created_asc_ordered
            .limit(limit)
            .offset(offset)
            .associated
        end

        def collection_item_data_formatted(profile_artist)
          Muffon::Profile::Library::Artists::Artist.call(
            profile_artist: profile_artist,
            profile_id: @args[:profile_id]
          )
        end
      end
    end
  end
end
