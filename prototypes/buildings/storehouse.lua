local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

if not settings.startup["kr-containers"].value then
  return
end

data:extend({
  {
    type = "recipe",
    name = "kr-storehouse",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "item", name = "steel-chest", amount = 4 },
      { type = "item", name = "steel-beam", amount = 2 },
    },
    results = { { type = "item", name = "kr-storehouse", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-storehouse",
    icon = "__Krastorio2Assets__/icons/entities/storehouse.png",
    subgroup = "kr-logistics-2",
    order = "a[storehouse]",
    place_result = "kr-storehouse",
    stack_size = 50,
  },
  {
    type = "container",
    name = "kr-storehouse",
    icon = "__Krastorio2Assets__/icons/entities/storehouse.png",
    flags = { "placeable-player", "player-creation", "not-rotatable" },
    fast_replaceable_group = "container",
    minable = { mining_time = 0.5, result = "kr-storehouse" },
    collision_box = { { -0.8, -0.8 }, { 0.8, 0.8 } },
    selection_box = { { -1, -1 }, { 1, 1 } },
    inventory_size = 120,
    max_health = 500,
    corpse = "big-remnants",
    damaged_trigger_effect = hit_effects.entity(),
    resistances = {
      { type = "physical", percent = 30 },
      { type = "fire", percent = 50 },
      { type = "impact", percent = 50 },
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    picture = {
      filename = "__Krastorio2Assets__/buildings/storehouse/storehouse.png",
      priority = "extra-high",
      width = 340,
      height = 340,
      scale = 0.5,
    },
    opened_duration = logistic_chest_opened_duration,
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
  },
})
