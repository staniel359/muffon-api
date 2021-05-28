module Odnoklassniki
  module Artist
    class Albums
      class Album < Odnoklassniki::Artist::Albums
        include Odnoklassniki::Utils::Album

        def call
          data
        end

        private

        def data
          {
            title: title,
            odnoklassniki_id: odnoklassniki_id,
            image: image_data,
            release_date: release_date
          }
        end

        def album
          @album ||= @args.album
        end
      end
    end
  end
end
