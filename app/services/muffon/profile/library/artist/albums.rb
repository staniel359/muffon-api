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

          def collection
            albums_paginated.map do |a|
              album_data_formatted(a)
            end
          end

          def albums_paginated
            albums_sorted
              .limit(limit)
              .offset(offset)
          end

          def albums_sorted
            albums_associated.order(
              profile_tracks_count: :desc,
              created_at: :asc
            )
          end

          def albums_associated
            profile_artist
              .profile_albums
              .includes(
                [album: :artist],
                [image_attachment: :blob]
              )
          end

          def album_data_formatted(album)
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
