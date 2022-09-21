module API
  module Muffon
    module Radio
      class TagController < API::BaseController
        def artists; end

        def tracks; end

        private

        def artists_data
          ::Muffon::Radio::Tag::Artists.call(
            params.slice(
              *%i[tag]
            )
          )
        end

        def tracks_data
          ::Muffon::Radio::Tag::Tracks.call(
            params.slice(
              *%i[tag]
            )
          )
        end
      end
    end
  end
end
