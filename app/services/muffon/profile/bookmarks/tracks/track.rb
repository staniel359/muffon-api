module Muffon
  module Profile
    module Bookmarks
      class Tracks
        class Track < Muffon::Profile::Bookmarks::Tracks
          include Muffon::Utils::Track

          def call
            data
          end

          private

          def data
            self_data
              .merge(bookmark_track_base_data)
              .merge(bookmark_track_extra_data)
          end

          def title
            track.title
          end

          def track
            @track ||=
              bookmark_track.track
          end

          def bookmark_track
            @args[:bookmark_track]
          end

          def artist_name
            artist.name
          end

          def artist
            track.artist
          end

          def bookmark_track_base_data
            {
              source: source_data,
              id: bookmark_track.id,
              player_id: player_source_id,
              title:,
              artist: artists_minimal_data,
              artists:
            }.compact
          end

          def source_data
            bookmark_track.source_data
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

          def bookmark_track_extra_data
            {
              album: album_data,
              image: image_data,
              created: created_formatted,
              audio: audio_data
            }.compact
          end

          def image_data
            bookmark_track.image_data
          end

          def audio_data
            bookmark_track.audio_data
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
              bookmark_track.album
          end

          def album_source_data
            bookmark_track.album_source_data
          end

          def album_title
            album.title
          end

          def created_formatted
            datetime_formatted(
              bookmark_track.created_at
            )
          end
        end
      end
    end
  end
end
