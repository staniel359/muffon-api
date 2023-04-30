module MusicBrainz
  module Group
    class Links < MusicBrainz::Group::Info
      private

      def group_data
        { links: source_links }
      end
    end
  end
end
