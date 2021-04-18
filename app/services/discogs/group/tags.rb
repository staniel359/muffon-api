module Discogs
  module Group
    class Tags < Discogs::Group::Base
      private

      def group_data
        {
          title: title,
          artist: artist_data(response_data),
          tags: tags
        }
      end
    end
  end
end
