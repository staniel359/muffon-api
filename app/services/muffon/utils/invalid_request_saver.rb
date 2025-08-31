require 'csv'

module Muffon
  module Utils
    class InvalidRequestSaver < Muffon::Base
      FILE_NAME = 'invalid_requests.csv'.freeze
      IGNORED_PATHS_REGEXP =
        %r{uploads/|media/|favicon.ico}

      def call
        check_args

        return if ignore?

        save_request
      end

      private

      def required_args
        %i[
          request
        ]
      end

      def ignore?
        request
          .path
          .match?(
            IGNORED_PATHS_REGEXP
          )
      end

      def request
        @args[:request]
      end

      def save_request
        CSV.open(
          FILE_NAME,
          'ab'
        ) do |csv|
          csv << request_data
        end
      end

      def request_data
        [
          current_time_formatted,
          request.path,
          request.ip,
          request.remote_ip
        ]
      end

      def current_time_formatted
        Time
          .current
          .strftime(
            '%F %T'
          )
      end
    end
  end
end
