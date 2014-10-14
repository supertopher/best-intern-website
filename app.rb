# Require all the gems in the gemfile
require 'bundler/setup'
Bundler.require(:default)

# Set . to pre-pend the load path
$LOAD_PATH.unshift(File.expand_path('.'))

# Allow the environment to be set by rack while gracefully catching heroku load error
begin
  require 'dotenv'
  Dotenv.load(".env.#{ENV['RACK_ENV']}", ".env")
rescue LoadError
end

Dir["routes/*.rb"].each do |file_to_load|
  require file_to_load
end