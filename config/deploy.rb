set :application, "tweetboard"
set :repository,  "https://github.com/rocky-jaiswal/tweetboard"
set :scm, :git
set :user, "torquebox"
set :deploy_to, "/opt/torquebox/torquebox"
set :use_sudo, false

role :web, "192.168.1.155"                          # Your HTTP server, Apache/etc
role :app, "192.168.1.155"                          # This may be the same as your `Web` server
role :db,  "192.168.1.155", :primary => true        # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"
