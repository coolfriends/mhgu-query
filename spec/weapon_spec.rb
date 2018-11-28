require_relative '../lib/mhgu_query/models/weapon'
require_relative '../lib/mhgu_query/models/item'
require 'spec_helper'


RSpec.describe MHGUQuery::Models::Weapon do
  context '#wtype_values' do
    it 'returns the correct types' do
      expected = [
        "Great Sword",
        "Sword and Shield",
        "Hammer",
        "Lance",
        "Heavy Bowgun",
        "Light Bowgun",
        "Long Sword",
        "Switch Axe",
        "Gunlance",
        "Bow",
        "Dual Blades",
        "Hunting Horn",
        "Insect Glaive",
        "Charge Blade"
      ].freeze
      expect(MHGUQuery::Models::Weapon.wtype_values).to eq(expected)
    end
  end

  context '#element_values' do
    it 'returns the correct types' do
      expected = [
        "",
        "Fire",
        "Water",
        "Thunder",
        "Poison",
        "Paralysis",
        "Blastblight",
        "Ice",
        "Sleep",
        "Dragon"
      ].freeze
      expect(MHGUQuery::Models::Weapon.element_values).to eq(expected)
    end
  end
end
