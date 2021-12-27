module Muffon
  module Radio
    module Tag
      class Base < Muffon::Base
        private

        def primary_args
          [@args[:tag]]
        end

        def no_data?
          total_pages.blank? ||
            tag_data.blank?
        end

        def total_pages
          @total_pages ||=
            retrieve_tag_data[:total_pages]
        end

        def retrieve_tag_data(page = nil)
          tag_service.call(
            tag: @args[:tag],
            page: page,
            sample: true
          )[:tag] || {}
        end

        def tag_data
          @tag_data ||=
            retrieve_tag_data(
              random_page
            )
        end

        def random_page
          rand(1..total_pages)
        end

        def tag_service
          "::LastFM::Tag::#{collection_name}".constantize
        end

        def collection_name
          self.class::COLLECTION_NAME.capitalize
        end

        def data
          return call if no_track?

          { radio: radio_data }
        end

        def radio_data
          {
            tag: tag_data[:name],
            track: track
          }
        end

        def random_track
          tracks.first
        end
      end
    end
  end
end
