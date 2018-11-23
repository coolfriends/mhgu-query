require_relative './db'
module MHGUQuery
  module Helper
    def weapon_types
      DB[:weapons].uniq { |w| w[:wtype] }.map { |w| w[:wtype] }
    end

    def element_types
      DB[:weapons].uniq { |w| w[:element] }.map { |w| w[:element] }
    end
  end
end
