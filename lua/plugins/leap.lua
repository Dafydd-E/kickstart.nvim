local leap_setup, leap = pcall(require, 'leap')
if not leap_setup then
  return
end

-- overridden x as cut, use d instead
leap.add_default_mappings()
