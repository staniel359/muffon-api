module Audius
  module Mixins
    module Track
      include Muffon::Mixins::Formatting::Collection

      def title
        raw_track_data['title']
      end

      def raw_artists
        [raw_artist_data]
      end

      def raw_artist_data
        {
          name: raw_track_data.dig(
            'user',
            'name'
          ),
          source_id: raw_track_data.dig(
            'user',
            'id'
          )
        }
      end

      def audius_id
        raw_track_data['track_id']
      end

      def source_original_link
        "https://audius.co#{audius_slug}"
      end

      def audius_slug
        raw_track_data['permalink']
      end

      def image_data
        Audius::Formatter::Image.call(
          images_data:
        )
      end

      def images_data
        raw_track_data['artwork']
      end

      def duration
        raw_track_data['duration']
      end

      def audio_present?
        raw_audio_link.present?
      end

      def raw_audio_link
        raw_track_data.dig(
          'stream',
          'url'
        )
      end

      def audio_link
        replace_url_host(
          url: raw_audio_link,
          new_host: audio_link_mirrors[0]
        )
      end

      def audio_link_mirrors
        raw_track_data.dig(
          'stream',
          'mirrors'
        )
      end

      def album_title
        raw_album_data.try(
          :[],
          'playlist_name'
        )
      end

      def raw_album_data
        raw_track_data['album_backlink']
      end

      def album_audius_id
        raw_album_data.try(
          :[],
          'playlist_id'
        )
      end

      def description
        raw_track_data['description']
      end

      def raw_tags
        raw_track_data['genre'].split('/')
      end

      def tag_name_formatted(
        tag_data
      )
        tag_data
      end
    end
  end
end
