module Odnoklassniki
  module Mixins
    module Track
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        raw_track_data['name']
      end

      def raw_artists
        raw_track_data['allArtists'].map do |raw_artist_data|
          {
            name: raw_artist_data['name'],
            source_id: raw_artist_data['id']
          }
        end.presence || [raw_artist_data]
      end

      def raw_artist_data
        {
          name: raw_track_data['ensemble'],
          source_id: raw_track_data['masterArtistId']
        }
      end

      def odnoklassniki_id
        raw_track_data['id']
      end

      def source_original_link
        "https://ok.ru/music/track/#{odnoklassniki_id}"
      end

      def image_data
        Odnoklassniki::Formatter::Image.call(
          image_url:
        )
      end

      def duration
        raw_track_data['duration']
      end

      def audio_present?
        true
      end

      def album_title
        raw_album_data.try(:[], 'name')
      end

      def album_odnoklassniki_id
        raw_album_data.try(:[], 'id')
      end

      def audio_link
        return if @args[:with_audio].blank?

        Odnoklassniki::Utils::Track::Audio::Link.call(
          raw_audio_link:
        )
      end

      def raw_audio_link
        response_data['play']
      end
    end
  end
end
