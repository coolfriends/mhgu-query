# config.ru
require './app'
require 'rack/cors'


use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: :get
  end
end
run MHGUQueryApp
