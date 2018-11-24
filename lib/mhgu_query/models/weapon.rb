require_relative '../db'

module MHGUQuery
  module Models
    class Weapon < Sequel::Model
      class << self
        def wtype_values
          [
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
        end

        def element_values
          [
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
        end

        def fields
          self.columns.map(&:to_s)
        end
      end
    end
  end
end
