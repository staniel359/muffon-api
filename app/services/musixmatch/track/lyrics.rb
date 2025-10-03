module MusixMatch
  module Track
    class Lyrics < MusixMatch::Track::Info
      CLASSES_DATA = {
        'container' => 'r-zd98yo',
        'subheader' => 'r-a023e6',
        'lyrics' => 'r-1inkyih'
      }.freeze

      private

      def track_data
        track_base_data
          .merge(lyrics_data)
      end

      def lyrics_data
        { lyrics: }
      end

      def lyrics
        raw_lyrics
          .map
          .with_index do |lyric, index|
            text = lyric.text

            if subheader_node?(lyric)
              text = "[#{text.capitalize}]"

              text = "\n#{text}" unless index.zero?
            else
              text = text.tr('′', "'")
            end

            "#{text}\n"
          end
      end

      def raw_lyrics
        lyrics_response_data
          .css(
            ".#{CLASSES_DATA['container']}"
          ).css(
            ".#{CLASSES_DATA['subheader']}, .#{CLASSES_DATA['lyrics']}"
          )
      end

      def lyrics_response_data
        Nokogiri::HTML.parse(
          lyrics_response.body
        )
      end

      def lyrics_response
        format_get_request(
          link: original_link,
          headers:
        )
      end

      def subheader_node?(
        lyric
      )
        lyric
          .attr('class')
          .include?(
            CLASSES_DATA['subheader']
          )
      end
    end
  end
end
