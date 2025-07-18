module LastFM
  module Top
    class Base < LastFM::Base
      TOTAL_LIMIT = 10_000

      include Muffon::Utils::Pagination

      private

      def f_param
        return if @args[:country].blank?

        "geo:#{@args[:country]}"
      end

      def api_method
        if @args[:country].present?
          "geo.getTop#{collection_name.capitalize}"
        else
          "chart.getTop#{collection_name.capitalize}"
        end
      end

      def params
        {
          **super,
          **pagination_params,
          country: (
            ISO3166::Country[@args[:country]].translations['en'] if @args[:country].present?
          )
        }.compact
      end

      def data
        { top: paginated_data }
      end

      def collection_count
        response_data.dig(
          (@args[:country].present? ? "top#{collection_name}" : collection_name),
          '@attr',
          'total'
        ).to_i
      end

      def collection_list
        response_data.dig(
          (@args[:country].present? && collection_name == 'artists' ? "top#{collection_name}" : collection_name),
          self.class::MODEL_NAME
        ).last(limit)
      end
    end
  end
end
