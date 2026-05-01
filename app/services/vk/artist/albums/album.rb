module VK
  module Artist
    class Albums
      class Album < VK::Base
        include VK::Mixins::Album

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_album_data
          ]
        end

        def data
          Muffon::Formatter::Source::Artist::Albums::Album.call(
            source_original_link:,
            source_name:,
            source_album_id: vk_id,
            source_album_owner_id: vk_owner_id,
            source_album_access_key: vk_access_key,
            title:,
            artists:,
            image_data:,
            release_date:,
            **self_args
          )
        end

        def raw_album_data
          @args[:raw_album_data]
        end
      end
    end
  end
end
