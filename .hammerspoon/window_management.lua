-- Window Management

----------------------- Move Windows ---------------------------------

hs.hotkey.bind({"cmd", "alt"}, "N", function()
  hs.window.switcher:next()
end)

-- focus window to full screen
hs.hotkey.bind({"cmd", "alt"}, "F", function()
  local win = hs.window.focusedWindow()
  win:maximize()
end)

-- focus window to center of the screen
hs.hotkey.bind({"cmd", "alt"}, "C", function()
  --hs.alert.show("Center")
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + max.w * 0.1
  f.y = max.h * 0.1
  f.w = max.w * 0.8
  f.h = max.h * 0.8
  win:setFrame(f)
end)

-- focus window to the left half
hs.hotkey.bind({"cmd", "alt"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w * 0.5
  f.h = max.h
  win:setFrame(f)
end)

-- focus window to the bottom half
hs.hotkey.bind({"cmd", "alt"}, "J", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y + max.h * 0.5
  f.w = max.w
  f.h = max.h * 0.5
  win:setFrame(f)
end)

-- focus window to the top half
hs.hotkey.bind({"cmd", "alt"}, "K", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h * 0.5
  win:setFrame(f)
end)

-- focus window to the right half
hs.hotkey.bind({"cmd", "alt"}, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + max.w * 0.5
  f.y = max.y
  f.w = max.w * 0.5
  f.h = max.h
  win:setFrame(f)
end)

----------------------- Moving Windows ---------------------------------
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  win:moveOneScreenWest()
  win:maximize()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
  local win = hs.window.focusedWindow()
  win:moveOneScreenEast()
  win:maximize()
end)

----------------------- Risize Windows ---------------------------------

-- ctrl:shift:hjkl
hs.hotkey.bind({"ctrl", "shift"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.w = f.w - max.w * 0.1
  win:setFrame(f)
end)

hs.hotkey.bind({"ctrl", "shift"}, "J", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.h = f.h - max.h * 0.1
  win:setFrame(f)
end)

hs.hotkey.bind({"ctrl", "shift"}, "K", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.h = f.h + max.h * 0.1
  win:setFrame(f)
end)

hs.hotkey.bind({"ctrl", "shift"}, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.w = f.w + max.w * 0.1
  win:setFrame(f)
end)
