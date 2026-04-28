module AmazonMusic
  module Track
    class Albums < AmazonMusic::Track::Base
      include AmazonMusic::Mixins::Track

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

      def title
        raw_track_data['primaryText']
      end

      def artist_name
        raw_track_data.dig(
          'contextMenu',
          'options',
          0,
          'onItemSelected',
          1,
          'template',
          'headerPrimaryText'
        )
      end

      def artist_amazonmusic_slug
        raw_track_data.dig(
          'contextMenu',
          'options',
          1,
          'onItemSelected',
          2,
          'template',
          'templateData',
          'deeplink'
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
