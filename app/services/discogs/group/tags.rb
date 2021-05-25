module Discogs
  module Group
    class Tags < Discogs::Group::Base
      private

      def group_data
        { tags: tags }
      end
    end
  end
end
