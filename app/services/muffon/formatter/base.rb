module Muffon
  module Formatter
    class Base < Muffon::Base
      private

      def source_links_data
        {
          original: source_original_link,
          streaming: source_streaming_link
        }
          .compact
          .presence
      end

      def source_original_link
        @args[:source_original_link]
      end

      def artist_data
        {
          name: artists_names_string,
          image: (
            artist_image_data if with_artist_image?
          )
        }.compact
      end

      def artists_names_string
        artists
          .pluck(:name)
          .join(', ')
      end

      def with_artist_image?
        !!@args[:is_with_artist_image]
      end

      def artist_image_data
        artist_record.image_data
      end

      def description_computed
        return if description.blank?

        if description_size.present?
          description_truncated
        else
          description
        end
      end

      def description
        @args[:description]
      end

      def description_size
        @args[:description_size]
      end

      def description_truncated
        text_truncated(
          description,
          size: description_size
        )
      end

      def tags_computed
        return if tags.blank?

        if tags_size.present?
          tags_truncated
        else
          tags
        end
      end

      def tags
        @args[:tags]
      end

      def tags_size
        @args[:tags_size]
      end

      def tags_truncated
        collection_truncated(
          tags,
          size: tags_size
        )
      end

      def with_more_data
        {
          with_more: {
            description: (
              with_more_description? if description.present?
            ),
            tags: (
              with_more_tags? if tags.present?
            )
          }.compact
        }.compact_blank
      end

      def with_more_description?
        description.size >
          description_truncated.size
      end

      def with_more_tags?
        tags.size >= 5
      end

      alias artist_name artists_names_string
    end
  end
end
