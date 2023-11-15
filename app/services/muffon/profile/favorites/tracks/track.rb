module Muffon
  module Profile
    module Favorites
      class Tracks
        class Track < Muffon::Profile::Favorites::Tracks
          include Muffon::Utils::Track

          def call
            data
          end

          private

          def data
            self_data
              .merge(favorite_track_data)
          end

          def title
            track.title
          end

          def track
            @track ||=
              favorite_track.track
          end

          def favorite_track
            @args[:favorite_track]
          end

          def artist_name
            artist.name
          end

          def artist
            track.artist
          end

          def favorite_track_data
            favorite_track_base_data
              .merge(favorite_track_extra_data)
          end

          def favorite_track_base_data
            {
              source: source_data,
              id: favorite_track.id,
              player_id: player_source_id,
              title:,
              artist: artists_minimal_data,
              artists:
            }.compact
          end

          def source_data
            favorite_track.source_data
          end

          def player_id
            track.player_id
          end

          def artists
            [artist_data]
          end

          def artist_data
            { name: artist_name }
          end

          def favorite_track_extra_data
            {
              album: album_data,
              image: image_data,
              created: created_formatted,
              audio: audio_data
            }.compact
          end

          def image_data
            favorite_track.image_data
          end

          def audio_data
            favorite_track.audio_data
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
              favorite_track.album
          end

          def album_source_data
            favorite_track.album_source_data
          end

          def album_title
            album.title
          end

          def created_formatted
            datetime_formatted(
              favorite_track.created_at
            )
          end
        end
      end
    end
  end
end
