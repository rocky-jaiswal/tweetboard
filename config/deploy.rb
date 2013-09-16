set :application, "tweetboard"
set :repository,  "https://github.com/rocky-jaiswal/tweetboard"
set :scm, :git
set :user, "torquebox"
set :deploy_to, "/opt/torquebox/tweetboard"
set :use_sudo, false

role :web, "192.168.1.155"                          # Your HTTP server, Apache/etc
role :app, "192.168.1.155"                          # This may be the same as your `Web` server
role :db,  "192.168.1.155", :primary => true        # This is where Rails migrations will run


set :torquebox_home, "/opt/torquebox/current"
set :rails_env, "production"
set :app_context, "/"


namespace :torquebox do
  task :deploy do
    puts "==================Stop and Undeploy======================"
    run  "export PATH=/opt/torquebox/current/jruby/bin:$PATH && killall java; true"
    run  "rm -rf #{torquebox_home}/standalone/deployments/*"
    puts "==================Bundle======================"
    run  "cd #{deploy_to}/current && export PATH=/opt/torquebox/current/jruby/bin:$PATH && export TORQUEBOX_HOME=/opt/torquebox/current && export JBOSS_HOME=$TORQUEBOX_HOME/jboss && export JRUBY_HOME=$TORQUEBOX_HOME/jruby && bundle install --deployment --without development test"
    puts "==================Deploy and Run======================"
    run  "cd #{deploy_to}/current && export PATH=/opt/torquebox/current/jruby/bin:$PATH && export TORQUEBOX_HOME=/opt/torquebox/current && export JBOSS_HOME=$TORQUEBOX_HOME/jboss && export JRUBY_HOME=$TORQUEBOX_HOME/jruby && torquebox deploy"
    run  "cd #{deploy_to}/current && export PATH=/opt/torquebox/current/jruby/bin:$PATH && export TORQUEBOX_HOME=/opt/torquebox/current && export JBOSS_HOME=$TORQUEBOX_HOME/jboss && export JRUBY_HOME=$TORQUEBOX_HOME/jruby && torquebox run"
  end
end

after "deploy", "torquebox:deploy"
# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"
