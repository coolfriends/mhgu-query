# app.rb
require 'roda'
require 'json'
require 'mhgu_query/models/weapon'

class MHGUQueryApp < Roda
  plugin :json

  route do |r|
    # /api
    r.on 'api' do
      # /api/v1
      r.on 'v1' do
        # /api/v1/weapons
        r.on 'weapons' do
          # only /api/v1/weapons
          r.is do
            #
            # This route returns a JSON document with a weapons key that maps
            # to a list of weapons.
            #
            # This route accepts the following querystring or JSON parameters.
            #
            # wtype - one of 14 weapon types
            # element - one of 9 element types or an empty string
            #
            # GET /api/v1/weapons
            r.get do
              wtypes = r.params.fetch('wtype', '').split(',')
              elements = r.params.fetch('element', '').split(',')
              ds = MHGUQuery::Models::Weapon.dataset

              ds = ds.where({ wtype: wtypes }) if wtypes.any?
              if elements.any?
                ds = ds.where do
                  Sequel.|({ element: elements }, { element_2: elements })
                end
              end
              { weapons: ds.map(&:to_hash) }
            end
          end

          #
          # This route returns a JSON document with high-level attributes
          # about the weapons endpoint.
          #
          # fields - a list of fields for a weapon
          # query_attributes - a description of the query attributes for the endpoint
          # query_parameters.parameter - the name of the parameter
          # query_parameters.description - a description of the parameter
          # query_parameters.fields - the fields corresponding to this parameter
          # query_parameters.values - the available values for the field
          #
          # GET /api/v1/weapons/meta
          r.get 'meta' do
            {
              fields: MHGUQuery::Models::Weapon.fields,
              query_parameters: [
                {
                  parameter: "wtype",
                  fields: ["wtype"],
                  values: MHGUQuery::Models::Weapon.wtype_values,
                  examples: [
                    "Fire",
                    "Water,Fire,Poison"
                  ]
                },
                {
                  parameter: "element",
                  fields: ["element", "element_2"],
                  values: MHGUQuery::Models::Weapon.element_values,
                  examples: [
                    "Hunting Horn",
                    "Great Sword,Hunting Horn,Bow"
                  ]
                }
              ]
            }
          end
        end
      end
    end
  end
end
