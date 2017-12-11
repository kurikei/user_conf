-- Auto reload Hammerspoon config
-- https://github.com/raulchen/dotfiles/tree/master/hammerspoon

local module = {}

module.reload = function()
  module.configFileWatcher:stop()
  hs.reload()
end

module.configFileWatcher = hs.pathwatcher.new(
    os.getenv("HOME") .. "/.hammerspoon/",
    module.reload
)
module.configFileWatcher:start()

return module
