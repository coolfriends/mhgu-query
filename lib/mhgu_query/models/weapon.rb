require_relative '../db'

module MHGUQuery
  module Models
    module Weapon
      class << self
        def weapon_types
          DB[:weapons].uniq { |w| w[:wtype] }.map { |w| w[:wtype] }
        end

        def element_types
          DB[:weapons].uniq { |w| w[:element] }.map { |w| w[:element] }
        end

        def fields
          DB[:weapons].first.keys
        end
      end
    end
  end
end
