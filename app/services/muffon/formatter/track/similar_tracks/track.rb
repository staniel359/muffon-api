module Muffon
  module Formatter
    module Track
      module SimilarTracks
        class Track < Muffon::Formatter::Track::Base
          def call
            check_args

            data
          end

          private

          def required_args
            if @args[:is_minimal]
              %i[
                title
                artists
              ]
            else
              %i[
                source_original_link
                source_name
                source_track_id
                title
                artists
                duration
                is_audio_present
              ]
            end
          end

          def data
            if @args[:is_minimal]
              track_minimal_data
            else
              track_full_data
            end
          end

          def track_minimal_data
            {
              title:,
              artist: artist_data
            }
          end

          def track_full_data
            {
              **self_data,
              source: source_data,
              player_id: player_source_id,
              title:,
              artist: artist_data,
              artists:,
              duration:,
              listeners_count:,
              audio: audio_data
            }.compact
          end
        end
      end
    end
  end
end
