--@param msg string The log message
--@param level string The log level
local function notify(msg, level)
  level = level or vim.log.levels.INFO
  vim.notify(msg, level, {
    title = "mason-autoinstall.nvim",
  })
end

return notify
