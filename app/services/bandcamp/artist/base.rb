module Bandcamp
  module Artist
    class Base < Bandcamp::Base
      include Muffon::Utils::Pagination

      private

      def primary_args
        [@args.artist_id]
      end

      def params
        { band_id: @args.artist_id }
      end

      def data
        { artist: artist_data }
      end

      alias link artist_label_link
    end
  end
end
