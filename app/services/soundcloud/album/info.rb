module SoundCloud
  module Album
    class Info < SoundCloud::Album::Base
      include SoundCloud::Mixins::Album

      private

      def album_data
        Muffon::Formatter::Source::Album::Info.call(
          source_original_link:,
          source_name:,
          source_album_id: soundcloud_id,
          title:,
          artists:,
          image_data:,
          release_date:,
          description:,
          tags:,
          tags_size: 'extrasmall',
          plays_count: nil,
          labels: nil,
          tracks:,
          **self_args
        )
      end

      def tracks
        SoundCloud::Album::Tracks.call(
          raw_album_data:,
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
            source_album_id: soundcloud_id,
            title:,
            artists:,
            image_data:,
            release_date: nil
          )
      end
    end
  end
end
