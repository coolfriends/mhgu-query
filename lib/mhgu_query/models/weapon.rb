require_relative '../db'

module MHGUQuery
  module Models
    class Weapon < Sequel::Model
      dataset_module do
        def with_items_join
          # Join the queryset with the items table to expose the fields generic to all items.
          #
          # Note that this does not let you access the items field using dot notation. See example.
          #
          # @example
          #   qs = Weapon
          #   qs.where(wtype: "Hunting Horn").with_items_join.each do |w|
          #     puts w[:name], w.wtype  # Note that the name field must be referenced like a hash
          #   end
          #
          # @reference
          #   The weapons table needs to be joined with the items table to get the name column, among other
          #   important columns.
          #   https://github.com/JoeLago/MHGUDB-iOS/blob/master/MHGDB/Model/Weapon.swift#L352-L374
          left_join(:items, _id: :_id)
        end
      end

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
