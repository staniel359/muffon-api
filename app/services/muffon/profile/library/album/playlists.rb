module Muffon
  module Profile
    module Library
      module Album
        class Playlists < Muffon::Profile::Library::Album::Base
          DEFAULT_ORDER = 'created_desc'.freeze

          private

          def album_data
            Muffon::Formatter::Library::Album::Playlists.call(
              library_album_record:,
              playlists_data:
            )
          end

          def playlists_data
            paginated_data(
              collection_name: 'playlists',
              raw_collection:,
              page:,
              limit:,
              items_count:
            )
          end

          def raw_collection
            playlists
              .ordered(order, DEFAULT_ORDER)
              .limit(limit)
              .offset(offset)
          end

          def playlists
            @playlists ||=
              library_album_record.profile_playlists
          end

          def items_count
            playlists.count
          end

          def collection_item_data_formatted(
            playlist_record
          )
            Muffon::Formatter::Playlists::Playlist.call(
              playlist_record:
            )
          end
        end
      end
    end
  end
end
