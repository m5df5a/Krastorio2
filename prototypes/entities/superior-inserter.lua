local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "recipe",
    name = "kr-superior-inserter",
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "item", name = "inserter-parts", amount = 1 },
      { type = "item", name = "imersium-plate", amount = 1 },
      { type = "item", name = "imersium-gear-wheel", amount = 4 },
      { type = "item", name = "processing-unit", amount = 1 },
    },
    results = { { type = "item", name = "kr-superior-inserter", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-superior-inserter",
    icon = "__Krastorio2Assets__/icons/entities/inserters/superior-inserter.png",
    subgroup = "inserter",
    order = "h1[superior-inserter]",
    place_result = "kr-superior-inserter",
    stack_size = 50,
  },
  {
    type = "inserter",
    name = "kr-superior-inserter",
    icon = "__Krastorio2Assets__/icons/entities/inserters/superior-inserter.png",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 0.1, result = "kr-superior-inserter" },
    fast_replaceable_group = "inserter",
    collision_box = { { -0.15, -0.15 }, { 0.15, 0.15 } },
    selection_box = { { -0.4, -0.35 }, { 0.4, 0.45 } },
    pickup_position = { 0, -1 },
    insert_position = { 0, 1.2 },
    extension_speed = 0.105,
    rotation_speed = 0.06,
    bulk = true,
    filter_count = 4,
    energy_per_movement = "12kJ",
    energy_per_rotation = "12kJ",
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "1kW",
    },
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = sounds.inserter_fast,
    max_health = 200,
    corpse = "kr-superior-inserter-remnants",
    damaged_trigger_effect = hit_effects.entity(),
    resistances = {
      {
        type = "fire",
        percent = 90,
      },
    },
    hand_base_picture = {
      filename = "__Krastorio2Assets__/entities/superior-inserters/superior-inserter-hand-base.png",
      priority = "extra-high",
      width = 32,
      height = 136,
      scale = 0.25,
    },
    hand_closed_picture = {
      filename = "__Krastorio2Assets__/entities/superior-inserters/superior-inserter/superior-inserter-hand-closed.png",
      priority = "extra-high",
      width = 100,
      height = 164,
      scale = 0.25,
    },
    hand_open_picture = {
      filename = "__Krastorio2Assets__/entities/superior-inserters/superior-inserter/superior-inserter-hand-open.png",
      priority = "extra-high",
      width = 130,
      height = 164,
      scale = 0.25,
    },
    hand_base_shadow = {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 32,
      height = 132,
      scale = 0.25,
    },
    hand_closed_shadow = {
      filename = "__Krastorio2Assets__/entities/superior-inserters/superior-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 100,
      height = 164,
      scale = 0.25,
    },
    hand_open_shadow = {
      filename = "__Krastorio2Assets__/entities/superior-inserters/superior-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 130,
      height = 164,
      scale = 0.25,
    },
    platform_picture = {
      sheet = {
        filename = "__Krastorio2Assets__/entities/superior-inserters/superior-inserter-platform.png",
        priority = "extra-high",
        width = 105,
        height = 79,
        shift = util.by_pixel(1.5, 7.5 - 1),
        scale = 0.5,
      },
    },
    circuit_wire_connection_points = circuit_connector_definitions["inserter"].points,
    circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal,
  },
})
