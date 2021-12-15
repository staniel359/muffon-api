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
              .left_joins([album: :artist])
          end

          def collection
            albums_paginated.map do |a|
              album_formatted(a)
            end
          end

          def albums_paginated
            albums_sorted
              .limit(limit)
              .offset(offset)
          end

          def albums_sorted
            albums_associated
              .order(
                profile_tracks_count: :desc,
                created_at: :asc
              )
          end

          def albums_associated
            albums
              .includes(
                :album,
                [profile_artist: :artist],
                [image_attachment: :blob]
              )
          end

          def album_formatted(album)
            Muffon::Profile::Library::Albums::Album.call(
              album: album,
              profile_id: @args[:profile_id]
            )
          end
        end
      end
    end
  end
end
