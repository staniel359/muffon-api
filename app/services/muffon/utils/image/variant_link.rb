module Muffon
  module Utils
    class Image
      class VariantLink < Muffon::Utils::Image
        def call
          return if args_missing?

          data
        rescue ActiveStorage::FileNotFoundError
          nil
        end

        private

        def required_args
          %i[
            image
            size
          ]
        end

        def data
          image_link(
            image_variant
          )
        end

        def image_variant
          @args[:image]
            .variant(
              options
            )
            .processed
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
