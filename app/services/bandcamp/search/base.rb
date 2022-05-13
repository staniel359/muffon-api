module Bandcamp
  module Search
    class Base < Bandcamp::Base
      LINK_REGEX = %r{
        (?=https?://)?
        ([\w-]+).bandcamp.com
        (?:(?:/(album|track))
        (?:/([\w\-]+))?)?
      }x
      include Muffon::Utils::Pagination

      private

      def primary_args
        [@args[:query]]
      end

      def response_data
        @response_data ||=
          Google::Search.call(
            params
          )[:search]
      end

      def params
        {
          query: @args[:query],
          scope:
            "bandcamp_#{collection_name}",
          page: @args[:page]
        }
      end

      def data
        { search: paginated_data }
      end

      def page
        response_data[:page]
      end

      def total_pages_count
        response_data[:total_pages]
      end

      def collection_list
        response_data[:results]
      end

      def model_title(item)
        item[:title].split(
          ', by '
        )[0]
      end

      def model_artist_data(item)
        {
          source:
            model_artist_source_data(item),
          name: model_artist_name(item)
        }
      end

      def model_artist_source_data(item)
        {
          name: source_name,
          slug: model_artist_slug(item)
        }
      end

      def model_artist_slug(item)
        link_data(
          item[:link]
        )[:artist]
      end

      def link_data(link)
        return {} if link.blank?

        artist, model, title =
          link.scan(
            LINK_REGEX
          ).flatten

        {
          artist: artist.to_s,
          model: model || 'artist',
          title: title.to_s
        }
      end

      def model_artist_name(item)
        item[:site_name] ||
          'Various Artists'
      end

      def model_name(item)
        link_data(
          item[:link]
        )[:model]
      end

      def model_title_slug(item)
        link_data(
          item[:link]
        )[:title]
      end
    end
  end
end
