module Muffon
  module Profile
    module Playlist
      class Tracks
        class Track < Muffon::Profile::Playlist::Tracks
          include Muffon::Utils::Track

          def call
            check_args

            data
          end

          def required_args
            %i[
              playlist_track
            ]
          end

          private

          def data
            self_data
              .merge(playlist_track_base_data)
              .merge(playlist_track_extra_data)
          end

          def playlist_track_base_data
            {
              source: source_data,
              id: playlist_track.id,
              player_id: player_source_id,
              title:,
              artist: artists_minimal_data,
              artists:
            }.compact
          end

          def source_data
            playlist_track.source_data
          end

          def player_id
            track.player_id
          end

          def title
            track.title
          end

          def track
            @track ||=
              playlist_track.track
          end

          def artist_name
            artist.name
          end

          def artist
            playlist_track.artist
          end

          def playlist_track
            @args[:playlist_track]
          end

          def artists
            [artist_data]
          end

          def artist_data
            { name: artist_name }
          end

          def playlist_track_extra_data
            {
              album: album_data,
              image: image_data,
              created: created_formatted,
              audio: audio_data
            }.compact
          end

          def image_data
            playlist_track.image_data
          end

          def audio_data
            playlist_track.audio_data
          end

          def album_data
            return if album.blank?

            {
              source: album_source_data,
              title: album_title
            }
          end

          def album
            @album ||=
              playlist_track.album
          end

          def album_source_data
            playlist_track.album_source_data
          end

          def album_title
            album.title
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
