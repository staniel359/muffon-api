module Muffon
  module Utils
    module Formatters
      private

      def date_formatted(data)
        Muffon::Utils::Date.format(data)
      end

      def datetime_formatted(date)
        date.strftime('%F %T')
      end

      def duration_formatted(data)
        Muffon::Utils::Duration.format(data)
      end

      def description_truncated
        description.truncate(400)
      end

      def artist_formatted
        { name: artist_names }
      end

      def artist_names
        artists.pluck(
          :name
        ).join(', ')
      end

      def album_formatted
        return if albums.blank?

        { title: album_title }
      end

      def album_title
        albums.dig(0, :title)
      end

      def tags
        tags_list.map do |t|
          tag_data_formatted(t)
        end
      end

      def tag_data_formatted(tag)
        { name: tag_name_formatted(tag) }
      end

      def tag_name_formatted(tag)
        case tag.class.name
        when 'String'
          tag
        when 'Hash'
          tag['name'] || tag['label']
        when 'Nokogiri::XML::Element'
          tag.text
        end
      end
    end
  end
end
