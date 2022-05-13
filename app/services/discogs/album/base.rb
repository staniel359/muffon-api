module Discogs
  module Album
    class Base < Discogs::Base
      include Discogs::Utils::Album

      private

      def primary_args
        [@args[:album_id]]
      end

      def link
        "#{BASE_LINK}/releases/#{@args[:album_id]}"
      end

      def data
        { album: album_data }
      end

      def artists_list
        album['artists']
      end

      def tracks_list
        album['tracklist'].select do |t|
          t['type_'] == 'track'
        end
      end

      def track_data_formatted(track)
        Discogs::Album::Info::Track.call(
          track:,
          artists: artists_list,
          profile_id: @args[:profile_id]
        )
      end

      def tags_list
        album.values_at(
          'genres', 'styles'
        ).flatten.compact.uniq
      end

      alias album response_data
    end
  end
end
