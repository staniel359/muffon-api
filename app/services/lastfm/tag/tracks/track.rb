module LastFM
  module Tag
    class Tracks
      class Track < LastFM::Tag::Tracks
        include LastFM::Utils::Track

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            track
          ]
        end

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
            player_id: player_source_id,
            title:,
            artist: artists_base_data,
            artists:
          }
        end
      end
    end
  end
end
