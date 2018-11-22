# app.rb
require 'roda'
require 'json'

class MHGUQueryApp < Roda
  plugin :json

  db = { weapons: { hunting_horn: {} } }
  route do |r|
    # /api
    r.on 'api' do
      puts 'made it to api'
      # /api/v1
      r.on 'v1' do
        puts 'made it to api/v1'
        # /api/v1/weapon
        r.on 'weapons' do
          puts 'made it to api/v1/weapons'
          # /api/v1/weapon/<weapon_type>
          r.on String do |weapon_type|
            puts "made it to api/v1/weapons/#{weapon_type}"
            r.get String do |name|
              puts "made it to api/v1/weapons/#{weapon_type}/#{name}"
              db[:weapons][weapon_type.to_sym][name] || {}
            end
          end
        end
      end
    end
  end
end
