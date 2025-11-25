module Bandcamp
  module Artist
    class Base < Bandcamp::Base
      def call
        check_args

        check_if_not_found

        data
      end

      private

      def required_args
        %i[
          artist_id
        ]
      end

      def not_found?
        name.blank?
      end

      def name
        artist['name']
      end

      def params
        { band_id: @args[:artist_id] }
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: }
      end

      alias link artist_label_link
      alias artist response_data
    end
  end
end
