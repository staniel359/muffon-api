module Muffon
  module Profile
    module Bookmarks
      class Albums
        class Album < Muffon::Profile::Bookmarks::Albums
          include Muffon::Utils::Album

          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              bookmark_album
            ]
          end

          def data
            self_data
              .merge(bookmark_album_data)
          end

          def title
            album.title
          end

          def album
            @album ||=
              bookmark_album.album
          end

          def bookmark_album
            @args[:bookmark_album]
          end

          def artist_name
            artist.name
          end

          def artist
            album.artist
          end

          def bookmark_album_data
            {
              source: source_data,
              id: bookmark_album.id,
              title:,
              artist: artists_minimal_data,
              artists:,
              image: image_data,
              created: created_formatted
            }.compact
          end

          def source_data
            bookmark_album.source_data
          end

          def artists
            [artist_data]
          end

          def artist_data
            { name: artist_name }
          end

          def image_data
            bookmark_album.image_data
          end

          def created_formatted
            datetime_formatted(
              bookmark_album.created_at
            )
          end
        end
      end
    end
  end
end
