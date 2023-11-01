module Muffon
  module Binary
    class Chunk < Muffon::Base
      def call
        return if not_all_args?

        data
      end

      private

      def primary_args
        [
          @args[:binary],
          @args[:chunk_size],
          @args[:index]
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
