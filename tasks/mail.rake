def to_time(str)
  match_data = str.match /\w+, (\w+) (\d+)\w+ (\d{4}) \w+ (\d+):(\d+) (\w+)/
  
  Time.strptime("#{match_data[1..6].join(' ')} CST", "%b %d %Y %I %M %P %Z")
end

desc "Read the mail.html file"
task :mail => :environment do
  # Open the data
  data = Nokogiri::HTML(File.open('mail.html', 'r').read).css('div').inner_html
  # Split the data and trim it
  data = data.split('<hr>').map do |i|
    i = i.split('<br>')
    i.map! {|j| j.sub(/<b>\w+:<\/b>/, '').strip}
  end
  # Create beats
  data.each do |i|
    beat = Beat.create do |b|
      b.crime = i[2]
      b.timestamp = to_time i[3]
      b.uid = i[4].to_i
      b.location = i[5]
      b.summary = i[6]
      b.value = i[7].to_i
      b.disposition = i[9]
    end
    puts beat.errors.to_a
  end
end
