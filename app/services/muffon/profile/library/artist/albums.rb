module Muffon
  module Profile
    module Library
      module Artist
        class Albums < Muffon::Profile::Library::Artist::Base
          COLLECTION_NAME = 'albums'.freeze
          include Muffon::Utils::Pagination

          private

          def artist_data
            artist_base_data
              .merge(paginated_data)
          end

          def artist_base_data
            {
              library: library_artist_data,
              name:
            }
          end

          def total_items_count
            library_artist.library_albums_count
          end

          def collection_list
            library_artist
              .library_albums
              .library_tracks_count_desc_ordered
              .created_desc_ordered
              .limit(limit)
              .offset(offset)
              .associated
          end

          def collection_item_data_formatted(library_album)
            Muffon::Profile::Library::Artist::Albums::Album.call(
              library_album:,
              profile_id: @args[:profile_id]
            )
          end
        end
      end
    end
  end
end
