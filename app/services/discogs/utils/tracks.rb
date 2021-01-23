module Discogs
  module Utils
    class Tracks < Discogs::Base
      def call
        data
      end

      private

      def data
        tracks_filtered.map { |t| track_data(t) }
      end

      def tracks_filtered
        tracks_list.select { |t| t['type_'] == 'track' }
      end

      def tracks_list
        @args.response_data['tracklist']
      end

      def track_data(track)
        Discogs::Utils::Track.call(track: track, artists: artists)
      end

      def artists
        @args.response_data['artists']
      end
    end
  end
end
