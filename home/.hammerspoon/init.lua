hs.hotkey.bind({"control"}, "a", function()
  hs.application.launchOrFocus("Astro")
end)

hs.hotkey.bind({"control"}, "d", function()
  hs.application.launchOrFocus("Dash")
end)

hs.hotkey.bind({"control"}, "e", function()
  hs.application.launchOrFocus("Evernote")
end)

hs.hotkey.bind({"control"}, "f", function()
  hs.application.launchOrFocus("Firefox")
end)

hs.hotkey.bind({"control"}, "g", function()
  hs.application.launchOrFocus("Goland")
end)

hs.hotkey.bind({"control"}, "k", function()
  hs.application.launchOrFocus("Kindle")
end)

hs.hotkey.bind({"control"}, "i", function()
  hs.application.launchOrFocus("iTerm")
end)

hs.hotkey.bind({"control"}, "o", function()
  hs.application.launchOrFocus("1Password 6")
end)

hs.hotkey.bind({"control"}, "p", function()
  hs.application.launchOrFocus("Postman")
end)

hs.hotkey.bind({"control"}, "s", function()
  hs.application.launchOrFocus("Slack")
end)

hs.hotkey.bind({"control"}, "t", function()
  hs.application.launchOrFocus("Things")
end)

hs.hotkey.bind({"control"}, "x", function()
  hs.application.launchOrFocus("Xcode")
end)

hs.hotkey.bind({"control"}, ",", function()
  hs.application.launchOrFocus("Google Chrome")
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
