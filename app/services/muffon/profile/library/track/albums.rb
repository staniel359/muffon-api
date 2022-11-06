module Muffon
  module Profile
    module Library
      module Track
        class Albums < Muffon::Profile::Library::Track::Base
          COLLECTION_NAME = 'albums'.freeze
          DEFAULT_ORDER = 'created_desc'.freeze

          include Muffon::Utils::Pagination

          private

          def library_data
            library_base_data
              .merge(super)
          end

          def library_base_data
            { top_tracks_count: }
          end

          def track_data
            track_base_data
              .merge(paginated_data)
          end

          def total_items_count
            @total_items_count ||=
              library_albums.count
          end

          def library_albums
            @library_albums ||=
              library_track.library_albums
          end

          def collection_list
            library_albums
              .ordered(order, DEFAULT_ORDER)
              .limit(limit)
              .offset(offset)
              .associated
          end

          def collection_item_data_formatted(library_album)
            Muffon::Profile::Library::Albums::Album.call(
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
