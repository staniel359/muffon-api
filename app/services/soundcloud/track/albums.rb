module SoundCloud
  module Track
    class Albums < SoundCloud::Track::Base
      include SoundCloud::Mixins::Track

      private

      def track_data
        Muffon::Formatter::Track::Albums.call(
          source_original_link:,
          source_name:,
          source_track_id: soundcloud_id,
          title:,
          artists:,
          albums: []
        )
      end
    end
  end
end
