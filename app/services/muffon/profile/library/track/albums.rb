module Muffon
  module Profile
    module Library
      module Track
        class Albums < Muffon::Profile::Library::Track::Base
          COLLECTION_NAME = 'albums'.freeze
          include Muffon::Utils::Pagination

          private

          def track_data
            track_base_data
              .merge(paginated_data)
          end

          def total_items_count
            library_albums.count
          end

          def library_albums
            @library_albums ||=
              library_track.library_albums
          end

          def collection_list
            library_albums
              .created_desc_ordered
              .limit(limit)
              .offset(offset)
              .associated
          end

          def collection_item_data_formatted(library_album)
            Muffon::Profile::Library::Albums::Album.call(
              library_album:,
              profile_id: @args[:other_profile_id]
            )
          end
        end
      end
    end
  end
end
