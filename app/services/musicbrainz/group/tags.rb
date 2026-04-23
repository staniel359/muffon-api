module MusicBrainz
  module Group
    class Tags < MusicBrainz::Group::Info
      private

      def group_data
        Muffon::Formatter::AlbumGroup::Tags.call(
          tags:
        )
      end
    end
  end
end
