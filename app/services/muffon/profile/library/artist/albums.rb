module Muffon
  module Profile
    module Library
      module Artist
        class Albums < Muffon::Profile::Library::Artist::Base
          COLLECTION_NAME = 'albums'.freeze
          DEFAULT_ORDER = 'library_tracks_count_desc'.freeze

          include Muffon::Utils::Pagination

          private

          def library_data
            library_base_data
              .merge(super)
          end

          def library_base_data
            { top_tracks_count: }
          end

          def artist_data
            artist_base_data
              .merge(paginated_data)
          end

          def total_items_count
            library_artist.library_albums_count
          end

          def collection_list
            library_artist
              .library_albums
              .ordered(order, DEFAULT_ORDER)
              .limit(limit)
              .offset(offset)
              .associated
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
