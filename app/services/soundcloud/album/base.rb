module SoundCloud
  module Album
    class Base < SoundCloud::Base
      private

      def primary_args
        [@args.album_id]
      end

      def link
        "#{base_link}/playlists/#{@args.album_id}"
      end

      def data
        { album: album_data }
      end

      def description
        response_data['description'].to_s
      end

      def tags
        [response_data['genre'], tags_list].flatten.reject(&:blank?)
      end

      def tags_list
        response_data['tags'].split(/\s?"\s?/)
      end
    end
  end
end
