module Muffon
  module Profile
    module Library
      module Album
        class Tracks < Muffon::Profile::Library::Album::Base
          COLLECTION_NAME = 'tracks'.freeze
          include Muffon::Utils::Pagination

          private

          def album_data
            album_base_data
              .merge(paginated_data)
          end

          def album_base_data
            {
              title: album.title,
              artist: artist_data
            }
          end

          def total_items_count
            library_album.library_tracks_count
          end

          def collection_list
            library_album
              .library_tracks
              .created_desc_ordered
              .limit(limit)
              .offset(offset)
              .album_associated
          end

          def collection_item_data_formatted(library_track)
            Muffon::Profile::Library::Album::Tracks::Track.call(
              library_track:,
              profile_id: @args[:profile_id]
            )
          end
        end
      end
    end
  end
end
