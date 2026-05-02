module LastFM
  module Album
    class Info < LastFM::Album::Base
      API_METHOD = 'album.getInfo'.freeze

      include LastFM::Mixins::Album

      private

      def request_params
        {
          **super,
          lang: language
        }.compact
      end

      def album_data
        update_album_record!

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
          source_album_id: nil,
          title:,
          artists:,
          image_data:,
          release_date: nil
        )
      end

      def album_full_data
        Muffon::Formatter::Source::Album::Info.call(
          source_original_link:,
          source_name:,
          source_album_id: nil,
          title:,
          artists:,
          image_data:,
          release_date: nil,
          description:,
          tags:,
          tags_size: 'extrasmall',
          plays_count:,
          labels: nil,
          tracks:,
          **self_args
        )
      end

      def track_data_formatted(
        raw_track_data
      )
        LastFM::Album::Tracks::Track.call(
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
            source_album_id: nil,
            title:,
            artists:,
            image_data:,
            release_date: nil
          )
      end
    end
  end
end
