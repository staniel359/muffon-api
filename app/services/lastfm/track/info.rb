module LastFM
  module Track
    class Info < LastFM::Track::Base
      include LastFM::Mixins::Track

      private

      def request_params
        {
          **super,
          lang: language
        }.compact
      end

      def track_data
        update_track_record!

        Muffon::Formatter::Source::Track::Info.call(
          source_original_link:,
          source_name:,
          source_track_id: nil,
          title:,
          artists:,
          image_data:,
          album_title:,
          source_album_id: nil,
          release_date: nil,
          plays_count:,
          duration:,
          description:,
          tags:,
          tags_size: 'extrasmall',
          is_audio_present: audio_present?,
          audio_link:,
          **self_args
        )
      end

      def duration
        super / 1_000
      end
    end
  end
end
