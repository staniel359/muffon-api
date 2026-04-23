module Discogs
  module Group
    class Tags < Discogs::Group::Info
      private

      def group_data
        Muffon::Formatter::AlbumGroup::Tags.call(
          tags:
        )
      end
    end
  end
end
