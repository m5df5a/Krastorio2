-- Update grid of specified vehicle, will integrate with the grid the equipment categories of old grid
-- that is different from "armor" that is dedicated to character equipment
-- @vehicle_type, prototype type of vehicle
-- @vehicle_name, name of vehicle
-- @equipment_grid_name, name of the new grid to apply
local function applyAndIntegrateEquipmentCategories(vehicle_type, vehicle_name, equipment_grid_name)
  if data.raw[vehicle_type][vehicle_name] then
    if
      data.raw[vehicle_type][vehicle_name].equipment_grid
      and data.raw["equipment-grid"][data.raw[vehicle_type][vehicle_name].equipment_grid]
    then
      local equipment_categories_set = {}
      for _, equipment_category in pairs(data.raw["equipment-grid"][equipment_grid_name].equipment_categories) do
        equipment_categories_set[equipment_category] = true
      end

      for _, equipment_category in
        pairs(data.raw["equipment-grid"][data.raw[vehicle_type][vehicle_name].equipment_grid].equipment_categories)
      do
        if equipment_category ~= "armor" and not equipment_categories_set[equipment_category] then
          table.insert(data.raw["equipment-grid"][equipment_grid_name].equipment_categories, equipment_category)
        end
      end
    end

    data.raw[vehicle_type][vehicle_name].equipment_grid = equipment_grid_name
  end
end

-- -- General vehicles grids compatibility, modify grid and integrate it
applyAndIntegrateEquipmentCategories("car", "car", "kr-car-grid")
applyAndIntegrateEquipmentCategories("car", "tank", "kr-tank-grid")
applyAndIntegrateEquipmentCategories("locomotive", "locomotive", "kr-locomotive-grid")
applyAndIntegrateEquipmentCategories("locomotive", "nuclear-locomotive", "kr-locomotive-grid")
applyAndIntegrateEquipmentCategories("cargo-wagon", "cargo-wagon", "kr-wagons-grid")
applyAndIntegrateEquipmentCategories("spider-vehicle", "spidertron", "kr-spidertron-equipment-grid")
if data.raw["cargo-wagon"]["cargo-wagon"] then
  data.raw["cargo-wagon"]["cargo-wagon"].allow_robot_dispatch_in_automatic_mode = true
end
applyAndIntegrateEquipmentCategories("fluid-wagon", "fluid-wagon", "kr-wagons-grid")
applyAndIntegrateEquipmentCategories("artillery-wagon", "artillery-wagon", "kr-wagons-grid")

-----------------------------------------------------------------------------------------------------------------
-- -- Personal roboports
-----------------------------------------------------------------------------------------------------------------

-- Personal roboports (both vanilla)
if data.raw["roboport-equipment"]["personal-roboport-equipment"] then
  data.raw["roboport-equipment"]["personal-roboport-equipment"].robot_limit = 20
  data.raw["roboport-equipment"]["personal-roboport-equipment"].construction_radius = 15
  data.raw["roboport-equipment"]["personal-roboport-equipment"].categories = { "robot-interaction-equipment" }
end

if data.raw["roboport-equipment"]["personal-roboport-mk2-equipment"] then
  data.raw["roboport-equipment"]["personal-roboport-mk2-equipment"].robot_limit = 30
  data.raw["roboport-equipment"]["personal-roboport-mk2-equipment"].energy_source = {
    type = "electric",
    buffer_capacity = "50MJ",
    input_flow_limit = "5000kW",
    usage_priority = "secondary-input",
  }
  data.raw["roboport-equipment"]["personal-roboport-mk2-equipment"].charging_energy = "2000kW"
  data.raw["roboport-equipment"]["personal-roboport-mk2-equipment"].categories = { "robot-interaction-equipment" }
end

-- Personal roboport equipment (recipe)
krastorio.recipes.addIngredient("personal-roboport-equipment", { type = "item", name = "steel-plate", amount = 10 })
krastorio.recipes.replaceIngredient(
  "personal-roboport-equipment",
  "battery",
  { type = "item", name = "battery", amount = 45 }
)
krastorio.recipes.replaceIngredient(
  "personal-roboport-equipment",
  "advanced-circuit",
  { type = "item", name = "advanced-circuit", amount = 5 }
)
krastorio.recipes.replaceIngredient(
  "personal-roboport-equipment",
  "iron-gear-wheel",
  { type = "item", name = "iron-gear-wheel", amount = 20 }
)
krastorio.recipes.removeIngredient("personal-roboport-equipment", "steel-plate")

-- Personal roboport mk2 equipment (recipe)
krastorio.recipes.replaceIngredient("personal-roboport-mk2-equipment", "processing-unit", { "processing-unit", 20 })

-----------------------------------------------------------------------------------------------------------------
-- -- Batteries
-----------------------------------------------------------------------------------------------------------------

-- -- Items visual(icon, sprites)/modifcation
if data.raw.item["battery-equipment"] then
  data.raw.item["battery-equipment"].pictures = {
    layers = {
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/equipment/battery-mk1-equipment.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = "__Krastorio2Assets__/icons/equipment/battery-equipment-light.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
  }
end
if data.raw.item["battery-mk2-equipment"] then
  data.raw.item["battery-equipment"].pictures = {
    layers = {
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/equipment/battery-mk2-equipment.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = "__Krastorio2Assets__/icons/equipment/battery-equipment-light.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
  }
end

-- Equipments categories
table.insert(data.raw["battery-equipment"]["battery-equipment"].categories, "universal-equipment")
table.insert(data.raw["battery-equipment"]["battery-mk2-equipment"].categories, "universal-equipment")

-- -- Statistic Modification
-- Energies
data.raw["battery-equipment"]["battery-equipment"].energy_source = {
  type = "electric",
  buffer_capacity = "10MJ",
  input_flow_limit = "0.25MW",
  output_flow_limit = "0.5MW",
  usage_priority = "tertiary",
}
data.raw["battery-equipment"]["battery-mk2-equipment"].energy_source = {
  type = "electric",
  buffer_capacity = "25MJ",
  input_flow_limit = "0.5MW",
  output_flow_limit = "1MW",
  usage_priority = "tertiary",
}

-- Recipe
krastorio.recipes.overrideIngredients("battery-equipment", {
  { type = "item", name = "battery", amount = 2 },
  { type = "item", name = "iron-plate", amount = 2 },
  { type = "item", name = "electronic-circuit", amount = 1 },
})
krastorio.recipes.overrideIngredients("battery-mk2-equipment", {
  { type = "item", name = "battery-equipment", amount = 2 },
  { type = "item", name = "steel-plate", amount = 2 },
  { type = "item", name = "advanced-circuit", amount = 1 },
})

-- subgroup
data.raw.item["battery-equipment"].order = "b1[battery]-b1[battery-equipment]"
data.raw.item["battery-equipment"].subgroup = "equipment"
data.raw.item["battery-mk2-equipment"].order = "b2[battery]-b3[battery-equipment]"
data.raw.item["battery-mk2-equipment"].subgroup = "equipment"

-----------------------------------------------------------------------------------------------------------------
-- -- Discharge defense
-----------------------------------------------------------------------------------------------------------------

-- Equipments categories
table.insert(data.raw["active-defense-equipment"]["discharge-defense-equipment"].categories, "universal-equipment")
-- Order
data.raw["active-defense-equipment"]["discharge-defense-equipment"].order =
  "f[active-defense-equipment]-a[discharge-defense-equipment]"
data.raw.item["discharge-defense-equipment"].subgroup = "equipment"
data.raw.item["discharge-defense-equipment"].order = "f[active-defense-equipment]-a[discharge-defense-equipment]"
-- Order for remote item
data.raw.capsule["discharge-defense-remote"].subgroup = "equipment"
data.raw.capsule["discharge-defense-remote"].order = "f[active-defense-equipment]-b[discharge-defense-remote]"

-----------------------------------------------------------------------------------------------------------------
-- -- Fusion reactor
-----------------------------------------------------------------------------------------------------------------

if data.raw.item["fission-reactor-equipment"] then
  data.raw.item["fission-reactor-equipment"].pictures = {
    layers = {
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/equipment/fission-reactor-equipment.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = "__Krastorio2Assets__/icons/equipment/fission-reactor-equipment-light.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
  }
end

krastorio.icons.setTechnologyIcons("fission-reactor-equipment", {
  { icon = "__Krastorio2Assets__/technologies/fission-reactor-equipment.png", icon_size = 256, icon_mipmaps = 4 },
  { icon = "__Krastorio2Assets__/technologies/overlays/equipment-overlay.png", icon_size = 256, icon_mipmaps = 4 },
}, 256, 4)

-- Equipments categories
table.insert(data.raw["generator-equipment"]["fission-reactor-equipment"].categories, "universal-equipment")

data.raw["generator-equipment"]["fission-reactor-equipment"].burner = {
  type = "burner",
  fuel_categories = { "fusion-fuel" },
  effectivity = 2,
  fuel_inventory_size = 1,
  burnt_inventory_size = 1,
}

-- -- Energy generated by equipment:
-- Equipment energy generated is balanced on this formula:
-- power = 50kW * grid_cells_occupied * tier_multiplier * big_version_multiplier
-- (solar panel is useless, and with this formula will be boosted)
data.raw["generator-equipment"]["fission-reactor-equipment"].power = "3.2MW" -- 50kW * 16 * 4 * 1
data.raw.item["fission-reactor-equipment"].order = "a2[energy-source]-a5[portable-nuclear-core]"
data.raw.item["fission-reactor-equipment"].subgroup = "equipment"

-----------------------------------------------------------------------------------------------------------------
-- -- Roboport equipment
-----------------------------------------------------------------------------------------------------------------

data.raw["roboport-equipment"]["personal-roboport-equipment"].robot_limit = 20
data.raw["roboport-equipment"]["personal-roboport-equipment"].construction_radius = 15

-----------------------------------------------------------------------------------------------------------------
-- -- Personal laser
-----------------------------------------------------------------------------------------------------------------

-- Equipments categories
table.insert(data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].categories, "universal-equipment")

data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].energy_source.buffer_capacity = "18MJ"
data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].energy_source.input_flow_limit = "2MW"
data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].attack_parameters = {
  type = "beam",
  cooldown = 80,
  damage_modifier = 15,
  projectile_center = { 0, 0 },
  range = 30,
  ammo_category = "laser",
  ammo_type = {
    energy_consumption = "3MJ",
    action = {
      type = "direct",
      action_delivery = {
        {
          type = "instant",
          target_effects = {
            {
              type = "create-entity",
              entity_name = "explosion-hit",
            },
          },
        },
        {
          type = "beam",
          beam = "laser-beam",
          max_length = 35,
          duration = 40,
          source_offset = { 0, -1.31439 },
        },
      },
    },
  },
}

data.raw.item["personal-laser-defense-equipment"].localised_name = {
  "equipment-name.personal-sniper-laser-defense-mk1-equipment",
}
data.raw.item["personal-laser-defense-equipment"].localised_description = {
  "equipment-description.personal-sniper-laser-defense-mk1-equipment",
}
data.raw.item["personal-laser-defense-equipment"].subgroup = "equipment"
data.raw.item["personal-laser-defense-equipment"].order = "d[active-defense]-b1[personal-laser-defense-mk1-equipment]"

data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].localised_name = {
  "equipment-name.personal-sniper-laser-defense-mk1-equipment",
}
data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].localised_description = {
  "equipment-description.personal-sniper-laser-defense-mk1-equipment",
}

-----------------------------------------------------------------------------------------------------------------
-- -- Shields
-----------------------------------------------------------------------------------------------------------------

-- Equipments categories
table.insert(data.raw["energy-shield-equipment"]["energy-shield-equipment"].categories, "universal-equipment")
table.insert(data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].categories, "universal-equipment")

-- Localized names
data.raw.item["energy-shield-equipment"].localised_name = { "equipment-name.shield-generator-mk1" }
data.raw.item["energy-shield-equipment"].localised_description = { "equipment-description.shield-generator-mk1" }
data.raw["energy-shield-equipment"]["energy-shield-equipment"].localised_name = {
  "equipment-name.shield-generator-mk1",
}
data.raw["energy-shield-equipment"]["energy-shield-equipment"].localised_description = {
  "equipment-description.shield-generator-mk1",
}
data.raw["energy-shield-equipment"]["energy-shield-equipment"].order = "b[shield]-a[energy-shield-equipment-mk1]"
data.raw.item["energy-shield-equipment"].subgroup = "equipment"
data.raw.item["energy-shield-equipment"].order = "b[shield]-a[energy-shield-equipment-mk1]"

data.raw.item["energy-shield-mk2-equipment"].localised_name = { "equipment-name.shield-generator-mk2" }
data.raw.item["energy-shield-mk2-equipment"].localised_description = { "equipment-description.shield-generator-mk2" }
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].localised_name = {
  "equipment-name.shield-generator-mk2",
}
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].localised_description = {
  "equipment-description.shield-generator-mk2",
}
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].order = "b[shield]-b[energy-shield-equipment-mk2]"
data.raw.item["energy-shield-mk2-equipment"].subgroup = "equipment"
data.raw.item["energy-shield-mk2-equipment"].order = "b[shield]-b[energy-shield-equipment-mk2]"

-----------------------------------------------------------------------------------------------------------------
-- -- Solar pannel
-----------------------------------------------------------------------------------------------------------------

-- Equipments categories
table.insert(data.raw["solar-panel-equipment"]["solar-panel-equipment"].categories, "universal-equipment")

data.raw["solar-panel-equipment"]["solar-panel-equipment"].power = "40kW" -- 40kW * 1  * 1 * 1
data.raw.item["solar-panel-equipment"].order = "a[energy-source]-a1[solar-panel]"
data.raw.item["solar-panel-equipment"].subgroup = "equipment"

krastorio.recipes.addIngredient("solar-panel-equipment", { name = "glass", amount = 5 })
krastorio.recipes.removeIngredient("solar-panel", { name = "glass", amount = 5 })

-----------------------------------------------------------------------------------------------------------------
-- -- Belt Immunity
-----------------------------------------------------------------------------------------------------------------

-- Equipments categories
table.insert(data.raw["belt-immunity-equipment"]["belt-immunity-equipment"].categories, "universal-equipment")

-----------------------------------------------------------------------------------------------------------------
-- Night visor
-----------------------------------------------------------------------------------------------------------------

data.raw["night-vision-equipment"]["night-vision-equipment"].color_lookup = {
  { 0.75, "__Krastorio2Assets__/luts/nightvision-equipment.png" },
}

data.raw["night-vision-equipment"]["night-vision-equipment"].tint = { r = 0.1, g = 0.255, b = 1, a = 0.255 }
data.raw["night-vision-equipment"]["night-vision-equipment"].desaturation_params = {
  smoothstep_min = 0.1,
  smoothstep_max = 0.7,
  minimum = 0.35,
  maximum = 0.9,
}
data.raw["night-vision-equipment"]["night-vision-equipment"].light_params = {
  smoothstep_min = 0.1,
  smoothstep_max = 0.7,
  minimum = 0.35,
  maximum = 0.8,
}
data.raw["night-vision-equipment"]["night-vision-equipment"].darkness_to_turn_on = 0.5
data.raw["night-vision-equipment"]["night-vision-equipment"].shape = {
  width = 1,
  height = 1,
  type = "full",
}

krastorio.recipes.overrideIngredients("night-vision-equipment", {
  { type = "item", name = "advanced-circuit", amount = 2 },
  { type = "item", name = "iron-plate", amount = 1 },
  { type = "item", name = "plastic-bar", amount = 1 },
  { type = "item", name = "glass", amount = 1 },
})

data.raw.item["night-vision-equipment"].subgroup = "character-equipment"
data.raw.item["night-vision-equipment"].order = "f[night-vision]-a1[night-vision-equipment]"

-----------------------------------------------------------------------------------------------------------------
-- Exoskeleton equipment
-----------------------------------------------------------------------------------------------------------------

data.raw["movement-bonus-equipment"]["exoskeleton-equipment"].movement_bonus = 0.2
data.raw["movement-bonus-equipment"]["exoskeleton-equipment"].categories = { "armor", "spidertron-only" }

data.raw.item["exoskeleton-equipment"].subgroup = "character-equipment"
data.raw.item["exoskeleton-equipment"].order = "e[exoskeleton]-a1[exoskeleton-equipment]"

-----------------------------------------------------------------------------------------------------------------
