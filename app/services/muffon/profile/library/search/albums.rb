module Muffon
  module Profile
    module Library
      module Search
        class Albums < Muffon::Profile::Library::Search::Base
          COLLECTION_NAME = 'albums'.freeze

          private

          def total_items_count
            albums.size
          end

          def albums
            @albums ||=
              albums_joined.where(
                'LOWER(albums.title) LIKE :query '\
                'OR LOWER(artists.name) LIKE :query',
                query: "%#{@args[:query].downcase}%"
              )
          end

          def albums_joined
            profile
              .profile_albums
              .left_joins(album: :artist)
          end

          def collection_list
            albums
              .profile_tracks_count_desc_ordered
              .created_asc_ordered
              .limit(limit)
              .offset(offset)
              .associated
          end

          def collection_item_data_formatted(profile_album)
            Muffon::Profile::Library::Albums::Album.call(
              profile_album:,
              profile_id: @args[:profile_id]
            )
          end

          alias library_data paginated_data
        end
      end
    end
  end
end
