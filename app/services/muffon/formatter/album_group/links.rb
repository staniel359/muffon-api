module Muffon
  module Formatter
    module AlbumGroup
      class Links < Muffon::Formatter::AlbumGroup::Base
        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            source_original_link
            source_name
            source_album_group_id
          ]
        end

        def data
          { links: source_links_data }
        end
      end
    end
  end
end
