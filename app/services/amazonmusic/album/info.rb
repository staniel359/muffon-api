module AmazonMusic
  module Album
    class Info < AmazonMusic::Album::Base
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
          source_album_id: amazonmusic_id,
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
          source_album_id: amazonmusic_id,
          title:,
          artists:,
          image_data:,
          release_date:,
          description: nil,
          tags: nil,
          tags_size: nil,
          plays_count: nil,
          labels: nil,
          tracks:,
          **self_args
        )
      end

      def title
        raw_album_data.dig(
          'headerText',
          'text'
        )
      end

      def artist_name
        raw_album_data['headerPrimaryText']
      end

      def amazonmusic_slug
        raw_album_data.dig(
          'templateData',
          'deeplink'
        )
      end

      def artist_amazonmusic_slug
        raw_album_data.dig(
          'headerPrimaryTextLink',
          'deeplink'
        )
      end

      def image_url
        raw_album_data['headerImage']
      end

      def raw_release_date
        raw_album_data['headerTertiaryText']
          .split('•')
          .last
          .strip
      end

      def track_data_formatted(
        raw_track_data
      )
        AmazonMusic::Album::Tracks::Track.call(
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
            source_album_id: amazonmusic_id,
            title:,
            artists:,
            image_data:,
            release_date: nil
          )
      end
    end
  end
end
