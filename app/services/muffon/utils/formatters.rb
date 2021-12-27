module Muffon
  module Utils
    module Formatters
      private

      def artists
        artists_list.map do |a|
          artist_data_formatted(a)
        end.presence
      end

      def albums
        albums_list.map do |a|
          album_data_formatted(a)
        end.presence
      end

      def tracks
        tracks_list.map do |t|
          track_data_formatted(t)
        end.presence
      end

      def labels
        labels_list.map do |l|
          label_data_formatted(l)
        end.uniq.presence
      end

      def tags
        tags_list.map do |t|
          tag_data_formatted(t)
        end.presence
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
        description
          &.truncate(400)
          .presence
      end

      def artist_names
        artists.pluck(
          :name
        ).join(', ')
      end
    end
  end
end
