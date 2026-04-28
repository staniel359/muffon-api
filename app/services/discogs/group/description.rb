module Discogs
  module Group
    class Description < Discogs::Group::Info
      private

      def group_data
        Muffon::Formatter::Source::AlbumGroup::Description.call(
          description:
        )
      end
    end
  end
end
