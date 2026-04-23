module MusixMatch
  module Mixins
    module Track
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        raw_track_data['name']
      end

      def musixmatch_slug
        CGI.escape(
          raw_musixmatch_slug
        )
      end

      def raw_musixmatch_slug
        raw_track_data['vanityId']
      end

      def source_original_link
        "https://www.musixmatch.com/lyrics/#{raw_musixmatch_slug}"
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
        raw_track_data['artistName']
      end

      def artist_musixmatch_slug
        raw_musixmatch_slug.split('/')[0]
      end

      def album_title
        raw_track_data['albumName']
      end

      def album_musixmatch_slug
        CGI.escape(
          raw_album_musixmatch_slug
        )
      end

      def raw_album_musixmatch_slug
        raw_track_data['albumVanityId']
      end

      def image_data
        MusixMatch::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_track_data['coverImageHD'].presence
      end

      def audio_present?
        false
      end

      def audio_link
        nil
      end
    end
  end
end
