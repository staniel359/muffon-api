module API
  module Muffon
    module Radio
      class TagController < API::BaseController
        def artists
          render_data_with_status
        end

        def tracks
          render_data_with_status
        end

        private

        def artists_data
          ::Muffon::Radio::Tag::Artists.call(
            params.slice(:tag)
          )
        end

        def tracks_data
          ::Muffon::Radio::Tag::Tracks.call(
            params.slice(:tag)
          )
        end
      end
    end
  end
end
