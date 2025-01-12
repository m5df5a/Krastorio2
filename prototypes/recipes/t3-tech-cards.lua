data:extend({
  {
    type = "recipe",
    name = "advanced-tech-card",
    enabled = false,
    category = "t3-tech-cards",
    energy_required = 4,
    ingredients = {
      { type = "item", name = "blank-tech-card", amount = 3 },
      { type = "item", name = "imersium-gear-wheel", amount = 4 },
      { type = "item", name = "lithium-sulfur-battery", amount = 2 },
      { type = "item", name = "electric-engine-unit", amount = 1 },
    },
    results = {
      { type = "item", name = "advanced-tech-card", amount = 1 },
    },
    allow_productivity = true,
  },
  {
    type = "recipe",
    name = "matter-research-data",
    enabled = false,
    category = "t3-tech-cards",
    energy_required = 4,
    ingredients = {
      { type = "item", name = "imersite-crystal", amount = 1 },
      { type = "item", name = "rare-metals", amount = 1 },
      { type = "item", name = "lithium", amount = 1 },
      { type = "item", name = "plastic-bar", amount = 1 },
    },
    results = {
      { type = "item", name = "matter-research-data", amount = 1 },
    },
    allow_productivity = true,
  },
  {
    type = "recipe",
    name = "matter-tech-card",
    enabled = false,
    category = "t3-tech-cards",
    energy_required = 4,
    ingredients = {
      { type = "item", name = "blank-tech-card", amount = 3 },
      { type = "item", name = "matter-research-data", amount = 1 },
      { type = "item", name = "processing-unit", amount = 1 },
    },
    results = {
      { type = "item", name = "matter-tech-card", amount = 1 },
    },
    allow_productivity = true,
  },
  {
    type = "recipe",
    name = "singularity-tech-card",
    enabled = false,
    category = "t3-tech-cards",
    energy_required = 4,
    ingredients = {
      { type = "item", name = "blank-tech-card", amount = 3 },
      { type = "item", name = "charged-matter-stabilizer", amount = 1 },
      { type = "item", name = "ai-core", amount = 1 },
    },
    results = {
      { type = "item", name = "singularity-tech-card", amount = 1 },
    },
    allow_productivity = true,
  },
  {
    type = "recipe",
    name = kr_optimization_tech_card_name,
    enabled = false,
    category = "t3-tech-cards",
    energy_required = 4,
    ingredients = {
      { type = "item", name = "blank-tech-card", amount = 2 },
      { type = "item", name = "space-research-data", amount = 1 },
    },
    results = {
      { type = "item", name = kr_optimization_tech_card_name, amount = 1 },
    },
    allow_productivity = true,
  },
})
