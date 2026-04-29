module Audius
  module Album
    class Info < Audius::Album::Base
      include Audius::Mixins::Album

      private

      def album_data
        if @args[:is_list]
          album_list_data
        else
          album_full_data
        end
      end

      def album_list_data
        Muffon::Formatter::Source::Track::Albums::Album.call(
          source_original_link:,
          source_name:,
          source_album_id: audius_id,
          title:,
          artists:,
          image_data:,
          release_date:,
          **self_args
        )
      end

      def album_full_data
        Muffon::Formatter::Source::Album::Info.call(
          source_original_link:,
          source_name:,
          source_album_id: audius_id,
          title:,
          artists:,
          image_data:,
          plays_count: nil,
          release_date:,
          description:,
          tags: nil,
          tags_size: nil,
          labels: nil,
          tracks:,
          **self_args
        )
      end

      def track_data_formatted(
        raw_track_data
      )
        Audius::Album::Tracks::Track.call(
          raw_track_data:,
          album_data: album_base_data,
          **self_args
        )
      end

      def album_base_data
        @album_base_data ||=
          Muffon::Formatter::Source::Track::Albums::Album.call(
            source_original_link:,
            source_name:,
            source_album_id: audius_id,
            title:,
            artists:,
            image_data:,
            release_date: nil
          )
      end
    end
  end
end
