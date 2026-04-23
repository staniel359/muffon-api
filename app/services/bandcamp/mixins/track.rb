module Bandcamp
  module Mixins
    module Track
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        raw_track_data['title']
      end

      def raw_artists
        [raw_artist_data]
      end

      def raw_artist_data
        {
          name: artist_name,
          source_id: artist_bandcamp_id
        }
      end

      def artist_name
        raw_track_data['band_name'].presence || 'Unknown Artist'
      end

      def artist_bandcamp_id
        raw_track_data['band_id']
      end

      def bandcamp_id
        raw_track_data['track_id']
      end

      def bandcamp_model
        'track'
      end

      def album_title
        raw_track_data['album_name']
      end

      def album_bandcamp_id
        raw_track_data['album_id']
      end

      def source_original_link
        response_data['bandcamp_url']
      end

      def duration
        return if raw_duration.blank?

        raw_duration.to_i
      end

      def raw_duration
        raw_track_data['duration']
      end

      def audio_present?
        audio_link.present?
      end

      def audio_link
        raw_track_data.dig(
          'streaming_url',
          'mp3-128'
        )
      end

      def image_data
        Bandcamp::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        "https://f4.bcbits.com/img/a#{image_id}_10.jpg"
      end

      def image_id
        raw_track_data['art_id']
      end

      def tag_name_formatted(
        tag_data
      )
        tag_data['name']
      end
    end
  end
end
