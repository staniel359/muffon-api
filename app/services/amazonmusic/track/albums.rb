module AmazonMusic
  module Track
    class Albums < AmazonMusic::Track::Info
      private

      def track_data
        Muffon::Formatter::Source::Track::Albums.call(
          source_original_link:,
          source_name:,
          source_track_id: amazonmusic_id,
          source_track_album_id: album_amazonmusic_id,
          title:,
          artists:,
          source_album_id: album_amazonmusic_id,
          albums: [album_data]
        )
      end

      def album_data
        AmazonMusic::Album::Info.call(
          album_id: @args[:album_id],
          is_list: true,
          **self_args
        )[:album]
      end
    end
  end
end
