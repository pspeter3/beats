class Scraper
  # Parse 
  def parse
    # Open the HTML document
    doc = Nokogiri::HTML open('http://police.wustl.edu/mediatest.html')
    # Get the relevant paragraphs
    beats = doc.css('tr p')
    # Filter down to the beats
    beats.reject! { |i| !(i =~ /location/i) }
    # Map to the arrays
    beats.map! { |i| i.inner_text.split(/\r\n/) }
    # Iterate through the beats
    beats.each do |record|
      # Get an instance of the beat model 
      beat = handle record
      
    end
  end
  
  def handle(record)
    beat = Beat.new
    beat.crime, beat.timestamp = get_crime_and_timestamp record[0]
    
  end
  
  def get_crime_and_timestamp(line)
     
  end
end
