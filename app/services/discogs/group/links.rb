module Discogs
  module Group
    class Links < Discogs::Group::Info
      private

      def group_data
        Muffon::Formatter::Source::AlbumGroup::Links.call(
          source_original_link:,
          source_name:,
          source_album_group_id: discogs_id
        )
      end
    end
  end
end
