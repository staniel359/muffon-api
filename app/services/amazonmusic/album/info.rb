module AmazonMusic
  module Album
    class Info < AmazonMusic::Album::Base
      private

      def album_data
        if @args[:list]
          album_list_data
        else
          album_full_data
        end
      end

      def album_list_data
        self_data
          .merge(album_base_data)
          .merge(album_list_extra_data)
      end

      def album_full_data
        self_data
          .merge(album_base_data)
          .merge(album_extra_data)
          .merge(with_more_data)
      end

      def album_base_data
        @album_base_data ||= {
          source: source_data,
          title:,
          artist: artists_minimal_data,
          artists:,
          image: image_data
        }
      end

      def amazonmusic_slug
        album.dig(
          'templateData', 'deeplink'
        )
      end

      def title
        album.dig(
          'headerText', 'text'
        )
      end

      def artist_amazonmusic_slug
        album.dig(
          'headerPrimaryTextLink', 'deeplink'
        )
      end

      def artist_name
        album['headerPrimaryText']
      end

      def image_link
        album['headerImage']
      end

      def album_list_extra_data
        {
          release_date:
        }.compact
      end

      def album_extra_data
        {
          profiles_count:,
          release_date:,
          tracks:
        }.compact
      end

      def raw_release_date
        album['headerTertiaryText']
          .split('•')
          .last
          .strip
      end

      def track_data_formatted(track)
        AmazonMusic::Album::Info::Track.call(
          track:,
          album_data: album_base_data,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
