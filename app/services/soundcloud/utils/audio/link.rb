module SoundCloud
  module Utils
    module Audio
      class Link < SoundCloud::Base
        def call
          check_args

          return if no_data?

          data
        end

        private

        def required_args
          %i[
            track_id
            link
          ]
        end

        def no_data?
          track_data.blank? ||
            audio_link_data.blank?
        end

        def track_data
          @track_data ||=
            SoundCloud::Utils::Audio::Link::TrackData.call(
              link: @args[:link]
            )
        end

        def audio_link_data
          audio_links.find do |data|
            mp3_link?(data)
          end
        end

        def audio_links
          track_data.dig(
            'data',
            'media',
            'transcodings'
          ) || []
        end

        def mp3_link?(data)
          data['preset'].start_with?('mp3') &&
            data.dig('format', 'protocol') == 'progressive'
        end

        def data
          response_data['url']
        end

        def link
          audio_link_data['url']
        end

        def params
          { client_id: }
        end
      end
    end
  end
end
