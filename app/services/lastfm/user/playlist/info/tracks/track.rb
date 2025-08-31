module LastFM
  module User
    module Playlist
      class Info
        class Tracks
          class Track < LastFM::User::Playlist::Info::Tracks
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
              track_base_data
                .merge(track_extra_data)
            end

            def track_base_data
              {
                source: source_data,
                player_id: player_source_id,
                title:,
                artist: artists_base_data,
                artists:
              }.compact
            end

            def title
              track.css(
                '.chartlist-name'
              )[0].text.strip
            end

            def track
              @args[:track]
            end

            def artist_name
              track.css(
                '.chartlist-artist'
              )[0].text.strip
            end

            def track_extra_data
              {
                album: album_data,
                image: image_data,
                duration:
              }.compact
            end

            def album_data
              return if raw_album_title.blank?

              {
                source: album_source_data,
                title: album_title
              }
            end

            def raw_album_title
              track.css(
                '.chartlist-image'
              )[0].css(
                '.cover-art'
              )[0]['href']
            end

            def album_title
              CGI.unescape(
                raw_album_title.match(
                  %r{/music/.+/(.+)}
                )[1]
              )
            end

            def album_source_data
              { name: source_name }
            end

            def image_data
              image_data_formatted(
                image
              )
            end

            def image
              track.css(
                '.chartlist-image'
              )[0].css(
                'img'
              )[0]['src']
            end

            def duration
              duration_formatted(
                raw_duration
              )
            end

            def raw_duration
              track.css(
                '.chartlist-duration'
              )[0].text.strip
            end
          end
        end
      end
    end
  end
end
