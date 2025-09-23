class String
    #création d'une méthode pour coloriser le texte
    def colorize(color_code)
        "\e[#{color_code}m#{self}\e[0m"
    end
end


def verify_command_argument
    if ARGV.empty?
        puts "Please specify the name of the project after the command. (No_spaces)".colorize(31)
        puts "add -h or -help for more info on arguments".colorize(36)
    elsif Dir.exist?(ARGV[0])
        puts "Folder already exists".colorize(31)
    elsif ARGV.include?("-help") || ARGV.include?("-h")
        show_help
    elsif ARGV.include?("-als")
        system "echo \"alias mkrb='ruby #{Dir.pwd}/mkdir_ruby.rb'\" >> ~/.bashrc"
        system "source ~/.bashrc"
    else #Si la commande est bonne et contient un nom de projet
        start_creation
    end
end

def show_help
    puts
    puts "Here are the parameters you can apply to the launching of the program".colorize(35)
    puts "1: Obligatory parameter : The name of the project".colorize(31)
    puts "2: after that, there are optional parameters you can specify".colorize(36)
    puts "-nogit | skips the creation of a git local repo"
    puts "-norspec | skips the initialisation of rspec"
    puts "-dotenv | adds dotenv to the project"
    puts
end

def start_creation #crée la structure du projet ruby

    puts "Creating Ruby project directory".colorize(35)
    Dir.mkdir(ARGV[0])
    Dir.chdir(ARGV[0]) # on va travailler dans le dossier créé
    puts "Creating readme file".colorize(35)
    File.open("readme.md", "a") do |file| # création du readme
        file.puts "# #{ARGV[0]}"
        file.puts "This is the beginning of the readme.md file for the #{ARGV[0]} ruby project."
    end
    puts "Creating lib/ folder and project file".colorize(35)
    Dir.mkdir("lib") # création de /lib et du fichier projet
    File.open("lib/#{ARGV[0]}.rb", "w")
    puts "Creating gemfile with basic info".colorize(35)
    File.open("Gemfile", "a") do |file|
        file.puts 'source "https://rubygems.org"'
        file.puts 'ruby "3.4.2"'
        file.puts 'gem "pry"'
        file.puts "gem 'rspec'"
    end

    #### Verify parameters #####

    # Creates rspec unless counter arg
    system("rspec --init") unless ARGV.include?("-norspec")
    #create git unless we don't want to
    create_git unless ARGV.include?("-nogit")
    # verifies if we want to create .env en voyant si l'array contient -dotenv
    if ARGV.include? "-dotenv"
        add_dotenv
    end
    puts
    puts "Ruby project created !".colorize(32)
end

# adds a dotenv .env file, entry to .gitignore, and entry to gemfile
def add_dotenv 
    puts "Adding dotenv".colorize(35)
    File.open(".env", "a")
    File.open(".gitignore", "a") do |file|
        file.puts ".env"
    end
    add_to_gemfile("gem 'dotenv'")
end

 # adds an input to gemfile
def add_to_gemfile(gem)
    File.open("Gemfile", "a") do |file|
        file.puts gem
    end
end

# creates local git repo and tries to add remote
def create_git 
    puts "Creating local git repo".colorize(35)
    system("git init")
    print "Please specify the remote url (press enter to ignore) :".colorize(36)
    git_remote = $stdin.gets.chomp
    if git_remote == nil || git_remote == "" || !git_remote.include?("https://github.com/")
        puts "No github.com URL detected, ignoring remote.".colorize(31)
    else
        puts "Adding remote #{git_remote} ...".colorize(32)
        system("git remote add origin #{git_remote}")
    end
end

def perform
    verify_command_argument
end

perform