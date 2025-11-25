module Muffon
  module Profile
    module Library
      module Album
        class Tracks < Muffon::Profile::Library::Album::Base
          DEFAULT_ORDER = 'created_desc'.freeze

          private

          def album_data
            {
              **super,
              **tracks_data
            }
          end

          def tracks_data
            paginated_data(
              collection_name: 'tracks',
              raw_collection:,
              page:,
              limit:,
              items_count:
            )
          end

          def raw_collection
            tracks
              .ordered(order, DEFAULT_ORDER)
              .limit(limit)
              .offset(offset)
              .album_associated
          end

          def tracks
            library_album.library_tracks
          end

          def items_count
            library_album.library_tracks_count
          end

          def collection_item_data_formatted(library_track)
            Muffon::Profile::Library::Album::Tracks::Track.call(
              library_track:,
              profile_id: @args[:other_profile_id],
              token: @args[:token]
            )
          end
        end
      end
    end
  end
end
