#!/usr/bin/env ruby
#
# This script seeds the weapons table with the appropriate columns from the items table.
#
require_relative '../lib/mhgu_query/models/item'
require_relative '../lib/mhgu_query/models/weapon'

Item = MHGUQuery::Models::Item
Weapon = MHGUQuery::Models::Weapon

columns = [
  :name,
  :name_de,
  :name_fr,
  :name_es,
  :name_it,
  :name_ja,
  :rarity,
  :buy,
  :sell,
  :description,
  :description_de,
  :description_fr,
  :description_es,
  :description_it,
  :description_ja,
  :icon_name,
  :icon_color
]

Weapon.each do |w|
  item = Item.where(_id: w._id).first
  columns.each { |c| w[c] = item[c].to_s }
  w.save
end
