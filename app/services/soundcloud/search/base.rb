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

      def extra_params
        {
          q: @args.query,
          limit: limit,
          offset: offset
        }
      end

      def offset
        (page - 1) * limit
      end

      def page
        (@args.page || 1).to_i
      end

      def data
        { search: search_data }
      end
    end
  end
end
