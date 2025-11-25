module LastFM
  module Top
    class Base < LastFM::Base
      MAXIMUM_ITEMS_COUNT = 10_000
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

      def params
        {
          **super,
          page:,
          limit:,
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
        { top: top_data }
      end
    end
  end
end
