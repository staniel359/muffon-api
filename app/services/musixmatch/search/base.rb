module MusixMatch
  module Search
    class Base < MusixMatch::Base
      include MusixMatch::Utils::Pagination

      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          query
        ]
      end

      def link
        "#{BASE_LINK}/#{model_name}.search"
      end

      def params
        {
          **super,
          q: @args[:query]
        }
      end

      def data
        { search: paginated_data }
      end
    end
  end
end
