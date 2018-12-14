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
    expect(json["weapons"][0].keys).to include("name")
    expect(json["weapons"][0].keys).to include("description")
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
    get 'api/v1/weapons', { element: "Fire"}
    expect(last_response.status).to eq(200)

    json = JSON.parse(last_response.body)
    expect(json).to include("weapons")

    json["weapons"].each do |weapon|
      found = weapon["element"] == "Fire" || weapon["element_2"] == "Fire"
      expect(found).to be(true)
    end
  end

  it 'gets weapons by type and element' do
    get 'api/v1/weapons', { element: "Fire", wtype: "Hunting Horn"}
    expect(last_response.status).to eq(200)

    json = JSON.parse(last_response.body)
    expect(json).to include("weapons")

    json["weapons"].each do |weapon|
      found = weapon["element"] == "Fire" || weapon["element_2"] == "Fire"
      found = found && weapon["wtype"] == "Hunting Horn"
      expect(found).to be(true)
    end
  end

  it 'gets weapons by multiple types and multiple elements' do
    get 'api/v1/weapons', { element: "Fire,Water", wtype: "Hunting Horn,Great Sword"}
    expect(last_response.status).to eq(200)

    json = JSON.parse(last_response.body)
    expect(json).to include("weapons")

    found_greatsword = false
    found_hunting_horn = false
    found_water = false
    found_fire = false
    json["weapons"].each do |weapon|
      element = weapon["element"]
      element_2 = weapon["element_2"]
      wtype = weapon["wtype"]
      if element == "Fire" || element_2 == "Fire"
        found_fire = true
      end
      if element == "Water" || element_2 == "Water"
        found_water = true
      end
      if wtype == "Hunting Horn"
        found_hunting_horn = true
      end
      if wtype == "Great Sword"
        found_greatsword = true
      end
    end
    found = [found_greatsword, found_hunting_horn, found_water, found_fire]
    expect(found).to all(be true)
  end

  it 'gets the final version of all weapons' do
    get 'api/v1/weapons', { final: 1 }
    expect(last_response.status).to eq(200)

    json = JSON.parse(last_response.body)
    expect(json).to include("weapons")

    json["weapons"].each do |w|
      expect(w["final"]).to eq(1)
    end
  end

  it 'gets the final version of one weapon type' do
    get 'api/v1/weapons', { wtype: "Hunting Horn", final: 1 }
    expect(last_response.status).to eq(200)

    json = JSON.parse(last_response.body)
    expect(json).to include("weapons")

    json["weapons"].each do |w|
      expect(w["final"]).to eq(1)
      expect(w["wtype"]).to eq("Hunting Horn")
    end
  end

  it 'gets meta data' do
    get 'api/v1/weapons/meta'
    expect(last_response.status).to eq(200)

    json = JSON.parse(last_response.body)
    expect(json).to include("query_parameters", "fields")
  end
end
