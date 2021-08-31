module LastFM
  module Tag
    class Tracks
      class Track < LastFM::Tag::Tracks
        include Muffon::Utils::Track

        def call
          data
        end

        private

        def data
          muffon_data.merge(track_data)
        end

        def track_data
          {
            title: title,
            player_id: player_id,
            artist: artist_formatted,
            artists: artists
          }
        end

        def title
          @args.track.css(
            '.chartlist-name a'
          )[0].text
        end

        def artist_name
          @args.track.css(
            '.chartlist-artist a'
          )[0].text
        end
      end
    end
  end
end
