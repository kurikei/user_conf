hs.hotkey.bind({'cmd', 'ctrl'}, "a", function()
  hs.application.launchOrFocus("Astro")
end)

hs.hotkey.bind({'cmd', 'ctrl'}, "d", function()
  hs.application.launchOrFocus("Dash")
end)

hs.hotkey.bind({'cmd', 'ctrl'}, "e", function()
  hs.application.launchOrFocus("Evernote")
end)

hs.hotkey.bind({'cmd', 'ctrl'}, "f", function()
  hs.application.launchOrFocus("Firefox")
end)

hs.hotkey.bind({'cmd', 'ctrl'}, "g", function()
  hs.application.launchOrFocus("Goland")
end)

hs.hotkey.bind({'cmd', 'ctrl'}, "k", function()
  hs.application.launchOrFocus("Kindle")
end)

hs.hotkey.bind({'cmd', 'ctrl'}, "i", function()
  hs.application.launchOrFocus("iTerm")
end)

hs.hotkey.bind({'cmd', 'ctrl'}, "o", function()
  hs.application.launchOrFocus("1Password 6")
end)

hs.hotkey.bind({'cmd', 'ctrl'}, "p", function()
  hs.application.launchOrFocus("Postman")
end)

hs.hotkey.bind({'cmd', 'ctrl'}, "r", function()
  hs.application.launchOrFocus("Reeder")
end)

hs.hotkey.bind({'cmd', 'ctrl'}, "s", function()
  hs.application.launchOrFocus("Slack")
end)

hs.hotkey.bind({'cmd', 'ctrl'}, "t", function()
  hs.application.launchOrFocus("Todoist")
end)

hs.hotkey.bind({'cmd', 'ctrl'}, "x", function()
  hs.application.launchOrFocus("Xcode")
end)

hs.hotkey.bind({'cmd', 'ctrl'}, ",", function()
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
