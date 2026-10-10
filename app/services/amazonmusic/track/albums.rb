module AmazonMusic
  module Track
    class Albums < AmazonMusic::Track::Info
      private

      def track_data
        Muffon::Formatter::Source::Track::Albums.call(
          source_original_link:,
          source_name:,
          source_track_id: amazonmusic_id,
          title:,
          artists:,
          albums: [album_data]
        )
      end

      def album_data
        AmazonMusic::Album::Info.call(
          album_id: album_amazonmusic_id,
          is_list: true,
          **self_args
        )[:album]
      end
    end
  end
end
