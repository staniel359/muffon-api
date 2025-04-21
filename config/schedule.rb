every 3.hours do
  command 'rm -rf /root/muffon-api/shared/public/media/audio'
end

every 1.day do
  runner 'Utils::Database::VacuumAnalyzeWorker.perform_async'
end

every 5.days do
  command 'sudo -u muffon_api pg_dump -Fc muffon_api > ~/backup/database.dump'

  # To restore
  # sudo -u muffon_api pg_restore -C -d muffon_api ~/backup/database.dump
end
