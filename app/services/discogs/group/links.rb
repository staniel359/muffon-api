module Discogs
  module Group
    class Links < Discogs::Group::Info
      private

      def group_data
        { links: source_links }
      end

      def discogs_model
        'group'
      end
    end
  end
end
