module Muffon
  module Profile
    module Recommendations
      class Tracks
        class Track < Muffon::Profile::Recommendations::Tracks
          include Muffon::Utils::Track
          include Muffon::Utils::Source::Track

          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              recommendation
            ]
          end

          def data
            self_data
              .merge(recommendation_data)
          end

          def recommendation_data
            {
              source: source_data,
              id:,
              player_id:,
              title:,
              artist: artists_base_data,
              artists:,
              tracks_count:
            }.compact
          end

          def id
            recommendation.id
          end

          def recommendation
            @args[:recommendation]
          end

          def title
            track.title
          end

          def track
            @track ||= recommendation.track
          end

          def artist_name
            track
              .artist
              .name
          end

          def artists
            [artist_data]
          end

          def artist_data
            { name: artist_name }
          end

          def tracks_count
            recommendation
              .library_track_ids
              .size
          end
        end
      end
    end
  end
end
