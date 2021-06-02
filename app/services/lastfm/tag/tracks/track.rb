module LastFM
  module Tag
    class Tracks
      class Track < LastFM::Tag::Tracks
        def call
          data
        end

        private

        def data
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
