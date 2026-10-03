data:extend({
  {
    type = "double-setting",
    name = "fast-worker-robot-speed",
    setting_type = "runtime-global",
    default_value = 2.0,
    minimum_value = 0.05,
    maximum_value = 1000.0,
    order = "a[robot]-a[speed]"
  },
  {
    type = "double-setting",
    name = "worker-robot-battery-modifier",
    setting_type = "runtime-global",
    default_value = 4.0,
    minimum_value = 0.0,
    maximum_value = 100.0,
    order = "a[robot]-b[battery]"
  },
  {
    type = "int-setting",
    name = "roboport-charging-spots-count",
    setting_type = "startup",
    default_value = 16,
    minimum_value = 1,
    maximum_value = 64,
    order = "b[roboport]-a[count]"
  },
  {
    type = "double-setting",
    name = "roboport-charging-spots-radius",
    setting_type = "startup",
    default_value = 1.5,
    minimum_value = 0.5,
    maximum_value = 10.0,
    order = "b[roboport]-b[radius]"
  }
})
