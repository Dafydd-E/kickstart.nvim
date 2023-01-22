local leap_setup, leap = pcall(require, 'leap')
if not leap_setup then
  return
end

leap.add_default_mappings()
