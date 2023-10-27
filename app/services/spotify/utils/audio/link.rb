module Spotify
  module Utils
    module Audio
      class Link < Spotify::Base
        def call
          return if not_all_args? || no_data?

          data
        end

        private

        def not_all_args?
          @args[:track_id].blank?
        end

        def no_data?
          audio_path.blank?
        end

        def audio_path
          return test_audio_path if test?

          response_data['path']
        rescue StandardError
          nil
        end

        def test_audio_path
          "media/audio/spotify/#{@args[:track_id]}.ogg"
        end

        def link
          "http://localhost:5000/tracks/#{@args[:track_id]}"
        end

        def data
          "#{secrets[:url]}/#{audio_path}"
        end
      end
    end
  end
end
