module Bandcamp
  module Track
    class Info < Bandcamp::Track::Base
      private

      def track_data
        self_data
          .merge(track_base_data)
          .merge(track_extra_data)
          .merge(with_more_data)
      end

      def track_base_data
        {
          source: source_data,
          player_id:,
          title:,
          artist: artists_base_data,
          artists:
        }
      end

      def artist_name
        track_info_data['artist']
      end

      def track_info_data
        @track_info_data ||=
          Bandcamp::Web::Info.call(
            link: bandcamp_link
          )
      end

      def bandcamp_link
        response_data['bandcamp_url']
      end

      def track_extra_data
        {
          album: album_data,
          image: image_data,
          profiles_count:,
          duration:,
          description:
            description_truncated,
          tags: tags_truncated,
          audio: audio_data
        }.compact
      end

      def album_data
        return if album_title.blank?

        {
          source: album_source_data,
          title: album_title,
          artist: artists_minimal_data,
          artists:
        }
      end

      def album_source_data
        {
          name: source_name,
          id: album_bandcamp_id,
          artist_id:
            artist_bandcamp_id
        }
      end

      def album_title
        response_data['album_title']
      end

      def album_bandcamp_id
        response_data['album_id']
      end

      def image_data
        image_data_formatted(
          image(
            response_data
          )
        )
      end

      def description
        response_data['about']
      end

      def tags_list
        response_data['tags']
      end

      def audio_data
        {
          present: audio_present?,
          link: audio_link
        }.compact
      end
    end
  end
end
