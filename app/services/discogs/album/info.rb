module Discogs
  module Album
    class Info < Discogs::Album::Base
      include Discogs::Mixins::Album

      private

      def album_data
        Muffon::Formatter::Source::Album::Info.call(
          source_original_link:,
          source_name:,
          source_album_id: discogs_id,
          source_model: discogs_model,
          title:,
          artists:,
          image_data:,
          release_date:,
          description:,
          description_size: 'medium',
          tags:,
          tags_size: 'extrasmall',
          labels:,
          plays_count: nil,
          tracks:,
          **self_args
        )
      end

      def raw_release_date
        raw_album_data['released']
      end

      def track_data_formatted(
        raw_track_data
      )
        Discogs::Album::Tracks::Track.call(
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
