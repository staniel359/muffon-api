module Discogs
  module Group
    class Info < Discogs::Group::Base
      include Discogs::Mixins::AlbumGroup

      private

      def group_data
        Muffon::Formatter::Source::AlbumGroup::Info.call(
          source_original_link:,
          source_name:,
          source_album_group_id: discogs_id,
          source_model: discogs_model,
          title:,
          artists:,
          image_data:,
          release_date:,
          description:,
          tags:,
          tags_size: 'extrasmall',
          tracks:,
          **self_args
        )
      end

      def track_data_formatted(
        raw_track_data
      )
        Discogs::Group::Tracks::Track.call(
          raw_track_data:,
          artists:,
          album_data: album_base_data,
          **self_args
        )
      end

      def album_base_data
        @album_base_data ||=
          Muffon::Formatter::Source::Track::Albums::Album.call(
            source_original_link:,
            source_name:,
            source_album_id: discogs_id,
            source_model: discogs_model,
            title:,
            artists:,
            image_data:,
            release_date: nil
          )
      end
    end
  end
end
