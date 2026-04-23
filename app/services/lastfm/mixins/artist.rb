module LastFM
  module Mixins
    module Artist
      include Muffon::Mixins::Artist
      include Muffon::Mixins::Formatting::Collection

      private

      def name
        raw_artist_data['name']
      end

      def source_original_link
        "https://www.last.fm/music/#{CGI.escape(name)}"
      end

      def image_data
        artist_record.image_data
      end

      def listeners_count
        return if raw_listeners_count.blank?

        raw_listeners_count.to_i
      end

      def raw_listeners_count
        raw_artist_data.dig(
          'stats',
          'listeners'
        )
      end

      def plays_count
        return if raw_plays_count.blank?

        raw_plays_count.to_i
      end

      def raw_plays_count
        raw_artist_data.dig(
          'stats',
          'playcount'
        )
      end

      def description
        LastFM::Formatter::Description.call(
          description: raw_description
        )
      end

      def raw_description
        raw_artist_data.dig(
          'bio',
          'content'
        )
      end

      def raw_tags
        raw_artist_data.dig(
          'tags',
          'tag'
        )
      end

      def tag_name_formatted(
        tag_data
      )
        tag_data['name']
      end

      def update_record_data!
        artist_record.update!(
          record_attributes
        )
      end

      def record_attributes
        {
          image_url:,
          listeners_count:
        }.compact
      end

      def image_url
        nil
      end
    end
  end
end
