require_relative '../app'
require 'spec_helper'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

RSpec.describe MHGUQueryApp do
  include Rack::Test::Methods

  def app
    MHGUQueryApp
  end

  it 'should get a single hunting horn' do
    get 'api/v1/weapons/hunting_horn/kechachaacha_whappa_lv6'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to eq({
                                       starting_weapon_name: "Kecha Whappa LV1",
                                       name: "Kechachacha Whappa LV6",
                                       damage: 330,
                                       special_type: "Wat",
                                       special_damage: 35,
                                       sharpness: {
                                         red: 16,
                                         orange: 2,
                                         yellow: 20,
                                         green: 28,
                                         blue: 12,
                                         white: 2,
                                         purple: 5
                                       },
                                       decoration_slots: 1,
                                       rarity: 4,
                                       notes: ["white", "green", "light_blue"],
                                       songs: [
                                         {
                                           notes: ["white", "white"],
                                           song: "Self-Improvement"
                                         },
                                         {
                                           notes: ["white", "green", "white"],
                                           song: "Health Recovery (S)"
                                         },
                                         {
                                           notes: ["green", "white", "light_blue", "green"],
                                           song: "Health Rec. (M) + Deod."
                                         },
                                         {
                                           notes: ["light_blue", "light_blue", "light_blue"],
                                           song: "Bind Res"
                                         },
                                         {
                                           notes: ["light_blue", "light_blue", "green", "white"],
                                           song: "Hearing Protection (S)"
                                         }
                                       ]
                                     })
  end
end
