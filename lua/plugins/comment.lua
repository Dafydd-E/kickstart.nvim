-- Enable Comment.nvim
local ok, comment = pcall(require, 'Comment')
if not ok then
  return
end

comment.setup()

-- gcc to toggle comment line
