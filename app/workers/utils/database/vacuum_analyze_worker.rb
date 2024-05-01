module Utils
  module Database
    class VacuumAnalyzeWorker < Worker::Base
      def perform
        ActiveRecord::Base
          .connection
          .execute(
            'VACUUM ANALYZE'
          )
      end
    end
  end
end
