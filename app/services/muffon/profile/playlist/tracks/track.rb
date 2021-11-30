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
              id: id,
              player_id: player_id,
              title: title,
              artist: artist_data,
              album: album_data,
              image: image_data,
              created: created_at
            }.compact
          end

          def id
            playlist_track.id
          end

          def playlist_track
            @args[:track]
          end

          def player_id
            playlist_track
              .track
              .player_id
          end

          def title
            playlist_track
              .track
              .title
          end

          def artist_data
            {
              id: artist_id,
              name: artist_name
            }
          end

          def artist_id
            playlist_track.artist_id
          end

          def artist_name
            playlist_track
              .artist
              .name
          end

          def album_data
            return if album.blank?

            {
              id: album_id,
              title: album_title
            }
          end

          def album
            @album ||= playlist_track.album
          end

          def album_id
            playlist_track.album_id
          end

          def album_title
            album.title
          end

          def image_data
            ::LastFM::Utils::Image.call(
              model: 'track',
              image: playlist_track.image_url
            )
          end

          def created_at
            datetime_formatted(
              playlist_track.created_at
            )
          end
        end
      end
    end
  end
end
