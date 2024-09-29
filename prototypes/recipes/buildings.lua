return {
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -- -- --
  -- NEW LABORATORIES
  -- -- --
  {
    type = "recipe",
    name = "biusart-lab",
    energy_required = 10,
    enabled = false,
    ingredients = {
      { type = "item", name = "advanced-circuit", amount = 10 },
      { type = "item", name = "steel-beam", amount = 5 },
      { type = "item", name = "lab", amount = 1 },
      { type = "item", name = "copper-cable", amount = 10 },
    },
    results = { { type = "item", name = "biusart-lab", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-singularity-lab",
    energy_required = 120,
    enabled = false,
    ingredients = {
      { type = "item", name = "ai-core", amount = 20 },
      { type = "item", name = "biusart-lab", amount = 5 },
      { type = "item", name = "steel-plate", amount = 40 },
      { type = "item", name = "electric-engine-unit", amount = 30 },
      { type = "item", name = "rare-metals", amount = 60 },
      { type = "item", name = "processing-unit", amount = 100 },
    },
    results = { { type = "item", name = "kr-singularity-lab", amount = 1 } },
  },
  -- -- --
  -- Research servers
  -- -- --
  -- -- --
  -- FLUID STORAGES
  -- -- --
  {
    type = "recipe",
    name = "kr-fluid-storage-1",
    energy_required = 5,
    enabled = false,
    ingredients = {
      { type = "item", name = "steel-beam", amount = 10 },
      { type = "item", name = "steel-plate", amount = 20 },
      { type = "item", name = "kr-steel-pipe", amount = 4 },
    },
    results = { { type = "item", name = "kr-fluid-storage-1", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-fluid-storage-2",
    energy_required = 10,
    enabled = false,
    ingredients = {
      { type = "item", name = "steel-beam", amount = 20 },
      { type = "item", name = "steel-plate", amount = 60 },
      { type = "item", name = "kr-steel-pipe", amount = 12 },
    },
    results = { { type = "item", name = "kr-fluid-storage-2", amount = 1 } },
  },
  -- -- --
  ---
  -- Belts
  ---
  -- Advanced
  {
    type = "recipe",
    name = "kr-advanced-splitter",
    --category = "crafting-with-fluid",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "item", name = "express-splitter", amount = 1 },
      { type = "item", name = "steel-gear-wheel", amount = 4 },
      { type = "item", name = "advanced-circuit", amount = 1 },
    },
    results = { { type = "item", name = "kr-advanced-splitter", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-advanced-transport-belt",
    --category = "crafting-with-fluid",
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
    type = "recipe",
    name = "kr-advanced-underground-belt",
    --category = "crafting-with-fluid",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "item", name = "express-underground-belt", amount = 2 },
      { type = "item", name = "kr-advanced-transport-belt", amount = 30 },
    },
    results = { { type = "item", name = "kr-advanced-underground-belt", amount = 2 } },
  },
  -- Superior
  {
    type = "recipe",
    name = "kr-superior-splitter",
    --category = "crafting-with-fluid",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "item", name = "kr-advanced-splitter", amount = 1 },
      { type = "item", name = "imersium-gear-wheel", amount = 4 },
      { type = "item", name = "processing-unit", amount = 1 },
    },
    results = { { type = "item", name = "kr-superior-splitter", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-superior-transport-belt",
    --category = "crafting-with-fluid",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
      { type = "item", name = "kr-advanced-transport-belt", amount = 1 },
      { type = "item", name = "imersium-gear-wheel", amount = 4 },
      { type = "item", name = "low-density-structure", amount = 1 },
    },
    results = { { type = "item", name = "kr-superior-transport-belt", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-superior-underground-belt",
    --category = "crafting-with-fluid",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "item", name = "kr-advanced-underground-belt", amount = 2 },
      { type = "item", name = "kr-superior-transport-belt", amount = 40 },
    },
    results = { { type = "item", name = "kr-superior-underground-belt", amount = 2 } },
  },
  -- -- --
  -- Superior inserters
  -- -- --
  -- -- --
  {
    type = "recipe",
    name = "kr-large-roboport",
    energy_required = 30,
    enabled = false,
    ingredients = {
      { type = "item", name = "steel-plate", amount = 20 },
      { type = "item", name = "imersium-beam", amount = 20 },
      { type = "item", name = "imersium-gear-wheel", amount = 20 },
      { type = "item", name = "rare-metals", amount = 80 },
      { type = "item", name = "ai-core", amount = 10 },
      { type = "item", name = "roboport", amount = 1 },
    },
    results = { { type = "item", name = "kr-large-roboport", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-small-roboport",
    energy_required = 5,
    enabled = false,
    ingredients = {
      { type = "item", name = "imersium-beam", amount = 3 },
      { type = "item", name = "steel-plate", amount = 10 },
      { type = "item", name = "rare-metals", amount = 20 },
      { type = "item", name = "ai-core", amount = 1 },
      { type = "item", name = "electronic-components", amount = 5 },
    },
    results = { { type = "item", name = "kr-small-roboport", amount = 2 } },
  },
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
}
