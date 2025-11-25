module Muffon
  module Profile
    module Library
      module Artist
        class Playlists < Muffon::Profile::Library::Artist::Base
          DEFAULT_ORDER = 'created_desc'.freeze

          private

          def artist_data
            {
              **super,
              **playlists_data
            }
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
              library_artist.profile_playlists
          end

          def items_count
            playlists.count
          end

          def collection_item_data_formatted(playlist)
            Muffon::Profile::Playlists::Playlist.call(
              playlist:
            )
          end
        end
      end
    end
  end
end
