module Muffon
  module Profile
    module Library
      module Artist
        class Albums < Muffon::Profile::Library::Artist::Base
          DEFAULT_ORDER =
            'library_tracks_count_desc'.freeze

          private

          def library_data
            {
              top_tracks_count:,
              **super
            }
          end

          def top_tracks_count
            albums
              .library_tracks_count_desc_ordered
              .first
              &.library_tracks_count || 0
          end

          def albums
            @albums ||= library_artist.library_albums
          end

          def artist_data
            {
              **super,
              **albums_data
            }
          end

          def albums_data
            paginated_data(
              collection_name: 'albums',
              raw_collection:,
              page:,
              limit:,
              items_count:
            )
          end

          def raw_collection
            albums
              .ordered(order, DEFAULT_ORDER)
              .limit(limit)
              .offset(offset)
              .associated
          end

          def items_count
            library_artist.library_albums_count
          end

          def collection_item_data_formatted(library_album)
            Muffon::Profile::Library::Artist::Albums::Album.call(
              library_album:,
              profile_id: @args[:other_profile_id],
              token: @args[:token]
            )
          end
        end
      end
    end
  end
end
