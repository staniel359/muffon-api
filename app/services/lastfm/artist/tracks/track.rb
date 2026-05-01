module LastFM
  module Artist
    class Tracks
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
          update_record_data!

          Muffon::Formatter::Source::Artist::Tracks::Track.call(
            source_original_link:,
            source_name:,
            source_track_id: nil,
            title:,
            artists:,
            is_with_artist_image: with_artist_image?,
            **self_args
          )
        end

        def raw_track_data
          @args[:raw_track_data]
        end

        def with_artist_image?
          !!@args[:is_with_artist_image]
        end
      end
    end
  end
end
