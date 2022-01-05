module Muffon
  module Profile
    module Library
      module Tag
        class Artists < Muffon::Profile::Library::Tag::Base
          COLLECTION_NAME = 'artists'.freeze
          include Muffon::Utils::Pagination

          private

          def tag_data
            tag_base_data
              .merge(library_base_data)
              .merge(paginated_data)
          end

          def tag_base_data
            { name: tag.name }
          end

          def library_base_data
            {
              top_tracks_count: top_tracks_count,
              top_albums_count: top_albums_count
            }
          end

          def total_items_count
            profile_artists.count
          end

          def collection_list
            profile_artists
              .profile_tracks_count_desc_ordered
              .profile_albums_count_desc_ordered
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
end
