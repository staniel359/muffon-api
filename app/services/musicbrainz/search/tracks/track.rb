module MusicBrainz
  module Search
    class Tracks
      class Track < MusicBrainz::Search::Tracks
        include MusicBrainz::Utils::Track

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
            artist: artist_names_data,
            artists:
          }
        end

        def track_extra_data
          {
            album: album_data,
            image: image_data,
            duration:
          }.compact
        end
      end
    end
  end
end
