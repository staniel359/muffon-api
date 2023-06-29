module Bandcamp
  module Search
    class Tracks
      class Track < Bandcamp::Search::Tracks
        include Muffon::Utils::Track

        def call
          data
        end

        private

        def data
          self_data
            .merge(track_base_data)
            .merge(track_extra_data)
        end

        def track
          @args[:track]
        end

        def track_base_data
          {
            source: source_data,
            player_id:,
            title:,
            artist: artists_minimal_data,
            artists:
          }
        end

        def track_extra_data
          {
            album: album_data,
            image: image_data,
            audio: audio_minimal_data
          }.compact
        end

        def album_data
          return if album_title.blank?

          {
            source: album_source_data,
            title: album_title
          }
        end

        def album_title
          track['album_name']
        end

        def album_source_data
          {
            name: source_name,
            id: album_bandcamp_id,
            artist_id: artist_bandcamp_id
          }
        end

        def album_bandcamp_id
          track['album_id']
        end

        def audio_present?
          true
        end

        alias model track
        alias title name
      end
    end
  end
end
