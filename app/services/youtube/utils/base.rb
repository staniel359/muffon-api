module YouTube
  module Utils
    module Base
      VERSION_PARAM = '1.20250924.03.00'.freeze

      private

      def context_data
        { client: client_data }
      end

      # rubocop:disable Layout/LineLength
      def client_data
        {
          'clientName' => 'WEB_REMIX',
          'clientVersion' => VERSION_PARAM,
          'gl' => 'GB',
          'userAgent' => Muffon::Utils::Request::USER_AGENT,
          'visitorData' => 'Cgt6YzN0cjlLcTJ0OCiG5_jLBjIKCgJCWRIEGgAgDQ%3D%3D',
          'originalUrl' => 'https://music.youtube.com/',
          'configInfo' => {
            'appInstallData' => 'CIbn-MsGEIHNzhwQwNfQHBC45M4cENjX0BwQi_fPHBCHrM4cEKudzxwQyPfPHBDM364FEMGP0BwQ_LLOHBCW19AcEJmNsQUQyfevBRCU_rAFEJ3QsAUQr4bPHBDZxNAcEI2w0BwQvbauBRDT4a8FEPrO0BwQ597QHBCmttAcEITU0BwQu9nOHBDQwoATEMDbzxwQ8bTQHBCV988cEJzXzxwQjOnPHBCK1dAcEN68zhwQt-r-EhCUg9AcEK7WzxwQ0dzQHBCEz9AcEL6KsAUQ9quwBRCJsM4cEPbW0BwQtbWAExDGxs8cEJbbzxwQiIewBRCUttAcEPCdzxwQ2vfOHBC8pNAcEL2ZsAUQkdPQHBDrzdAcKkxDQU1TTlJVMi1acS1ETWVVRXBVQ25BN01CYmJQOEFzeXYxX3AxUVVEemY4Rnk3Y0cteWE0M1FiMkQtOHd1TW9FNEVMT0x2cWhCaDBIMAA%3D',
            'coldConfigData' => 'CIbn-MsGGjJBSVdMQ1gxdzEydWdZU3ZuVkZIc0lwNUF0VVpuVmdhWFlTOXFWTVQwc1kzWFNEeDJUQSIyQUlXTENYMGY4ZVQ4dDZONzNzckhJNVJ1SVgyZ3BoVEdGeU9aY1hwa2ZtNWp3aXZNR0E%3D',
            'coldHashData' => 'CIbn-MsGEhM4MzcyMjg4Nzg1MDY2MDg0NzkyGIbn-MsGMjJBSVdMQ1gxdzEydWdZU3ZuVkZIc0lwNUF0VVpuVmdhWFlTOXFWTVQwc1kzWFNEeDJUQToyQUlXTENYMGY4ZVQ4dDZONzNzckhJNVJ1SVgyZ3BoVEdGeU9aY1hwa2ZtNWp3aXZNR0E%3D',
            'hotHashData' => 'CIbn-MsGEhM4NjEyMTU4MzE2NzMxMDYyNDQ4GIbn-MsGMjJBSVdMQ1gxdzEydWdZU3ZuVkZIc0lwNUF0VVpuVmdhWFlTOXFWTVQwc1kzWFNEeDJUQToyQUlXTENYMGY4ZVQ4dDZONzNzckhJNVJ1SVgyZ3BoVEdGeU9aY1hwa2ZtNWp3aXZNR0E%3D'
          },
          'deviceExperimentId' => 'ChxOell3TVRVMk9UZzNNalUwTVRjMk56QTFOQT09EIbn-MsGGIbn-MsG',
          'rolloutToken' => 'CJrOsdDv44q_RRD89q6417mLAxj8ntzNs7WSAw%3D%3D'
        }
      end
      # rubocop:enable Layout/LineLength
    end
  end
end
