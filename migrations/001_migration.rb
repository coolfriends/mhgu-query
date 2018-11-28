# The MHGU database requires doing a left join between the weapons
# and items tables to get all the attributes a weapon has. This adds
# unnecessary complexity to our application. This migration adds all
# the columns from the items table to the weapons table. Additional
# migrations will be necessary to fix other tables like decorations
# and armor sets. Some will need to be converted to relationships and
# whatnot.
#
# - Kyri
require 'sequel'
require_relative '../lib/mhgu_query/models/item'
require_relative '../lib/mhgu_query/models/weapon'
Item = MHGUQuery::Models::Item
Weapon = MHGUQuery::Models::Weapon
weapons_columns = Weapon.first.keys
skip_columns = [:carry_capacity, :stack, :type, :sub_type, :account]
new_columns = Item.first.keys.reject do |k|
  weapons_columns.include?(k) || skip_columns.include?(k)
end

Sequel.migration do
  up do
    new_columns.each do |c|
      add_column :weapons, c, String
      from(:weapons).update(c => "")
    end
  end

  down do
    new_columns.each do |c|
      drop_column :weapons, c
    end
  end
end
