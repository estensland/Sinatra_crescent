require 'rake'
require 'rspec/core/rake_task'

require ::File.expand_path('../config/environment', __FILE__)

# Include all of ActiveSupport's core class extensions, e.g., String#camelize
require 'active_support/core_ext'

namespace :generate do
  desc "Create an empty model in app/models, e.g., rake generate:model NAME=User"
  task :model do
    unless ENV.has_key?('NAME')
      raise "Must specificy model name, e.g., rake generate:model NAME=User"
    end

    model_name     = ENV['NAME'].camelize
    model_filename = ENV['NAME'].underscore + '.rb'
    model_path = APP_ROOT.join('app', 'models', model_filename)

    if File.exist?(model_path)
      raise "ERROR: Model file '#{model_path}' already exists"
    end



    puts "\t\e[7m\e[32m>>\033[0m Creating #{model_path}"
    File.open(model_path, 'w+') do |f|
      f.write(<<-EOF.strip_heredoc)
        class #{model_name} < ActiveRecord::Base
          # has_many
          # belongs_to
          # Remember to create a migration!
        end
      EOF
    end
  end

  desc "Create an empty migration in db/migrate, e.g., rake generate:migration NAME=create_tasks"
  task :migration do
    unless ENV.has_key?('NAME')
      raise "Must specificy migration name, e.g., rake generate:migration NAME=create_tasks"
    end

    name     = ENV['NAME'].camelize
    filename = "%s_%s.rb" % [Time.now.strftime('%Y%m%d%H%M%S'), ENV['NAME'].underscore]
    path     = APP_ROOT.join('db', 'migrate', filename)

    if File.exist?(path)
      raise "ERROR: File '#{path}' already exists"
    end
    table_name = name.underscore.match("create_").post_match

        # puts "\t\e[7m\e[32m>>\033[0m Association Creation?"
    # assoc = []

    # loop do
    #   puts "\t\e[7m\e[32m>>\033[0m Input 'row' of migration data... eg. 'has_many :users' 'q' to quit"
    #   print "\t\e[7m\e[5m\e[32m>>\033[0m "
    #   relation = STDIN.gets.chomp
    #   break if relation == "q"
    #   assoc << relation
    # end

    # puts "\t\e[7m\e[32m>>\033[0m Column Creation?"
    # column = <<-EOF.strip_heredoc

    # EOF

    # loop do
    #   puts "\t\e[7m\e[32m>>\033[0m Input 'row' of migration data... eg. 't.string :name' 'q' to quit"
    #   print "\t\e[7m\e[5m\e[32m>>\033[0m "
    #   attrib = STDIN.gets.chomp
    #   break if attrib == "q"
    #   column << attrib
    # end

    puts "\t\e[7m\e[32m>>\033[0m Creating #{path}"
    File.open(path, 'w+') do |f|
      f.write(<<-EOF.strip_heredoc)
        class #{name} < ActiveRecord::Migration
          def change
            create_table :#{table_name} do |t|

              t.timestamps
            end
          end
        end
      EOF
    end
  end

  desc "\t\e[7m\e[32m>>\033[0m Create an empty folder in views"
  task :controller do
    unless ENV.has_key?('NAME')
      raise "Must specificy controller name, e.g., rake generate:controller NAME=user"
    end

    name     = ENV['NAME'].downcase
    filename = ENV['NAME'].pluralize.underscore + '.rb'
    path     = APP_ROOT.join('app', 'controllers', filename)

    if File.exist?(path)
      raise "ERROR: File '#{path}' already exists"
    end

    puts "\t\e[7m\e[32m>>\033[0m Creating #{path}"
    File.open(path, 'w+') do |f|
      f.write(<<-EOF.strip_heredoc)

        get '/#{name}/new/:id' do
          
          erb :"#{name}_views/new"
        end

        get '/#{name}/show/:id' do
          
          erb :"#{name}_views/show"
        end

        get '/#{name}/edit/:id' do
          
          erb :"#{name}_views/edit"
        end 

        get '/#{name}/delete/:id' do
          
          erb :"#{name}_views/delete"
        end

        post '/#{name}/new' do
          new_object = #{name.camelize}.new(params[#{name}])
          if new_object.save
            redirect to("/#{name}_views/all")
          else
            @errors = #{name}.errors.messages
            erb :"#{name}_views/new"
          end
        end

        post '/#{name}/edit' do
          edit_object = #{name.camelize}.find(params[:#{name}_id])
          edit_object.update_attributes(params)
          redirect to('/')
        end

        post '/#{name}/delete' do
          #{name} = #{name.camelize}.find( )
          #{name}.destroy
          redirect to('/')
        end

      EOF
     end
  end


  desc "Create an empty model spec in spec, e.g., rake generate:spec NAME=user"
  task :spec do
    unless ENV.has_key?('NAME')
      raise "Must specificy migration name, e.g., rake generate:spec NAME=user"
    end

    name     = ENV['NAME'].camelize
    filename = "%s_spec.rb" % ENV['NAME'].underscore
    path     = APP_ROOT.join('spec', filename)

    if File.exist?(path)
      raise "ERROR: File '#{path}' already exists"
    end

    puts "\t\e[7m\e[32m>>\033[0m Creating #{path}"
    File.open(path, 'w+') do |f|
      f.write(<<-EOF.strip_heredoc)
        require 'spec_helper'

        describe #{name} do
          pending "add some examples to (or delete) #{__FILE__}"
        end
      EOF
    end
  end


  desc "Creating MVC....and migration...ignore migration at own risk"
  task :scaffold do
    unless ENV.has_key?('NAME')
      raise "Must specificy model name, e.g., rake generate:scaffold NAME=user"
    end

    puts "\t\e[7m\e[32m>>\033[0m Scaffold activated"

    name     = ENV['NAME'].downcase
    migration_name = "create_#{ENV['NAME'].downcase.pluralize}"

    puts "\t\e[7m\e[32m>>\033[0m Making all the stuff for the #{name} table...sit and relax"

    exec(<<-EOF.strip_heredoc
        mkdir app/views/#{name}_views
        touch app/views/#{name}_views/edit.erb
        touch app/views/#{name}_views/new.erb
        touch app/views/#{name.singularize}_views/show.erb
        touch app/helpers/#{name}.rb
        bundle exec rake generate:model NAME=#{name}
        bundle exec rake generate:controller NAME=#{name.downcase}
        bundle exec rake generate:migration NAME=#{migration_name}
      EOF
      )

  end

  desc "Deleting all aspects of a table and MVC"
  task :delete do
    unless ENV.has_key?('NAME')
      raise "Must specificy a MVC to delete, e.g., rake generate:scaffold NAME=user"
    end

    puts "\t\e[43m\e[7m\e[31m>>\033[0m Wildfire Deletion Activated"

    name     = ENV['NAME'].downcase
    migration_name = "create_#{ENV['NAME'].downcase.pluralize}"

    puts "\t\e[43m\e[7m\e[31m>>\033[0m Deleting all the stuff related to the #{name} table...watch it burn"

    files = Dir.entries( 'db/migrate' )
    delete = []

    files.each { |file| delete << file if file.match(name.downcase.pluralize)}

    exec(<<-EOF.strip_heredoc
        rm app/views/#{name}_views/edit.erb
        rm app/views/#{name}_views/new.erb
        rm app/views/#{name}_views/show.erb
        rmdir app/views/#{name}_views
        rm app/helpers/#{name}.rb
        rm db/migrate/#{delete[0]}
        rm app/models/#{name.downcase}.rb
        rm app/controllers/#{name.downcase.pluralize}.rb
      EOF
      )

    puts "\t\e[43m\e[7m\e[31m>>\033[0m Task Accomplished"

  end
end

namespace :db do


  desc "Create the database at #{DB_NAME}"
  task :create do
    puts "\t\e[41m\e[7m\e[34m>>\033[0m Creating database #{DB_NAME} if it doesn't exist..."
    exec("createdb #{DB_NAME}")
  end

  desc "Drop the database at #{DB_NAME}"
  task :drop do
    puts "\t\e[43m\e[7m\e[31m>>\033[0m Dropping database #{DB_NAME}..."
    exec("dropdb #{DB_NAME}")
  end

  desc "Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
  task :migrate do
    ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
    ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
    ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
      ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
    end
  end

  desc "\t\e[41m\e[7m\e[34m>>\033[0m Populate the database with dummy data by running db/seeds.rb"
  task :seed do
    require APP_ROOT.join('db', 'seeds.rb')
  end

  desc "Returns the current schema version number"
  task :version do
    puts "Current version: #{ActiveRecord::Migrator.current_version}"
  end


  # CUSTOM TASKS...

  desc "reset the database"
  task :reset do
    puts "\t\e[43m\e[7m\e[31m>>\033[0m Resetting the frakking db"
    exec("bundle exec rake db:drop && bundle exec rake db:set")
  end

  desc "set the database"
  task :set do
    puts "\t\e[41m\e[7m\e[34m>>\033[0m Create-Migrate-Seed...ALL AT ONCE"
    exec("bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rake db:seed")
  end

  desc "create/migrate/seed db and open the console"
  task :conset do
    puts "Bundle, Setting db, and entering console"
    exec("bundle update && bundle exec rake db:drop && bundle exec rake console")
  end

  desc "reset the db and opening the console"
  task :conreset do
    puts "\t\e[5m\e[7m\e[31m>>\033[0mReset to Console..."
    exec("bundle exec rake db:reset && bundle exec rake console")
  end

end

desc 'Loading User-InterRake'
task "u" do
  puts "\n\t\e[7m Welcome to User-InterRake! \033[0m"
  puts "\n\t\e[7m>>\033[0m \n\n"  
  exec("bundle exec rake launch")
end

desc 'Start User-InterRake'
task "launch" do
  

  loop do
    puts "\n\t\e[7m==== User-InterRake ====\033[0m\n\n"
    puts "\tType in an order list for UIR to execute:"
    puts "\n\t'q' \e[41m\e[7m->\033[0m quit"
    puts "\t'l' \e[41m\e[7m->\033[0m restart UIR"
    puts "\t'h' \e[41m\e[7m->\033[0m help menu"
    puts "\t'z' \e[41m\e[7m->\033[0m custom terminal command"
    puts "\t'b' \e[41m\e[7m\e[34m->\033[0m bundle"
    puts "\t'u' \e[41m\e[7m\e[34m->\033[0m bundle update"    
    puts "\t's' \e[7m\e[32m->\033[0m scaffold"
    puts "\t'd' \e[43m\e[7m\e[31m->\033[0m delete by scaffold input"
    puts "\t'i' \e[41m\e[7m\e[34m->\033[0m initialize db (bundle update/create/migrate/seed) "
    puts "\t'r' \e[43m\e[7m\e[31m->\033[0m reset db (drop/create/migrate/seed" 
    puts "\t'c' \e[45m\e[7m\e[37m->\033[0m exit to console"
    puts "\t'a' \e[47m\e[7m\e[36m->\033[0m git add and commit"
    puts "\t'o' \e[47m\e[7m\e[36m->\033[0m git checkout"
    puts "\t'y' \e[47m\e[7m\e[36m->\033[0m git git checkout -b"
    puts "\t'p' \e[47m\e[7m\e[36m->\033[0m git push origin"
    puts "\t't' \e[47m\e[7m\e[36m->\033[0m git status"
    puts "\n\n"
    input = STDIN.gets.chomp
    
    $commands = ""
    console = false

    input.split('').each do |letter|
      case letter
      when "l" 
        exec("bundle exec rake launch")
      when "q" 
        exec("ECHO quitting")
      when "h"
        help_menu
      when "z"
        custom_command
      when "b"
        bundle_command
      when "u"
        bundle_update_command
      when "i"
        initialize_command
      when "s"
        scaffold_command
      when "r"
        reset_command
      when "d"
        delete_command
      when "c"
        exit_to_console_command 
      when "g"
        git_add_commit_command
      when "o"
        git_checkout_command
      when "ø"
        git_checkout_new_branch_command
      when "p"
        git_push_command
      when "t"
        git_status_command
      end
    end
    
    unless console
      $commands << (<<-EOF
          bundle exec rake launch
          EOF
          )
    end

    exec($commands)
  end
end


desc 'Start IRB with application environment loaded'
task "console" do
  exec "irb -r./config/environment"
end

desc "Run the specs"
RSpec::Core::RakeTask.new(:spec)

task :default  => :specs


# METHODS


def back_check(input)
  exec('bundle exec rake launch') if input == "q"
end

def help_menu
  puts "\t\e[41m\e[7m>>\033[0m HELP! ¡AYUDAME!"
  puts "\t\e[41m\e[7m>>\033[0m Colors: "
  puts "\t\t\e[41m\e[7m>>\033[0m UIR"
  puts "\t\t\e[41m\e[7m\e[34m>>\033[0m Positive Tables Commands (eg. Migrate/Seed Database"
  puts "\t\t\e[7m\e[32m>>\033[0m Positive File Commands (eg. Create a Model)"
  puts "\t\t\e[43m\e[7m\e[31m>>\033[0m Negative Table Commands/ rm Files (Drop/rm"
  puts "\t\t\e[45m\e[7m\e[37m>>\033[0m Console Command (eg. rake console)"
  puts "\t\t\e[47m\e[7m\e[36m>>\033[0m Git commands\n\n"
  puts "\t\e[41m\e[7m>>\033[0m Press Any Key: "
  print "\t\e[41m\e[5m\e[7m>>\033[0m "
  STDIN.gets.chomp
end

def custom_command
  puts "\t\e[41m\e[7m>>\033[0m Insert a Command, 'n' to bypass"
  print "\t\e[41m\e[5m\e[7m>>\033[0m "
  input = STDIN.gets.chomp  
  back_check(input)
  input = "echo skip" if input == "n"
  $commands << (<<-EOF
    #{input}
    EOF
    )  
end

def bundle_command 
  puts "\t\e[41m\e[7m\e[34m>>\033[0m bundling"
  $commands << (<<-EOF
    bundle
    EOF
    )  
end

def bundle_update_command
  puts "\t\e[41m\e[7m\e[34m>>\033[0m bundle updating"
  $commands << (<<-EOF
    bundle update
    EOF
    )
end

def initialize_command
puts "\t\e[41m\e[7m\e[34m>>\033[0m Bundle through seeding"
$commands << (<<-EOF
  bundle exec rake db:set
  EOF
  )  
end

def scaffold_command
  puts "\t\e[7m\e[32m>>\033[0m AUTO CREATE: CONTROLLER/HELPER/VIEWS/MIGRATION/ "
  puts "\t\e[7m\e[32m>>\033[0m INPUT 'q' to go back "
  puts "\t\e[7m\e[32m>>\033[0m NAME= ? "
  print "\t\e[7m\e[5m\e[32m>>\033[0m "

  scaffold_input = STDIN.gets.chomp
  back_check(scaffold_input)
  $commands << (<<-EOF
    bundle exec rake generate:scaffold NAME=#{scaffold_input}
    EOF
    )
end

def reset_command
  puts "\t\e[43m\e[7m\e[31m>>\033[0m RESTING"
  puts "\t\e[41m\e[7m\e[34m>>\033[0m CREATING"
  $commands << (<<-EOF
    bundle exec rake db:reset
    EOF
    )  
end

def exit_to_console_command
  puts "\e[45m\e[7m\e[37m>> \033[0m It's console time"
  console = true
  $commands << (<<-EOF
    bundle exec rake console
    EOF
    )  
end

def delete_command
  puts "\t\e[7m\e[43m\e[31m>>\033[0m WARNING \e[7m\e[43m\e[31mDELETING!\033[0m BE CAREFUL THERE IS NO GOING BACK!"
  puts "\t\e[7m\e[43m\e[31m>>\033[0m =============== INPUT 'q' TO GO BACK ===============\033[0m"
  puts "\t\e[7m\e[43m\e[31m>>\033[0m NAME= ?\033[0m"
  print "\t\e[7m\e[43m\e[5m\e[31m>>\033[0m "
  delete_input = STDIN.gets.chomp
  back_check(delete_input)
  $commands << (<<-EOF
    bundle exec rake generate:delete NAME=#{delete_input}
    EOF
    )
end

def git_add_commit_command
  puts "\t\e[47m\e[7m\e[36m>>\033[0m Type your commit message"
  print "\t\e[47m\e[5m\e[7m\e[36m>> \033[0m"

  message = STDIN.gets.chomp
  back_check(message)

  $commands << (<<-EOF
    git add .
    git commit -m "#{message}"
    EOF
    )    
end

def git_checkout_command
  puts "\t\e[47m\e[7m\e[36m>>\033[0mCheckout to what branch?"
  print "\t\e[47m\e[5m\e[7m\e[36m>>\033[0m git checkout"
  
  branch = STDIN.gets.chomp
  back_check(branch)

  $commands <<(<<-EOF
    git checkout "#{branch}"
    EOF
    )  
end

def git_checkout_new_branch_command
  puts "\t\e[47m\e[7m\e[36m>> \033[0mCheckout to what branch?"
  print "\t\e[47m\e[5m\e[7m\e[36m>> \033[0m git checkout "
  
  branch = STDIN.gets.chomp
  back_check(branch)
  puts "\t\e[47m\e[7m\e[36m>>\033[0m Checking out branch #{branch}"
  $commands <<(<<-EOF
    git checkout -b "#{branch}"
    EOF
    )  
end

def git_push_command 
  puts "\t\e[47m\e[7m\e[36m>>\033[0m Push where?"
  print "\t\e[47m\e[5m\e[7m\e[36m>>\033[0m git push origin "
  
  branch = STDIN.gets.chomp
  back_check(branch)
  puts "\t\e[47m\e[7m\e[36m>>\033[0m Checking out new branch, branch #{branch}"
  $commands <<(<<-EOF
    git checkout -b "#{branch}"
    EOF
    )  
end


def git_status_command 
  puts "\t\e[47m\e[7m\e[36m>>\033[0m Git Status:"

  $commands <<(<<-EOF
    git status
    EOF
    )  
end