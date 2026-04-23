module MusixMatch
  module Mixins
    module Album
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        raw_album_data['name']
      end

      def musixmatch_slug
        CGI.escape(
          raw_musixmatch_slug
        )
      end

      def raw_musixmatch_slug
        raw_album_data['vanityId']
      end

      def source_original_link
        "https://www.musixmatch.com/album/#{raw_musixmatch_slug}"
      end

      def raw_artists
        [raw_artist_data]
      end

      def raw_artist_data
        {
          name: artist_name,
          source_slug: artist_musixmatch_slug
        }
      end

      def artist_name
        raw_album_data['artistName']
      end

      def artist_musixmatch_slug
        raw_musixmatch_slug.split('/')[0]
      end

      def release_date
        Muffon::Formatter::Date.call(
          date: raw_release_date
        )
      end

      def raw_release_date
        raw_album_data['releaseDate'] / 1_000
      end

      def image_data
        MusixMatch::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_album_data['coverImage500x500'].presence
      end

      def raw_tracks
        raw_album_data['trackList']
      end
    end
  end
end
