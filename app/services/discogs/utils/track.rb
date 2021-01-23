module Discogs
  module Utils
    class Track < Discogs::Base
      def call
        data
      end

      private

      def data
        {
          id: track_id,
          title: title,
          artist: artist_data,
          length: length
        }.compact
      end

      def track_id
        super(artist_name(artists), title)
      end

      def artists
        track_artists || @args.artists
      end

      def track_artists
        @args.track['artists']
      end

      def title
        @args.track['title']
      end

      def artist_data
        return if track_artists.blank?

        { name: artist_name(track_artists) }
      end

      def length
        length_formatted(@args.track['duration'])
      end
    end
  end
end
