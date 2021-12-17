module Muffon
  module Profile
    module Library
      module Artist
        class Tracks < Muffon::Profile::Library::Artist::Base
          COLLECTION_NAME = 'tracks'.freeze
          include Muffon::Utils::Pagination

          private

          def artist_data
            artist_base_data
              .merge(paginated_data)
          end

          def artist_base_data
            { name: name }
          end

          def total_items_count
            profile_artist.profile_tracks_count
          end

          def collection_list
            tracks
              .created_desc_ordered
              .limit(limit)
              .offset(offset)
              .associated
          end

          def tracks
            profile_artist.profile_tracks
          end

          def collection_item_data_formatted(track)
            Muffon::Profile::Library::Artist::Tracks::Track.call(
              track: track,
              profile_id: @args[:profile_id]
            )
          end
        end
      end
    end
  end
end
