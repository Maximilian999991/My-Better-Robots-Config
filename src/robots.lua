-- src/robots.lua

local function apply_robot_settings()
  local speed_value = settings.global["fast-worker-robot-speed"] and settings.global["fast-worker-robot-speed"].value or 5.0
  local battery_modifier = settings.global["worker-robot-battery-modifier"] and settings.global["worker-robot-battery-modifier"].value or 4.0

  speed_value = (speed_value / 0.05) - 1
  battery_modifier = battery_modifier - 1
  if speed_value < 0 then speed_value = 0 end
  if battery_modifier < 0 then battery_modifier = 0 end

  for _, force in pairs(game.forces) do
    force.worker_robots_speed_modifier = speed_value
    force.worker_robots_battery_modifier = battery_modifier
  end
end

script.on_init(function()
  apply_robot_settings()
end)

script.on_configuration_changed(function()
  apply_robot_settings()
end)

script.on_event(defines.events.on_runtime_mod_setting_changed, function(event)
  if event.setting == "fast-worker-robot-speed" or event.setting == "worker-robot-battery-modifier" then
    apply_robot_settings()
  end
end)

script.on_event(defines.events.on_force_created, function(event)
  local speed_value = settings.global["fast-worker-robot-speed"] and settings.global["fast-worker-robot-speed"].value or 5.0
  local battery_modifier = settings.global["worker-robot-battery-modifier"] and settings.global["worker-robot-battery-modifier"].value or 4.0

  speed_value = (speed_value / 0.05) - 1
  battery_modifier = battery_modifier - 1
  if speed_value < 0 then speed_value = 0 end
  if battery_modifier < 0 then battery_modifier = 0 end

  event.force.worker_robots_speed_modifier = speed_value
  event.force.worker_robots_battery_modifier = battery_modifier
end)
