module AmazonMusic
  module Mixins
    module Track
      include Muffon::Mixins::Formatting::Collection
      include AmazonMusic::Mixins::Base

      private

      def title
        raw_track_data['shortTitle']
      end

      def raw_artists
        raw_raw_artists.map do |raw_artist_data|
          {
            name: raw_artist_data.dig('node', 'name'),
            source_id: raw_artist_data.dig('node', 'id')
          }
        end
      end

      def raw_raw_artists
        raw_track_data.dig(
          'contributingArtists',
          'edges'
        )
      end

      def amazonmusic_id
        raw_track_data['id']
      end

      def source_original_link
        "#{WEB_BASE_URL}/tracks/#{amazonmusic_id}"
      end

      def album_title
        raw_track_data.dig(
          'album',
          'shortTitle'
        ) || raw_track_data.dig(
          'album',
          'title'
        )
      end

      def album_amazonmusic_id
        raw_track_data.dig(
          'album',
          'id'
        )
      end

      def image_data
        AmazonMusic::Formatter::Image.call(
          image_id:
        )
      end

      def image_id
        raw_track_data.dig(
          'images',
          0,
          'url'
        ).match(
          %r{/images/I/([^.]+)}
        )[1]
      end

      def audio_present?
        true
      end

      def audio_link
        return if @args[:with_audio].blank?

        AmazonMusic::Utils::Track::Audio::Link.call(
          track_id: @args[:track_id]
        )
      end

      def duration
        raw_track_data['duration']
      end
    end
  end
end
