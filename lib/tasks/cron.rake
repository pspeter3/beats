desc "Cron job"
task :cron => :environment do
  # Open the HTML document
    doc = Nokogiri::HTML open('http://police.wustl.edu/mediatest.html')
    # Get the relevant paragraphs
    beats = doc.css('p').to_a
    # Filter down to the beats
    beats.reject! { |i| !(i.inner_text =~ /location/i) }
    # Map to the arrays
    beats.map! { |i| i.inner_text.split(/\r\n/) }
    # Iterate through the beats
    beats.each do |record|
      begin
        # Create a new beat
        beat = Beat.new
        # Parse through the crime and time
        info = record[0].scan(/([\w\s]+?)(\w+)\.?\s+(\d+),\s+(\d+)\s+-\s+\w+\s+at\s+(\d+):(\d+)/)[0]
        # Assign to the model
        beat.crime = info[0].strip.split(' ').map{|i|  i.capitalize}.join(' ')
        # Create the time
        beat.timestamp = Time.strptime(info[1..5].join(' '), "%b %d %Y %H %M")
        # Parse through the location and uid
        info = record[1].scan(/Location:\s+(.+?)(\d+)$/)[0]
        # Assign to the model
        beat.location = info[0].strip.split(' ').map{|i|  i.capitalize}.join(' ')
        beat.uid = info[1].to_i
        # Get the summary, disposition and value
        info = record[2].scan(/Summary:\s+(.+?)\s+Disposition:\s+(.+)$/)[0]
        beat.summary = info[0]
        beat.disposition = info[1]
        # Check for value
        beat.value = $2 if beat.summary =~ /(Loss|Value)\s+\$([\d\.]+)/
        # Save the beat
        beat.save
      rescue Exception => e
        puts e
      end
    end
    # Perform map reduce
    Beat.calculate
end
