local resource_autoplace = require("__core__.lualib.resource-autoplace")

-- Adding rare metals
data:extend({
  {
    type = "item",
    name = "raw-rare-metals",
    icon = "__Krastorio2Assets__/icons/items/raw-rare-metals.png",
    subgroup = "raw-resource",
    order = "ga[raw-rare-metals]",
    stack_size = 200,
    pictures = {
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/items/raw-rare-metals.png",
        scale = 0.5,
        mipmap_count = 4,
      },
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/items/raw-rare-metals-1.png",
        scale = 0.5,
        mipmap_count = 4,
      },
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/items/raw-rare-metals-2.png",
        scale = 0.5,
        mipmap_count = 4,
      },
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/items/raw-rare-metals-3.png",
        scale = 0.5,
        mipmap_count = 4,
      },
    },
  },
  {
    type = "resource",
    name = "rare-metals",
    icon = "__Krastorio2Assets__/icons/resources/rare-metals.png",
    flags = { "placeable-neutral" },
    order = "a-b-a",
    subgroup = "raw-resource",
    collision_box = { { -0.1, -0.1 }, { 0.1, 0.1 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    tree_removal_probability = 0,
    tree_removal_max_distance = 0,
    minable = {
      hardness = 2,
      mining_particle = "stone-particle",
      mining_time = 3,
      result = "raw-rare-metals",
      fluid_amount = 25,
      required_fluid = "chlorine",
    },
    autoplace = resource_autoplace.resource_autoplace_settings({
      name = "rare-metals",
      order = "d",
      base_density = 1.0,
      base_spots_per_km2 = 0.75,
      has_starting_area_placement = false,
      random_spot_size_minimum = 0.25,
      random_spot_size_maximum = 3,
      regular_blob_amplitude_multiplier = 1,
      regular_rq_factor_multiplier = 0.9,
      candidate_spot_count = 22,
    }),
    stage_counts = { 15000, 9500, 5500, 2900, 1300, 400, 150, 80 },
    stages = {
      sheet = {
        filename = "__Krastorio2Assets__/resources/rare-metals/rare-metals.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5,
      },
    },
    stages_effect = {
      sheet = {
        filename = "__Krastorio2Assets__/resources/rare-metals/rare-metals-glow.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        frame_count = 8,
        animation_speed = 3,
        variation_count = 8,
        scale = 0.5,
        draw_as_glow = true,
      },
    },
    effect_animation_period = 5,
    effect_animation_period_deviation = 1,
    effect_darkness_multiplier = 5,
    min_effect_alpha = 0.2,
    max_effect_alpha = 0.3,
    map_color = { r = 0.6, g = 0.3, b = 1 },
    mining_visualisation_tint = { r = 0.258, g = 0.960, b = 0.529 },
  },
  {
    type = "autoplace-control",
    name = "rare-metals",
    localised_name = { "", "[entity=rare-metals] ", { "autoplace-control-names.rare-metals" } },
    order = "k-a",
    richness = true,
    category = "resource",
  },
})
