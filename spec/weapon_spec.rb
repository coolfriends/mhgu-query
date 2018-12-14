require_relative '../lib/mhgu_query/models/weapon'
require_relative '../lib/mhgu_query/models/item'
require 'spec_helper'


RSpec.describe MHGUQuery::Models::Weapon do
  context '#weapons' do
    it 'can get weapons by weapon type' do
      weapons = MHGUQuery::Models::Weapon.weapons wtypes: ["Hunting Horn"]

      weapon = weapons.first
      expect(weapon[:name]).not_to be_nil
      expect(weapon[:description]).not_to be_nil
    end
  end

  context '#with_item_details' do
    it 'has name and description fields' do
      weapon = MHGUQuery::Models::Weapon.with_item_details.first
      expect(weapon[:name]).not_to be_nil
    end
  end

  context '#final_only' do
    it 'only returns the final version of all weapons' do
      weapons = MHGUQuery::Models::Weapon.final_only.all
      weapons.each do |w|
        expect(w.final).to be(1)
      end
    end

    it 'only returns the final version of a weapon type' do
      weapons = MHGUQuery::Models::Weapon.final_only.where({ wtype: "Bow" }).all
      weapons.each do |w|
        expect(w.final).to be(1)
      end
    end
  end

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
