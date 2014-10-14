# Require all the gems in the gemfile
require 'bundler/setup'
Bundler.require(:default)

get '/' do
  "hello job world"
end