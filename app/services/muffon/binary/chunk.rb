module Muffon
  module Binary
    class Chunk < Muffon::Base
      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          binary
          chunk_size
          index
        ]
      end

      def data
        binary[
          passed_chunks_size,
          current_chunk_size
        ]
      end

      def binary
        @args[:binary]
      end

      def passed_chunks_size
        chunk_size * index
      end

      def chunk_size
        @args[:chunk_size]
      end

      def index
        @args[:index]
      end

      def current_chunk_size
        [
          chunk_size,
          remaining_chunks_size
        ].min
      end

      def remaining_chunks_size
        binary.size -
          passed_chunks_size
      end
    end
  end
end
