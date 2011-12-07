desc "Cron job"
task :cron => :environment do
  Scraper.run
end
