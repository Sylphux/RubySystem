require 'launchy'

# if you are using WSL, discomment the following line

# system("export BROWSER='/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe'")

if ARGV.empty?
    puts "Type your google search terms after the command"
else
    link = "https://www.google.com/search?q=#{ARGV.join("+")}"
    Launchy.open(link)
end