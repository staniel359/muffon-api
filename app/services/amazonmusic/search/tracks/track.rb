module AmazonMusic
  module Search
    class Tracks
      class Track < AmazonMusic::Search::Base
        include AmazonMusic::Mixins::Track

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
          Muffon::Formatter::Source::Search::Tracks::Track.call(
            source_original_link:,
            source_name:,
            source_track_id: amazonmusic_id,
            source_track_album_id: album_amazonmusic_id,
            title:,
            artists:,
            image_data:,
            album_title:,
            source_album_id: album_amazonmusic_id,
            duration:,
            is_audio_present: audio_present?,
            **self_args,
            **query_match_args
          )
        end

        def raw_track_data
          @args[:raw_track_data]
        end
      end
    end
  end
end
