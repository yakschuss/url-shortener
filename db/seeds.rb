url_array = IO.readlines(File.join(Rails.root, "test_file.txt")).reject { |line| line.empty? }
count = 0

url_array.each do |url|
  url = url.chomp

  Link.create!(url: url)

  count += 1
end

puts "You just created #{count} links"
