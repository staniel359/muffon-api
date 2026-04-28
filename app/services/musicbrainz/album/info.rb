module MusicBrainz
  module Album
    class Info < MusicBrainz::Album::Base
      include MusicBrainz::Mixins::Album

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
          source_album_id: musicbrainz_id,
          source_model: musicbrainz_model,
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
          source_album_id: musicbrainz_id,
          source_model: musicbrainz_model,
          title:,
          artists:,
          image_data:,
          release_date:,
          plays_count: nil,
          description: nil,
          description_size: nil,
          tags:,
          tags_size: 'extrasmall',
          labels:,
          tracks:,
          **self_args
        )
      end

      def track_data_formatted(
        raw_track_data
      )
        MusicBrainz::Album::Tracks::Track.call(
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
            source_album_id: musicbrainz_id,
            source_model: musicbrainz_model,
            title:,
            artists:,
            image_data:,
            release_date: nil
          )
      end
    end
  end
end
