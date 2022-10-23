module Muffon
  module Profile
    module Library
      module Tag
        class Artists < Muffon::Profile::Library::Tag::Base
          COLLECTION_NAME = 'artists'.freeze
          DEFAULT_ORDER = 'library_tracks_count_desc'.freeze

          include Muffon::Utils::Pagination

          private

          def tag_data
            tag_base_data
              .merge(library_base_data)
              .merge(paginated_data)
          end

          def library_base_data
            {
              top_tracks_count:,
              top_albums_count:
            }
          end

          def total_items_count
            @total_items_count ||=
              tag_library_artists.count
          end

          def collection_list
            tag_library_artists
              .ordered(order, DEFAULT_ORDER)
              .limit(limit)
              .offset(offset)
          end

          def collection_item_data_formatted(library_artist)
            Muffon::Profile::Library::Artists::Artist.call(
              library_artist:,
              profile_id: @args[:other_profile_id]
            )
          end
        end
      end
    end
  end
end
