module RateYourMusic
  module Album
    class Info
      class Track < RateYourMusic::Album::Info
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
            title:,
            artists:,
            duration:,
            duration_seconds:
          }
        end

        def title
          full_title.children[-1].text.match(
            /(\s+-\s+)?(.+)/
          )[2]
        end

        def full_title
          @full_title ||= track.css(
            '.rendered_text'
          )
        end

        def track
          @args[:track]
        end

        def artists_list
          track_artists_list ||
            @args[:artists_list]
        end

        def track_artists_list
          full_title.css(
            '.artist'
          ).presence
        end

        def duration_seconds
          track.css(
            '.tracklist_duration'
          )[0]['data-inseconds'].to_i
        end
      end
    end
  end
end
