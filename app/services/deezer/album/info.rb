module Deezer
  module Album
    class Info < Deezer::Album::Base
      include Deezer::Mixins::Album

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
          source_album_id: deezer_id,
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
          source_album_id: deezer_id,
          title:,
          artists:,
          image_data:,
          release_date:,
          plays_count: nil,
          description: nil,
          tags: nil,
          tags_size: nil,
          labels:,
          tracks:,
          **self_args
        )
      end

      def raw_tracks
        response_data.dig(
          'results',
          'SONGS',
          'data'
        )
      end

      def track_data_formatted(
        raw_track_data
      )
        Deezer::Album::Tracks::Track.call(
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
            source_album_id: deezer_id,
            title:,
            artists:,
            image_data:,
            release_date: nil
          )
      end
    end
  end
end
