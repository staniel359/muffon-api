module Muffon
  module Profile
    module Bookmarks
      class Tracks
        class Track < Muffon::Profile::Bookmarks::Tracks
          def call
            data
          end

          private

          def data
            {
              id: bookmark_track.id,
              player_id: track.player_id,
              title: track.title,
              artist: artist_data,
              album: album_data,
              image: bookmark_track.image_data
            }.compact
          end

          def bookmark_track
            @args[:bookmark_track]
          end

          def track
            @track ||= bookmark_track.track
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
            @album ||= bookmark_track.album
          end
        end
      end
    end
  end
end
