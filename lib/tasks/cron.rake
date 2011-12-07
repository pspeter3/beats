desc "Cron job"
task :cron => :environment do
  # Open the HTML document
    doc = Nokogiri::HTML open('http://police.wustl.edu/mediatest.html')
    # Get the relevant paragraphs
    beats = doc.css('tr p').to_a
    # Filter down to the beats
    beats.reject! { |i| !(i =~ /location/i) }
    # Map to the arrays
    beats.map! { |i| i.inner_text.split(/\r\n/) }
    # Iterate through the beats
    beats.each do |record|
      # Get an instance of the beat model 
      puts record
    end
end
