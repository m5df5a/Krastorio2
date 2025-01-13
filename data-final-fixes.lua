require("prototypes.final-fixes.enforce-science-pack-prerequisites")
require("prototypes.final-fixes.enforce-science-tier-separation")
require("prototypes.final-fixes.internal-turret-logic")
data.raw.recipe["iron-stick"].enabled = true
data.raw.technology["electric-mining-drill"].hidden = true
data.raw.item["satellite"].rocket_launch_products = { { type = "item", name = "space-research-data", amount = 1000 } }