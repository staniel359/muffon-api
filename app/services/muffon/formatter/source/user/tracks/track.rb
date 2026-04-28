module Muffon
  module Formatter
    module Source
      module User
        module Tracks
          class Track < Muffon::Formatter::Source::Track::Base
            def call
              check_args

              data
            end

            private

            def required_args
              %i[
                source_original_link
                source_name
                source_track_id
                title
                artists
                image_data
                album_title
                source_album_id
                creation_date
                is_audio_present
              ]
            end

            def data
              {
                source: source_data,
                title:,
                artist: artist_data,
                artists:,
                album: album_data,
                image: image_data,
                created: creation_date,
                audio: audio_data
              }.compact
            end
          end
        end
      end
    end
  end
end
