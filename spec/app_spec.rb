require 'json'
require_relative '../app'
require 'spec_helper'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

RSpec.describe MHGUQueryApp do
  include Rack::Test::Methods

  def app
    MHGUQueryApp
  end

  it 'gets all weapons' do
    get 'api/v1/weapons'
    expect(last_response.status).to eq(200)

    json = JSON.parse(last_response.body)
    expect(json).to include("weapons")

    expect(json["weapons"].count).to eq(10877)
  end

  it 'gets weapons by type' do
    get 'api/v1/weapons', { wtype: "Hunting Horn"}
    expect(last_response.status).to eq(200)

    json = JSON.parse(last_response.body)
    expect(json).to include("weapons")

    json["weapons"].each do |weapon|
      found = weapon["wtype"] == "Hunting Horn"
      expect(found).to be(true)
    end
  end

  it 'gets weapons by element' do
    get 'api/v1/weapons?element=Fire', { element: "Fire"}
    expect(last_response.status).to eq(200)

    json = JSON.parse(last_response.body)
    expect(json).to include("weapons")

    json["weapons"].each do |weapon|
      found = weapon["element"] == "Fire" || weapon["element_2"] == "Fire"
      expect(found).to be(true)
    end
  end
end
