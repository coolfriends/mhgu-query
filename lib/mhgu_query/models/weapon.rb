require_relative '../db'

module MHGUQuery
  module Models
    class Weapon < Sequel::Model
      dataset_module do
        def with_item_details
          join(:items, _id: :_id)
        end

      end

      class << self

        def weapons(wtypes: [], elements: [])
          ds = dataset
          ds = ds.where({ wtype: wtypes }) unless wtypes.empty?
          unless elements.empty?
            ds = ds.where do
              Sequel.|({ element: elements }, { element_2: elements }) end
          end
          ds.with_item_details.all
        end

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
