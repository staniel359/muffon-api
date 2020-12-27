module Bandcamp
  module Album
    class Base < Bandcamp::Base
      private

      def primary_args
        [@args.album_link]
      end

      def no_data?
        album_scripts.blank?
      end

      def album_scripts
        @album_scripts ||= response_data.css('script')
      end

      def info_data
        @info_data ||= JSON.parse(album_scripts[0])
      end

      def data
        { album: album_data }
      end
    end
  end
end
