module Bandcamp
  module Search
    class Base < Bandcamp::Base
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
          scope:,
          page: @args[:page]
        }
      end

      def scope
        "bandcamp_#{collection_name}"
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
          name: model_artist_name(item),
          bandcamp_slug: model_artist_slug(item)
        }
      end

      def model_artist_name(item)
        item[:site_name] || 'Bandcamp'
      end

      def model_artist_slug(item)
        link_data(
          item[:link]
        )[:artist]
      end

      def link_data(link)
        return {} if link.blank?

        artist, model, title = link.scan(
          link_regexp
        ).flatten

        {
          artist: artist.to_s,
          model: model || 'artist',
          title: title.to_s
        }
      end

      def link_regexp
        %r{
          (?=https?://)?
          ([\w-]+).bandcamp.com
          (?:(?:/(album|track))
          (?:/([\w\-]+))?)?
        }x
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
