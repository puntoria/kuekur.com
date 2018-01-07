require 'rufus-scheduler'

namespace :event do
  task :scheduler do
    scheduler.cron '05 12 * * *' do
      rake "schedulable:build_notifications"
    end
    scheduler.join
  end

end
