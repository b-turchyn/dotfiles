# Taken virtually line-for-line from r00k's repository:
# https://github.com/r00k/dotfiles/blob/master/Rakefile

require 'rake'

desc "install the dot files into user's home directory"
task :install do
  @replace_all = false
  install_files('', %w[Rakefile README LICENSE id_rsa.pub config])
  install_files('config/', %w[])

  # Handle ssh pubkey on its own
  puts "Linking public ssh key"
  system %Q{rm "$HOME/.ssh/id_rsa.pub"}
  system %Q{ln -s "$PWD/id_rsa.pub" "$HOME/.ssh/id_rsa.pub"}

  puts "Creating local tmp directory"
  system %Q{mkdir ~/.tmp}

  puts "Creating special Vim folders"
  system %Q{mkdir -p ~/.vim/swap ~/.vim/undodir ~/.vim/backup}

  # Need to do this to make vim use RVM's ruby version
  puts "Moving zshenv to zshrc"
  system %Q{sudo mv /etc/zshenv /etc/zshrc}

end

def install_files(dir, skip)
  Dir["#{dir}*"].each do |file|
    next if skip.include? file

    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      if @replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          @replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end
end

def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end

def link_config(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end
