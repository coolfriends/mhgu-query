require_relative '../lib/mhgu_query/models/weapon'
require 'spec_helper'


RSpec.describe MHGUQuery::Models::Weapon do
  describe '#weapon_types' do
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
      expect(MHGUQuery::Models::Weapon.weapon_types).to eq(expected)
    end
  end

  context '#element_types' do
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
      expect(MHGUQuery::Models::Weapon.element_types).to eq(expected)
    end
  end
end
