module LastFM
  module User
    module Playlist
      class Tracks
        class Track < LastFM::User::Playlist::Tracks
          include LastFM::Mixins::Track

          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              raw_track_data
            ]
          end

          def data
            Muffon::Formatter::User::Playlist::Tracks::Track.call(
              source_original_link:,
              source_name:,
              source_track_id: nil,
              title:,
              artists:,
              album_title:,
              source_album_id: nil,
              image_data:,
              duration:,
              creation_date: nil,
              is_audio_present: audio_present?
            )
          end

          def title
            raw_track_data
              .css('.chartlist-name')[0]
              .text
              .strip
          end

          def raw_track_data
            @args[:raw_track_data]
          end

          def artist_name
            raw_track_data
              .css('.chartlist-artist')[0]
              .text
              .strip
          end

          def album_title
            return if raw_album_title.blank?

            CGI.unescape(
              raw_album_title.match(
                %r{/music/.+/(.+)}
              )[1]
            )
          end

          def raw_album_title
            raw_track_data
              .css('.chartlist-image')[0]
              .css('.cover-art')[0]['href']
          end

          def image_url
            raw_track_data
              .css('.chartlist-image')[0]
              .css('img')[0]['src']
          end

          def duration
            duration_string_to_seconds(
              raw_duration
            )
          end

          def raw_duration
            raw_track_data
              .css('.chartlist-duration')[0]
              .text
              .strip
          end
        end
      end
    end
  end
end
