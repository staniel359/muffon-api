module LastFM
  module Tag
    class Tracks
      class Track < LastFM::Tag::Tracks
        include LastFM::Utils::Track

        def call
          data
        end

        private

        def data
          self_data
            .merge(track_data)
        end

        def title
          track['name']
        end

        def track
          @args[:track]
        end

        def artist_name
          track.dig(
            'artist', 'name'
          )
        end

        def track_data
          {
            source: source_data,
            player_id:,
            title:,
            artist: track_artist_data,
            artists:
          }
        end
      end
    end
  end
end
