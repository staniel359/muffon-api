module Discogs
  module Group
    class Tags < Discogs::Group::Info
      private

      def group_data
        { tags: tags }
      end
    end
  end
end
