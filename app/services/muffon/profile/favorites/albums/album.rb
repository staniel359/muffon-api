module Muffon
  module Profile
    module Favorites
      class Albums
        class Album < Muffon::Profile::Favorites::Albums
          include Muffon::Utils::Album

          def call
            data
          end

          private

          def data
            self_data
              .merge(favorite_album_data)
          end

          def title
            album.title
          end

          def album
            @album ||=
              favorite_album.album
          end

          def artist_name
            artist.name
          end

          def artist
            album.artist
          end

          def favorite_album_data
            favorite_album_base_data
              .merge(favorite_album_extra_data)
          end

          def favorite_album_base_data
            {
              source: source_data,
              id: favorite_album.id,
              title:,
              artist: artists_minimal_data,
              artists:
            }.compact
          end

          def source_data
            favorite_album.source_data
          end

          def favorite_album
            @args[:favorite_album]
          end

          def artists
            [artist_data]
          end

          def artist_data
            { name: artist_name }
          end

          def favorite_album_extra_data
            {
              image: image_data,
              created: created_formatted
            }.compact
          end

          def image_data
            favorite_album.image_data
          end

          def created_formatted
            datetime_formatted(
              favorite_album.created_at
            )
          end
        end
      end
    end
  end
end
