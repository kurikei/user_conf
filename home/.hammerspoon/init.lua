hs.hotkey.bind({"control"}, "i", function()
  hs.application.launchOrFocus("iTerm")
end)

hs.hotkey.bind({"control"}, ",", function()
  hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bind({"control"}, "s", function()
  hs.application.launchOrFocus("Slack")
end)

local function remapKey(mods, key, keyCode)
  hs.hotkey.bind(mods, key, keyCode, nil, keyCode)
end

local function keyCode(key, mods, callback)
  mods = mods or {}
  callback = callback or function() end
  return function()
    hs.eventtap.event.newKeyEvent(mods, string.lower(key), true):post()
    hs.timer.usleep(1000)
    hs.eventtap.event.newKeyEvent(mods, string.lower(key), false):post()
    callback()
  end
end

local function keyCodeSet(keys)
  return function()
    for i, keyEvent in ipairs(keys) do
      keyEvent()
    end
  end
end

remapKey({ 'ctrl' }, 'j',  keyCodeSet({
  keyCode('escape'),
}))

hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'r', function()
  hs.reload()
end)
hs.alert.show('Hammerspoon config loaded')
