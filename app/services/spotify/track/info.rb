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
          player_id: player_id,
          source_id: SOURCE_ID,
          spotify_id: spotify_id,
          title: title,
          artists: artists
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
          present: true,
          link: audio_link,
          source_id: SOURCE_ID
        }
      end

      def audio_link
        "#{secrets[:files_url]}/#{audio_path}"
      end

      def audio_path
        return 'test.mp3' if Rails.env.test?

        `#{python_command} public/spotify.py \
          #{email} '#{password}' #{spotify_id}`
      end

      def python_command
        return 'python3.7' if
            Rails.env.production?

        'python'
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
