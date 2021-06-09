module RateYourMusic
  module Album
    class Info < RateYourMusic::Album::Base
      private

      def album_data
        base_data
          .merge(extra_data)
          .merge(with_more_data)
      end

      def base_data
        {
          title: title,
          rateyourmusic_id: rateyourmusic_id,
          artist: artist_names_formatted,
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

      def artist_names_formatted
        { name: artist_names }
      end

      def artist_names
        artists.pluck(:name).join(', ')
      end

      def artists
        @artists ||= artists_list.map do |a|
          artist_data_formatted(a)
        end
      end

      def artists_list
        album.css('.album_info .artist')
      end

      def extra_data
        {
          image: image_data,
          release_date: release_date,
          tags: tags.first(5),
          tracks: tracks
        }
      end

      def image_data
        image_data_formatted(image, 'album')
      end

      def image
        album.css(
          '.page_release_art_frame img'
        )[0].try(:[], 'src')
      end

      def release_date
        date_formatted(raw_release_date)
      end

      def raw_release_date
        album.xpath(
          "//th[contains(text(), 'Released')]"
        )[0].next_element.text.strip
      end

      def tracks
        tracks_list.map do |t|
          track_data_formatted(t)
        end
      end

      def tracks_list
        album.css('#tracks .tracklist_line')
      end

      def track_data_formatted(track)
        RateYourMusic::Album::Info::Track.call(
          track: track,
          artists_list: artists_list
        )
      end
    end
  end
end
