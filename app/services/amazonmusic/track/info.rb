module AmazonMusic
  module Track
    class Info < AmazonMusic::Track::Base
      include AmazonMusic::Mixins::Track

      private

      def track_data
        Muffon::Formatter::Track::Info.call(
          source_original_link:,
          source_name:,
          source_track_id: amazonmusic_id,
          source_track_album_id: album_amazonmusic_id,
          title:,
          artists:,
          image_data:,
          album_title:,
          source_album_id: album_amazonmusic_id,
          plays_count: nil,
          duration:,
          release_date: nil,
          description: nil,
          description_size: nil,
          tags: nil,
          tags_size: nil,
          is_audio_present: audio_present?,
          audio_link:,
          **self_args
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

      def image_url
        raw_album_data['headerImage']
      end
    end
  end
end
