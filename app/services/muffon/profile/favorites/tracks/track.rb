module Muffon
  module Profile
    module Favorites
      class Tracks
        class Track < Muffon::Profile::Favorites::Tracks
          def call
            data
          end

          private

          def data
            {
              id: favorite_track.id,
              player_id: track.player_id,
              title: track.title,
              artist: artist_data,
              album: album_data,
              image: favorite_track.image_data
            }.compact
          end

          def favorite_track
            @args[:favorite_track]
          end

          def track
            @track ||= favorite_track.track
          end

          def artist_data
            { name: artist.name }
          end

          def artist
            @artist ||= track.artist
          end

          def album_data
            return if album.blank?

            { title: album.title }
          end

          def album
            @album ||= favorite_track.album
          end
        end
      end
    end
  end
end
