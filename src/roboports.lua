-- src/roboports.lua

if data.raw.roboport and data.raw.roboport.roboport then
  local roboport = data.raw.roboport.roboport

  local spots_count = settings.startup["roboport-charging-spots-count"] and settings.startup["roboport-charging-spots-count"].value or 16
  local radius = settings.startup["roboport-charging-spots-radius"] and settings.startup["roboport-charging-spots-radius"].value or 1.5

  local offsets = {}

  for i = 0, spots_count - 1 do
    local angle = i * (2 * math.pi) / spots_count
    local x = math.floor((math.cos(angle) * radius) * 1000 + 0.5) / 1000
    local y = math.floor((math.sin(angle) * radius) * 1000 + 0.5) / 1000
    table.insert(offsets, { x, y })
  end

  roboport.charging_offsets = offsets
  roboport.charge_approach_distance = 5

  roboport.charging_energy = "20MW"
  roboport.energy_source = {
    type = "electric",
    usage_priority = "secondary-input",
    input_flow_limit = "250MW",
    buffer_capacity = "500MJ"
  }
end
