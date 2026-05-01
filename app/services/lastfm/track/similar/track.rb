module LastFM
  module Track
    class Similar
      class Track < LastFM::Base
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
          Muffon::Formatter::Source::Track::SimilarTracks::Track.call(
            source_original_link:,
            source_name:,
            source_track_id: nil,
            title:,
            artists:,
            duration:,
            is_minimal: @args[:is_minimal],
            is_audio_present: audio_present?,
            **self_args
          )
        end

        def raw_track_data
          @args[:raw_track_data]
        end
      end
    end
  end
end
