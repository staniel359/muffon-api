every 3.hours do
  command 'rm -rf /root/muffon-api/shared/public/media/audio'
end

every 1.day do
  runner 'Utils::Database::VacuumAnalyzeWorker.perform_async'
end
