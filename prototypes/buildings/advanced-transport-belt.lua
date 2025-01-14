local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "recipe",
    name = "kr-advanced-transport-belt",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
      { type = "item", name = "express-transport-belt", amount = 1 },
      { type = "item", name = "steel-gear-wheel", amount = 4 },
      { type = "item", name = "rare-metals", amount = 1 },
    },
    results = { { type = "item", name = "kr-advanced-transport-belt", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-advanced-transport-belt",
    icon = "__Krastorio2Assets__/icons/entities/advanced-transport-belt.png",
    subgroup = "belt",
    order = "a[transport-belt]-d[advanced-transport-belt]",
    place_result = "kr-advanced-transport-belt",
    stack_size = 100,
  },
  {
    type = "transport-belt",
    name = "kr-advanced-transport-belt",
    icon = "__Krastorio2Assets__/icons/entities/advanced-transport-belt.png",
    flags = { "placeable-neutral", "player-creation" },
    fast_replaceable_group = "transport-belt",
    next_upgrade = "kr-superior-transport-belt",
    minable = { mining_time = 0.2, result = "kr-advanced-transport-belt" },
    collision_box = { { -0.4, -0.4 }, { 0.4, 0.4 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    speed = 0.125,
    open_sound = sounds.transport_belt_open,
    close_sound = sounds.transport_belt_close,
    working_sound = {
      sound = {
        filename = "__base__/sound/transport-belt.ogg",
        volume = 0.4,
      },
      persistent = true,
    },
    max_health = 200,
    corpse = "kr-advanced-transport-belt-remnant",
    resistances = {
      {
        type = "fire",
        percent = 50,
      },
    },
    animations = {
      filename = "__Krastorio2Assets__/buildings/advanced-transport-belt/advanced-transport-belt.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      frame_count = 32,
      direction_count = 12,
      scale = 0.5,
    },
    belt_animation_set = require("prototypes.buildings.advanced-belt-animation-set"),
    related_underground_belt = "kr-advanced-underground-belt",
    animation_speed_coefficient = 32,
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_connector = circuit_connector_definitions["belt"],
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance,
  },
})
