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
              title: title,
              artist: artist_data
            }
          end

          def total_items_count
            profile_album.profile_tracks_count
          end

          def collection_list
            tracks
              .created_desc_ordered
              .limit(limit)
              .offset(offset)
              .album_associated
          end

          def tracks
            profile_album.profile_tracks
          end

          def collection_item_data_formatted(track)
            Muffon::Profile::Library::Album::Tracks::Track.call(
              track: track,
              profile_id: @args[:profile_id]
            )
          end
        end
      end
    end
  end
end
