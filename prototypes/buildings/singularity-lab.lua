local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "recipe",
    name = "kr-singularity-lab",
    energy_required = 120,
    enabled = false,
    ingredients = {
      { type = "item", name = "ai-core", amount = 20 },
      { type = "item", name = "kr-advanced-lab", amount = 5 },
      { type = "item", name = "steel-plate", amount = 40 },
      { type = "item", name = "electric-engine-unit", amount = 30 },
      { type = "item", name = "rare-metals", amount = 60 },
      { type = "item", name = "processing-unit", amount = 100 },
    },
    results = { { type = "item", name = "kr-singularity-lab", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-singularity-lab",
    icon = "__Krastorio2Assets__/icons/entities/singularity-lab.png",
    subgroup = "production-machine",
    order = "g[lab]-g3[kr-singularity-lab]",
    place_result = "kr-singularity-lab",
    stack_size = 25,
  },
  {
    type = "lab",
    name = "kr-singularity-lab",
    icon = "__Krastorio2Assets__/icons/entities/singularity-lab.png",
    flags = { "placeable-player", "player-creation" },
    minable = { mining_time = 2, result = "kr-singularity-lab" },
    fast_replaceable_group = "assembling-machine",
    collision_box = { { -3.75, -3.75 }, { 3.75, 3.75 } },
    selection_box = { { -3.9, -3.9 }, { 3.9, 3.9 } },
    researching_speed = 1,
    inputs = {
      "production-science-pack",
      "utility-science-pack",
      kr_optimization_tech_card_name,
      "matter-tech-card",
      "advanced-tech-card",
      "singularity-tech-card",
    },
    module_slots = 4,
    energy_source = { type = "electric", usage_priority = "secondary-input" },
    energy_usage = "10MW",
    max_health = 2000,
    damaged_trigger_effect = hit_effects.entity(),
    dying_explosion = "big-explosion",
    corpse = "kr-big-random-pipes-remnant",
    resistances = {
      { type = "physical", percent = 60 },
      { type = "fire", percent = 90 },
      { type = "impact", percent = 90 },
    },
    open_sound = { filename = "__Krastorio2Assets__/sounds/buildings/open.ogg", volume = 1 },
    close_sound = { filename = "__Krastorio2Assets__/sounds/buildings/close.ogg", volume = 1 },
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      sound = {
        filename = "__Krastorio2Assets__/sounds/buildings/singularity-lab.ogg",
        volume = 0.5,
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 1 },
      max_sounds_per_prototype = 6,
    },
    on_animation = {
      layers = {
        {
          filename = "__Krastorio2Assets__/buildings/singularity-lab/singularity-lab-glow-light.png",
          priority = "high",
          width = 153,
          height = 117,
          shift = { 0, -0.8 },
          frame_count = 60,
          line_length = 6,
          scale = 0.5,
          animation_speed = 0.85,
          draw_as_light = true,
        },
        {
          filename = "__Krastorio2Assets__/buildings/singularity-lab/singularity-lab-glow.png",
          priority = "high",
          width = 153,
          height = 117,
          shift = { 0, -0.8 },
          frame_count = 60,
          line_length = 6,
          scale = 0.5,
          animation_speed = 0.85,
          blend_mode = "additive",
        },
        {
          filename = "__Krastorio2Assets__/buildings/singularity-lab/singularity-lab-light.png",
          priority = "high",
          width = 520,
          height = 500,
          shift = { 0.0, -0.1 },
          draw_as_light = true,
          frame_count = 1,
          repeat_count = 60,
          scale = 0.5,
        },
        {
          filename = "__Krastorio2Assets__/buildings/singularity-lab/singularity-lab-working.png",
          width = 520,
          height = 500,
          shift = { 0.0, -0.1 },
          frame_count = 60,
          line_length = 10,
          scale = 0.5,
          animation_speed = 0.85,
        },
        {
          filename = "__Krastorio2Assets__/buildings/singularity-lab/singularity-lab-sh.png",
          priority = "medium",
          width = 548,
          height = 482,
          shift = { 0.22, 0.18 },
          frame_count = 1,
          repeat_count = 60,
          draw_as_shadow = true,
          scale = 0.5,
        },
      },
    },
    off_animation = {
      layers = {
        {
          filename = "__Krastorio2Assets__/buildings/singularity-lab/singularity-lab.png",
          priority = "high",
          width = 520,
          height = 500,
          shift = { 0.0, -0.1 },
          frame_count = 1,
          scale = 0.5,
        },
        {
          filename = "__Krastorio2Assets__/buildings/singularity-lab/singularity-lab-sh.png",
          priority = "high",
          width = 548,
          height = 482,
          shift = { 0.22, 0.18 },
          frame_count = 1,
          draw_as_shadow = true,
          scale = 0.5,
        },
      },
    },
    light = {
      {
        intensity = 0.95,
        size = 5,
        shift = { 0.0, -0.6 },
        color = { r = 0, g = 0.917, b = 1 },
      },
    },
  },
})
