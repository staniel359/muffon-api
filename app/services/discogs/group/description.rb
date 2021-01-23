module Discogs
  module Group
    class Description < Discogs::Group::Base
      private

      def data
        { group: group_data }
      end

      def group_data
        {
          title: response_data['title'],
          artist: artist_data,
          description: description
        }
      end
    end
  end
end
