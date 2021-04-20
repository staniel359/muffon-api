module Bandcamp
  module Search
    class Base < Bandcamp::Base
      private

      def primary_args
        [@args.query]
      end

      def response_data
        @response_data ||= Google::Search.call(params)[:search]
      end

      def params
        {
          query: @args.query,
          scope: "bandcamp_#{collection_name}",
          page: @args.page
        }
      end

      def data
        { search: search_data }
      end

      def search_data
        {
          page: response_data[:page],
          total_pages: response_data[:total_pages],
          collection_name.to_sym => collection_data
        }
      end

      def collection_data
        collection_list.map { |i| collection_item_data(i) }
      end

      def collection_list
        response_data[:results]
      end

      def artist_name(item)
        item[:site_name]
      end

      def title(item)
        item[:title].split(', by ')[0]
      end

      def artist_data(item)
        {
          name: artist_name(item),
          bandcamp_name: link_data(item[:link])[:artist]
        }
      end

      def bandcamp_artist(item)
        link_data(item[:link])[:artist]
      end

      def link_data(link)
        artist, model, title =
          link.scan(link_regexp).flatten

        {
          artist: artist.to_s,
          model: model || 'artist',
          title: title.to_s
        }
      end

      def link_regexp
        %r{(?=https?://)?([\w-]+).bandcamp.com
          (?:(?:/(album|track))(?:/([\w\-]+))?)?}x
      end

      def bandcamp_model(item)
        link_data(item[:link])[:model]
      end

      def bandcamp_title(item)
        link_data(item[:link])[:title]
      end
    end
  end
end
