module Muffon
  module Profile
    module Library
      module Search
        class Tracks < Muffon::Profile::Library::Search::Base
          COLLECTION_NAME = 'tracks'.freeze

          private

          def total_items_count
            tracks.size
          end

          def tracks
            @tracks ||=
              tracks_joined.where(
                'LOWER(tracks.title) LIKE :query '\
                'OR LOWER(artists.name) LIKE :query',
                query: "%#{@args[:query].downcase}%"
              )
          end

          def tracks_joined
            profile
              .profile_tracks
              .left_joins(track: :artist)
          end

          def collection_list
            tracks
              .created_desc_ordered
              .limit(limit)
              .offset(offset)
              .associated
          end

          def collection_item_data_formatted(track)
            Muffon::Profile::Library::Tracks::Track.call(
              track: track,
              profile_id: @args[:profile_id]
            )
          end

          alias library_data paginated_data
        end
      end
    end
  end
end
