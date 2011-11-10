class Scraper
  # Parse 
  def parse(latest)
    # Open the HTML document
    doc = Nokogiri::HTML open('http://police.wustl.edu/mediatest.html')
    # Get the relevant paragraphs
    beats = doc.css('tr p')
    # Filter down to the beats
    beats.reject! { |i| !(i =~ /location/i) }
    # Map to the arrays
    beats.map! { |i| i.inner_text.split(/\r\n/) }
    
  end
end
