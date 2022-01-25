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
          muffon_data
            .merge(track_data)
        end

        def track_data
          {
            player_id:,
            source_id: SOURCE_ID,
            title:,
            artists:
          }
        end

        def title
          track.css(
            '.chartlist-name a'
          )[0].text
        end

        def track
          @args[:track]
        end

        def artist_name
          track.css(
            '.chartlist-artist a'
          )[0].text
        end
      end
    end
  end
end
