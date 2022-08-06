every 8.hours do
  command 'rm -rf /root/muffon-api/shared/public/files/audio'
end

every 1.day do
  command 'service muffon-spotify restart'
end
