module Muffon
  module Profile
    module Playlist
      class Tracks
        class Track < Muffon::Profile::Playlist::Tracks
          def call
            data
          end

          private

          def data
            {
              id: playlist_track.id,
              player_id: track.player_id,
              title: track.title,
              artist: artist_data,
              album: album_data,
              image: playlist_track.image_data,
              created: created_formatted
            }.compact
          end

          def playlist_track
            @args[:playlist_track]
          end

          def track
            @track ||= playlist_track.track
          end

          def artist_data
            {
              id: artist.id,
              name: artist.name
            }
          end

          def artist
            @artist ||= playlist_track.artist
          end

          def album_data
            return if album.blank?

            {
              id: album.id,
              title: album.title
            }
          end

          def album
            @album ||= playlist_track.album
          end

          def created_formatted
            datetime_formatted(
              playlist_track.created_at
            )
          end
        end
      end
    end
  end
end
