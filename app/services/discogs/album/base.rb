module Discogs
  module Album
    class Base < Discogs::Base
      include Discogs::Utils::Album

      private

      def primary_args
        [@args.album_id]
      end

      def link
        "#{BASE_LINK}/releases/#{@args.album_id}"
      end

      def data
        { album: album_data }
      end

      def album
        @album ||= response_data
      end

      def artists_list
        album['artists']
      end

      def tracks
        tracks_filtered.map do |t|
          track_data_formatted(t)
        end
      end

      def tracks_filtered
        tracks_list.select do |t|
          t['type_'] == 'track'
        end
      end

      def tracks_list
        album['tracklist']
      end

      def track_data_formatted(track)
        track['artists'] ||= artists_list

        Discogs::Album::Info::Track.call(
          track: track,
          profile_id: @args.profile_id
        )
      end

      def tags_list
        album.values_at(
          'genres', 'styles'
        ).flatten.compact.uniq
      end
    end
  end
end
