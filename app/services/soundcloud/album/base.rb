module SoundCloud
  module Album
    class Base < SoundCloud::Base
      include SoundCloud::Utils::Album

      private

      def primary_args
        [@args.album_id]
      end

      def no_data?
        album.blank?
      end

      def album
        @album ||= response_data
      end

      def link
        "#{BASE_LINK}/playlists/#{@args.album_id}"
      end

      def data
        { album: album_data }
      end

      def tags_list
        [
          raw_genres,
          raw_tags
        ].flatten.reject(&:blank?)
      end

      def raw_genres
        album['genre']
      end

      def raw_tags
        album['tags'].split(/\s?"\s?/)
      end
    end
  end
end
