module LastFM
  module Top
    class Base < LastFM::Base
      TOTAL_LIMIT = 10_000
      COUNTRIES_CODES_NAMES_DATA = {
        **ISO3166::Country.translations,
        'CI' => "Cote d'Ivoire",
        'CV' => 'Cape Verde',
        'CZ' => 'Czech Republic',
        'IR' => 'Iran, Islamic Republic of',
        'KP' => "Korea, Democratic People's Republic of",
        'KR' => 'Korea, Republic of',
        'LY' => 'Libyan Arab Jamahiriya',
        'MK' => 'Macedonia',
        'PS' => 'Palestinian Territory, Occupied',
        'RE' => 'Reunion',
        'SH' => 'Saint Helena',
        'SX' => 'Sint Maarten',
        'SZ' => 'Swaziland',
        'TR' => 'Turkey',
        'TZ' => 'Tanzania, United Republic of',
        'VN' => 'Viet Nam'
      }.freeze

      include Muffon::Utils::Pagination

      def call
        check_args

        check_if_not_found

        data
      end

      private

      def not_found?
        response_data['error'].present?
      end

      def f_param
        return if country_code.blank?

        "geo:#{country_code}"
      end

      def country_code
        @args[:country]
      end

      def api_method
        if country_code.present?
          raise not_found_error if collection_name == 'tags'

          "geo.getTop#{collection_name.capitalize}"

        else
          "chart.getTop#{collection_name.capitalize}"
        end
      end

      def params
        {
          **super,
          **pagination_params,
          country: country_name
        }.compact
      end

      def country_name
        return if country_code.blank?

        COUNTRIES_CODES_NAMES_DATA[
          country_code.upcase
        ]&.downcase
      end

      def data
        { top: paginated_data }
      end

      def collection_count
        response_data
          .dig(
            collection_name_computed,
            '@attr',
            'total'
          ).to_i
      end

      def collection_name_computed
        if country_code.present? && collection_name == 'artists'
          "top#{collection_name}"
        else
          collection_name
        end
      end

      def collection_list
        response_data
          .dig(
            collection_name_computed,
            self.class::MODEL_NAME
          )
          .last(
            limit
          )
      end
    end
  end
end
