module Muffon
  module Profile
    module Library
      module Artist
        class Tracks < Muffon::Profile::Library::Artist::Base
          COLLECTION_NAME = 'tracks'.freeze
          DEFAULT_ORDER = 'created_desc'.freeze

          include Muffon::Utils::Pagination

          private

          def artist_data
            artist_base_data
              .merge(paginated_data)
          end

          def total_items_count
            library_artist.library_tracks_count
          end

          def collection_list
            library_artist
              .library_tracks
              .ordered(order, DEFAULT_ORDER)
              .limit(limit)
              .offset(offset)
              .associated
          end

          def collection_item_data_formatted(library_track)
            Muffon::Profile::Library::Artist::Tracks::Track.call(
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
