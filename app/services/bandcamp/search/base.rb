module Bandcamp
  module Search
    class Base < Bandcamp::Base
      private

      def primary_args
        [@args.query]
      end

      def no_data?
        search_response.blank?
      end

      def search_response
        @search_response ||= Bing::Search.call(params)[:search]
      end

      def params
        {
          query: query,
          page: @args.page,
          limit: 50
        }
      end

      def query
        "#{@args.query} site:bandcamp.com"
      end

      def data
        { search: search_data }
      end

      def search_data
        {
          page: search_response[:page],
          collection_name.to_sym => collection_data
        }
      end

      def collection_data
        collection_list.map { |i| collection_item_data(i) }
      end

      def collection_list
        results_filtered.first(limit)
      end

      def results_filtered
        search_response[:results].select { |r| matched?(r) }
      end

      def matched?(result)
        result[:link][%r{/#{model_name}/}].present?
      end

      def limit
        (@args.limit || 20).to_i
      end

      def collection_item_data(item)
        {
          title: item[:title],
          images: images_data,
          link: item[:link]
        }
      end

      def images_data
        default_images_data(model_name)
      end
    end
  end
end
