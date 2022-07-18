module Muffon
  module Profile
    module Library
      module Track
        class Playlists < Muffon::Profile::Library::Track::Base
          COLLECTION_NAME = 'playlists'.freeze
          include Muffon::Utils::Pagination

          private

          def track_data
            track_base_data
              .merge(paginated_data)
          end

          def total_items_count
            profile_playlists.count
          end

          def profile_playlists
            @profile_playlists ||=
              library_track.profile_playlists
          end

          def collection_list
            profile_playlists
              .created_desc_ordered
              .limit(limit)
              .offset(offset)
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
