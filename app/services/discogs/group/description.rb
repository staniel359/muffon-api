module Discogs
  module Group
    class Description < Discogs::Group::Info
      private

      def group_data
        { description: description }
      end
    end
  end
end
