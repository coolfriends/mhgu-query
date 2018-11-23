# app.rb
require 'roda'
require 'json'
require 'mhgu_query/db'

class MHGUQueryApp < Roda
  plugin :json

  db = MHGUQuery::DB
  route do |r|
    # /api
    r.on 'api' do
      # /api/v1
      r.on 'v1' do
        # /api/v1/weapon
        r.on 'weapons' do
          # GET /api/v1/weapons
          r.get do
            wtype = r.params['wtype']
            element = r.params['element']
            qs = db[:weapons]
            qs = wtype ? (qs.where({ wtype: wtype })) : qs
            qs = element ? (qs.where({element: element})).or({element_2: element}) : qs
            { "weapons": qs.map(&:to_hash) }
          end
        end
      end
    end
  end
end
