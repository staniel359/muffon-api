module VK
  module Utils
    module Audio
      class Deleter < VK::Base
        def call
          return if not_all_args?

          data
        end

        private

        def primary_args
          [@args[:file_name]]
        end

        def data
          return unless file_present?

          ::File.delete(
            file_name
          )
        end

        def file_present?
          ::File.exist?(
            file_name
          )
        end

        def file_name
          @args[:file_name]
        end
      end
    end
  end
end
