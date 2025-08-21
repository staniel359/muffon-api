module Muffon
  module Utils
    class Image
      class VariantLink < Muffon::Utils::Image
        def call
          return if not_all_args?

          data
        end

        private

        def primary_args
          [
            @args[:image],
            @args[:size]
          ]
        end

        def data
          image_link(
            image
            .variant(options)
            .processed
          )
        rescue StandardError
          nil
        end

        def image
          @args[:image]
        end

        def options
          {
            background: 'none',
            gravity: 'center',
            extent: '1:1',
            resize: resize_option
          }
        end

        def resize_option
          "#{size}x#{size}>"
        end

        def size
          @args[:size]
        end
      end
    end
  end
end
