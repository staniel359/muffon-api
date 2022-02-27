module Muffon
  module Profile
    module Library
      module Search
        class Artists < Muffon::Profile::Library::Search::Base
          COLLECTION_NAME = 'artists'.freeze

          private

          def library_data
            library_base_data
              .merge(paginated_data)
          end

          def library_base_data
            {
              top_tracks_count:,
              top_albums_count:
            }
          end

          def total_items_count
            artists.size
          end

          def artists
            @artists ||=
              artists_joined.where(
                'LOWER(artists.name) LIKE :query',
                query: "%#{@args[:query].downcase}%"
              )
          end

          def artists_joined
            profile
              .profile_artists
              .left_joins(:artist)
          end

          def collection_list
            artists
              .profile_tracks_count_desc_ordered
              .profile_albums_count_desc_ordered
              .created_asc_ordered
              .limit(limit)
              .offset(offset)
              .associated
          end

          def collection_item_data_formatted(profile_artist)
            Muffon::Profile::Library::Artists::Artist.call(
              profile_artist:,
              profile_id: @args[:profile_id]
            )
          end
        end
      end
    end
  end
end
