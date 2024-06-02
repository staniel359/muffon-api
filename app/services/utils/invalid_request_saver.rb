require 'csv'

module Utils
  class InvalidRequestSaver < Service::Base
    FILE_NAME = 'invalid_requests.csv'.freeze
    IGNORED_PATHS_REGEXP =
      %r{uploads/|media/|favicon.ico}

    def call
      return if not_all_args?

      save_request
    end

    private

    def primary_args
      [@args[:request]]
    end

    def save_request
      return if ignore?

      CSV.open(
        FILE_NAME, 'ab'
      ) do |csv|
        csv << request_data
      end
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
        .zone
        .now
        .strftime('%F %T')
    end
  end
end
