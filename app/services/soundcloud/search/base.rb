module SoundCloud
  module Search
    class Base < SoundCloud::Base
      private

      def primary_args
        [@args.query]
      end

      def no_data?
        response_data.blank?
      end

      def link
        "#{base_link}/#{soundcloud_collection_name}"
      end

      def extra_params
        {
          q: @args.query,
          limit: total_limit,
          offset: offset
        }
      end

      def offset
        (page - 1) * total_limit
      end

      def page
        (@args.page || 1).to_i
      end

      def data
        { search: search_data }
      end

      def search_data
        { collection_name.to_sym => collection_data }
      end

      def collection_data
        collection_list.map { |t| collection_item_data(t) }
      end
    end
  end
end
