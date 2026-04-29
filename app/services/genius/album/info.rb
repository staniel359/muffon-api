module Genius
  module Album
    class Info < Genius::Album::Base
      include Genius::Mixins::Album

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
          source_album_id: genius_id,
          title:,
          artists:,
          image_data:,
          release_date:
        )
      end

      def album_full_data
        Muffon::Formatter::Source::Album::Info.call(
          source_original_link:,
          source_name:,
          source_album_id: genius_id,
          title:,
          artists:,
          image_data:,
          release_date:,
          plays_count: nil,
          description:,
          tags: nil,
          tags_size: nil,
          labels: nil,
          tracks:,
          **self_args
        )
      end

      def tracks
        Genius::Album::Tracks.call(
          album_id: @args[:album_id],
          album_data: album_base_data,
          **self_args
        ).dig(
          :album,
          :tracks
        ) || []
      end

      def album_base_data
        @album_base_data ||=
          Muffon::Formatter::Source::Track::Albums::Album.call(
            source_original_link:,
            source_name:,
            source_album_id: genius_id,
            title:,
            artists:,
            image_data:,
            release_date: nil
          )
      end
    end
  end
end
