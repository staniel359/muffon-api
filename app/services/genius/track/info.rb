module Genius
  module Track
    class Info < Genius::Track::Base
      private

      def track_data
        Muffon::Formatter::Track::Info.call(
          source_original_link:,
          source_name:,
          source_track_id: genius_id,
          title:,
          artists:,
          album_title:,
          source_album_id: album_genius_id,
          image_data:,
          release_date:,
          duration: nil,
          description:,
          description_size: 'medium',
          tags:,
          tags_size: 'extrasmall',
          lyrics: lyrics_string,
          lyrics_size: 'small',
          plays_count: nil,
          is_audio_present: audio_present?,
          audio_link:,
          **self_args
        )
      end

      def raw_artists
        raw_track_data
          .values_at(
            'primary_artist',
            'featured_artists'
          )
          .flatten
          .compact
          .map do |raw_artist_data|
            {
              name: raw_artist_data['name'],
              source_id: raw_artist_data['id']
            }
          end
      end

      def lyrics_string
        return if lyrics.blank?

        lyrics
          .map do |lyric_data|
            lyric_data_formatted(
              lyric_data
            )
          end
          .join
      end

      def lyrics
        @lyrics ||=
          Genius::Track::Info::Lyrics.call(
            track_slug: genius_slug
          )[:lyrics]
      end

      def lyric_data_formatted(
        lyric_data
      )
        case lyric_data
        when Hash
          lyric_data[:text]
        when String
          lyric_data
        end
      end
    end
  end
end
