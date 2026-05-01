module Bandcamp
  module Track
    class Info < Bandcamp::Track::Base
      private

      def not_found?
        super || track_info_data.blank?
      end

      def track_info_data
        @track_info_data ||=
          Bandcamp::Utils::Web::Info.call(
            url: bandcamp_url
          )
      end

      def bandcamp_url
        response_data['bandcamp_url']
      end

      def track_data
        Muffon::Formatter::Source::Track::Info.call(
          source_original_link:,
          source_name:,
          source_track_id: bandcamp_id,
          source_track_artist_id: artist_bandcamp_id,
          source_model: bandcamp_model,
          title:,
          artists:,
          image_data:,
          album_title:,
          source_album_id: album_bandcamp_id,
          source_album_artist_id: artist_bandcamp_id,
          release_date: nil,
          plays_count: nil,
          duration:,
          description:,
          tags:,
          tags_size: 'extrasmall',
          is_audio_present: audio_present?,
          audio_link:,
          **self_args
        )
      end

      def artist_name
        track_info_data['artist']
      end

      def album_title
        response_data['album_title']
      end

      def album_bandcamp_id
        response_data['album_id']
      end

      def description
        response_data['about'].presence
      end

      def raw_tags
        response_data['tags']
      end

      def image_id
        response_data['art_id']
      end
    end
  end
end
