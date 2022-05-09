module Spotify
  module Track
    class Info < Spotify::Track::Base
      private

      def track_data
        muffon_data
          .merge(track_base_data)
          .merge(track_extra_data)
          .merge(with_more_data)
      end

      def track_base_data
        {
          source_id:,
          player_id:,
          spotify_id:,
          title:,
          artist: artist_names_data,
          artists:
        }
      end

      def track_extra_data
        {
          album: album_data,
          image: image_data,
          duration:,
          duration_seconds:,
          audio: audio_data
        }.compact
      end

      def audio_data
        {
          source_id:,
          present: audio_link.present?,
          link: audio_link
        }
      end

      def audio_link
        return if audio_path.blank?

        "#{secrets[:url]}/#{audio_path}"
      end

      def audio_path
        return 'test.mp3' if Rails.env.test?

        @audio_path ||=
          `python3.10 public/spotify.py \
          #{email} '#{password}' #{spotify_id}`
      end

      def email
        secrets.spotify[:email]
      end

      def password
        secrets.spotify[:password]
      end
    end
  end
end
