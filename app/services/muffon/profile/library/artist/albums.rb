module Muffon
  module Profile
    module Library
      module Artist
        class Albums < Muffon::Profile::Library::Artist::Base
          COLLECTION_NAME = 'albums'.freeze
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
            profile_artist.profile_albums_count
          end

          def collection_list
            albums
              .profile_tracks_count_desc_ordered
              .created_asc_ordered
              .limit(limit)
              .offset(offset)
              .associated
          end

          def albums
            profile_artist.profile_albums
          end

          def collection_item_data_formatted(album)
            Muffon::Profile::Library::Artist::Albums::Album.call(
              album: album,
              profile_id: @args[:profile_id]
            )
          end
        end
      end
    end
  end
end
