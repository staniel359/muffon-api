module Deezer
  module Track
    class Info < Deezer::Base
      private

      def primary_args
        [@args.track_id]
      end

      def no_data?
        response_data['error'].present?
      end

      def link
        "#{base_link}/track/#{@args.track_id}"
      end

      def data
        { track: track_data }
      end

      def track_data
        track_base_data.merge(track_extra_data)
      end

      def track_base_data
        {
          id: track_id(artist_name(response_data), title),
          title: title,
          artist: artist_data(response_data)
        }
      end

      def track_extra_data
        {
          album: album_data,
          image: image_data(response_data['album'], 'track'),
          length: response_data['duration'],
          released: date_formatted(response_data['release_date']),
          audio: audio_data
        }
      end

      def album_data
        return {} if response_data['album'].blank?

        { title: response_data.dig('album', 'title') }
      end

      def audio_data
        {
          present: audio_path.present?,
          link: audio_link,
          source: 'deezer'
        }
      end

      def audio_path
        @audio_path ||= Deezer::Utils::Audio::Decoder.call(
          track_id: response_data['id']
        )
      end

      def audio_link
        return '' if audio_path.blank?

        "#{secrets[:files_url]}/#{audio_path}"
      end
    end
  end
end
