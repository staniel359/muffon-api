module Bandcamp
  module Album
    class Info
      class Data < Bandcamp::Album::Info
        def call
          super { return handle_tracks_absence if no_tracks? }
        end

        private

        def primary_args
          [@args.album_link]
        end

        def no_data?
          album_script.blank?
        end

        def album_script
          @album_script ||=
            response_data.css('script').find { |s| album_script?(s) }
        end

        def link
          @args.album_link
        end

        def album_script?(script)
          script.attributes.keys.include?('data-tralbum')
        end

        def no_tracks?
          album_data['trackinfo'].blank?
        end

        def album_data
          @album_data ||= JSON.parse(album_script['data-tralbum'])
        end

        def handle_tracks_absence
          redirect_link.present? ? redirect : handlers.not_found
        end

        def redirect_link
          album_data.dig('current', 'about')[link_regexp]
        end

        def link_regexp
          %r{https?://\w+(?:-\w+)*.bandcamp.com/
            (?:album|track)/\w+(?:-\w+)*}x
        end

        def redirect
          self.class.name.constantize.call(album_link: redirect_link)
        end

        def data
          { album: album_data }
        end
      end
    end
  end
end
