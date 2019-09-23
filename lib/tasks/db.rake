namespace :db do
    desc "Checks whether the database exists or not"
    task :exists do
      # Tries to initialize the application.
      # It will fail if the database does not exist
      Rake::Task["environment"].invoke
      ActiveRecord::Base.connection
      puts "There is a database"
    rescue StandardError
      puts "There is NOT a database"
      exit 1
    else
      exit 0
    end
  
    desc "Destroys objects from all models"
    task clear: :environment do
      Rails.application.eager_load!
      models = ApplicationRecord.descendants.collect(&:name).map(&:constantize)
  
      puts "[CLEAR] Destroying all objects..."
      destroyed_objects = models.map(&:destroy_all).flatten.count
      puts "[CLEAR] #{destroyed_objects} objects destroyed."
    end
  end
  