module RateYourMusic
  module Album
    class Info
      class Track < RateYourMusic::Album::Info
        def call
          data
        end

        private

        def data
          {
            title: title,
            artist: artist_formatted,
            artists: artists,
            duration: duration
          }
        end

        def title
          full_title.children[-1].text.match(
            /(\s+-\s+)?(.+)/
          )[2]
        end

        def full_title
          @full_title ||= @args.track.css(
            '.rendered_text'
          )
        end

        def artists_list
          track_artists_list || @args.artists_list
        end

        def track_artists_list
          full_title.css('.artist').presence
        end

        def duration
          duration_formatted(raw_duration)
        end

        def raw_duration
          @args.track.css(
            '.tracklist_duration'
          )[0]['data-inseconds'].to_i
        end
      end
    end
  end
end
