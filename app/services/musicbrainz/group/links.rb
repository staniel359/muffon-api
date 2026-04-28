module MusicBrainz
  module Group
    class Links < MusicBrainz::Group::Info
      private

      def group_data
        Muffon::Formatter::Source::AlbumGroup::Links.call(
          source_original_link:,
          source_name:,
          source_album_group_id: musicbrainz_id
        )
      end
    end
  end
end
