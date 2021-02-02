module Deezer
  module Album
    class Base < Deezer::Base
      private

      def primary_args
        [@args.album_id]
      end

      def no_data?
        response_data['error'].present?
      end

      def link
        "#{base_link}/album/#{@args.album_id}"
      end

      def data
        { album: album_data }
      end

      def tags
        tags_list.map { |g| g['name'] }
      end

      def tags_list
        response_data.dig('genres', 'data')
      end
    end
  end
end
