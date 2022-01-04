--[[
  DATA:
  - We have:
    - beam number
    - target number
    - tower number
  - We need:
    - to get
]]
local event = require("__flib__.event")

local constants = require("scripts.constants")

local tesla_coil = {}

function tesla_coil.init()
  global.tesla_coil = {
    beams = {},
    grids = {},
    towers = {},
    targets = {},
  }
end

function tesla_coil.reset_grids_cache()
  global.tesla_coil.grids = {}
end

function tesla_coil.get_absorber_buffer_capacity()
  global.tesla_coil.absorber_buffer_capacity =
    game.equipment_prototypes["energy-absorber"].energy_source.buffer_capacity
end

function tesla_coil.build(source_entity)
  local surface = source_entity.surface
  local unit_number = source_entity.unit_number

  local data = {
    entities = {
      collision = surface.create_entity({
        name = "kr-tesla-coil-collision",
        position = source_entity.position,
        force = source_entity.force,
        create_build_effect_smoke = false,
        raise_built = true,
      }),
      tower = source_entity,
      -- This entity isn't actually used for any logic, it's simply to make the defense equipment fire
      trigger = surface.create_entity({
        name = "kr-tesla-coil-trigger",
        position = { x = source_entity.position.x, y = source_entity.position.y + 5 },
        force = game.forces["kr-internal-turrets"],
        create_build_effect_smoke = false,
        raise_built = true,
      }),
    },
    unit_number = unit_number,
  }

  global.tesla_coil.towers[unit_number] = data
end

function tesla_coil.destroy(entity)
  -- Beams will automatically get destroyed
  local unit_number = entity.unit_number
  local data = global.tesla_coil.towers[unit_number]
  if data then
    for _, entity in pairs(data.entities) do
      if entity and entity.valid then
        entity.destroy()
      end
    end
    global.tesla_coil.towers[unit_number] = nil
  end
end

--- @class GridInfo
--- @field grid LuaEquipmentGrid
--- @field absorber LuaEquipment|nil

--- Finds the energy absorber in the given equipment grid, if there is one.
--- @param grid LuaEquipmentGrid
--- @return LuaEquipment|nil
local function find_absorber_in_grid(grid)
  -- Find the energy absorber
  for _, equipment in pairs(grid.equipment) do
    if equipment.name == "energy-absorber" then
      return equipment
    end
  end
end

--- @param target LuaEntity
--- @return GridInfo
function tesla_coil.get_grid_info(target)
  local existing = global.tesla_coil.grids[target.unit_number]
  if existing then
    return existing
  end

  local grid
  if target.type == "character" then
    local armor_inventory = target.get_inventory(defines.inventory.character_armor)
    if armor_inventory and armor_inventory.valid then
      local armor = armor_inventory[1]
      if armor and armor.valid_for_read then
        grid = armor.grid
      end
    end
  else
    grid = target.grid
  end

  if grid then
    local data = {
      absorber = find_absorber_in_grid(grid),
      grid = grid,
    }
    global.tesla_coil.grids[target.unit_number] = data

    return data
  end
end

--- Updates the absorber object in a cached equipment grid
--- @param grid LuaEquipmentGrid
function tesla_coil.update_cached_grid(grid)
  for _, grid_data in pairs(global.tesla_coil.grids) do
    if grid_data.grid == grid then
      grid_data.absorber = find_absorber_in_grid(grid)
    end
  end
end

function tesla_coil.add_target(target, tower_data)
  local target_unit_number = target.unit_number
  -- Check if the tower is powered
  if tower_data.entities.tower.energy < constants.tesla_coil.required_energy then
    return
  end
  -- Check the target's equipment grid for an energy absorber
  local grid_data = tesla_coil.get_grid_info(target)
  if grid_data and grid_data.absorber and grid_data.absorber.valid then
    -- Check if the absorber has space
    local capacity = global.tesla_coil.absorber_buffer_capacity
    if grid_data.absorber.energy < capacity then
      -- Create beam entity
      local beam = tower_data.entities.tower.surface.create_entity({
        name = "kr-tesla-coil-electric-beam",
        source = tower_data.entities.tower,
        source_offset = { 0, -2.2 },
        position = tower_data.entities.tower.position,
        target = target,
        duration = 0,
        max_length = 20,
        force = tower_data.entities.tower.force,
        raise_built = true,
      })
      local beam_number = event.register_on_entity_destroyed(beam)

      global.tesla_coil.beams[beam_number] = {
        entity = beam,
        target = target_unit_number,
        tower = tower_data.unit_number,
      }
      global.tesla_coil.targets[target_unit_number] = {
        connections = {},
        entity = target,
        grid_data = grid_data,
        unit_number = target_unit_number,
      }

      return global.tesla_coil.targets[target_unit_number]
    end
  end
end

function tesla_coil.remove_target(target_unit_number)
  global.tesla_coil.targets[target_unit_number] = nil
end

function tesla_coil.remove_connection(beam_number)
  local beam_data = global.tesla_coil.beams[beam_number]
  if beam_data then
    local target_data = global.tesla_coil.targets[beam_data.target]
    if not target_data then
      return
    end
    -- Destroy beam if it still exists
    if beam_data.entity.valid then
      beam_data.entity.destroy()
    end
    -- Remove data tables
    global.tesla_coil.beams[beam_number] = nil
    target_data.connections[beam_number] = nil

    if table_size(target_data.connections) == 0 then
      tesla_coil.remove_target(target_data.unit_number)
    end
  end
end

function tesla_coil.update_connection(target_data, tower_data)
  local absorber = target_data.absorber
  -- Check if the tower is powered
  if not absorber or not absorber.valid or tower_data.entities.tower.energy < constants.tesla_coil.required_energy then
    tesla_coil.remove_connection(target_data.beam_number)
    return
  end
  local capacity = global.tesla_coil.absorber_buffer_capacity
  local energy = absorber.energy
  if energy < capacity then
    -- Calculate how much to add
    local to_add = constants.tesla_coil.charging_rate / 60
    local result = energy + to_add
    local tower = tower_data.entities.tower
    if result > capacity then
      absorber.energy = capacity
    else
      absorber.energy = result
    end
    tower.energy = tower.energy - (to_add * constants.tesla_coil.loss_multiplier)
  else
    tesla_coil.remove_connection(target_data.beam_number)
  end
end

function tesla_coil.process_equipment_fire(target, tower)
  local tower_data = global.tesla_coil.towers[tower.unit_number]
  if not tower_data then
    return
  end

  local target_data = global.tesla_coil.targets[target.unit_number]
  if not target_data then
    target_data = tesla_coil.add_target(target, tower_data)
  end

  if target_data then
    tesla_coil.update_connection(target_data, tower_data)
  end
end

return tesla_coil
