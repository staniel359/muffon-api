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
        track_main_data.merge(track_extra_data)
      end

      def track_main_data
        {
          id: track_id(
            response_data.dig('artist', 'name'),
            response_data['title']
          ),
          title: response_data['title'],
          artist: artist_data
        }
      end

      def artist_data
        { name: response_data.dig('artist', 'name') }
      end

      def track_extra_data
        {
          album: album_data,
          images: images_data(response_data['album'], 'track'),
          length: response_data['duration'],
          released: released,
          audio: audio_data
        }
      end

      def album_data
        return {} if response_data['album'].blank?

        { title: response_data.dig('album', 'title') }
      end

      def released
        time_formatted(response_data['release_date'])
      end

      def audio_data
        {
          present: audio_file_path.present?,
          path: audio_file_path,
          source: 'deezer'
        }
      end

      def audio_file_path
        @audio_file_path ||=
          Deezer::Utils::Audio::Decoder.call(
            track_id: response_data['id']
          )
      end
    end
  end
end
