module RateYourMusic
  module Album
    class Info < RateYourMusic::Album::Base
      include RateYourMusic::Utils::Album

      private

      def album_data
        muffon_data
          .merge(album_base_data)
          .merge(album_extra_data)
          .merge(with_more_data)
      end

      def album_base_data
        {
          source_id: SOURCE_ID,
          title: title,
          artist: artist_formatted,
          artists: artists
        }
      end

      def title
        album.css(
          '.album_title'
        ).children[0].text.strip
      end

      def rateyourmusic_id
        album.css(
          '.album_title input'
        )[0]['value'].scan(/\d+/)[0].to_i
      end

      def artists
        @artists ||= artists_list.map do |a|
          artist_data_formatted(a)
        end
      end

      def artists_list
        album.css(
          '.album_info .artist'
        )
      end

      def album_extra_data
        {
          image: image_data,
          release_date: release_date,
          tags: tags.first(5),
          tracks: tracks
        }.compact
      end

      def image_data
        image_data_formatted(
          image, 'album'
        )
      end

      def image
        album.css(
          '.page_release_art_frame img'
        )[0].try(:[], 'src')
      end

      def release_date
        date_formatted(
          raw_release_date
        )
      end

      def raw_release_date
        album.xpath(
          "//th[contains(text(), 'Released')]"
        )[0].next_element.text.strip
      end

      def tags_list
        album
          .css('.release_genres .genre')
          .map(&:text)
          .compact_blank
      end

      def tracks
        tracks_list.map do |t|
          track_data_formatted(t)
        end
      end

      def tracks_list
        album.css(
          '#tracks .tracklist_line'
        )
      end

      def track_data_formatted(track)
        RateYourMusic::Album::Info::Track.call(
          track: track,
          artists_list: artists_list,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
