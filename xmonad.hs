import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Gaps
import XMonad.Util.EZConfig

main = do
  xmonad $ defaultConfig
    {
      handleEventHook = fullscreenEventHook,
      terminal = "urxvt",
      normalBorderColor = "#282a2e",
      focusedBorderColor = "#de935f",
      layoutHook = onWorkspace "9" screencast $
                   layout
    } `additionalKeysP`
    [
      ("M-S-p", spawn "dwb")
    ]

-- for screen casts, to get native 16:9 aspect ratio
-- the following gives me 1600 X 900 on my current desktop
screencast = gaps [(R, 40), (L, 40), (D, 75), (U, 75)]$ layout

layout = smartBorders(tiled ||| Mirror tiled ||| Full)
  where
    tiled   = Tall nmaster delta ratio
    nmaster = 1     -- number of windows
    ratio   = 1/2   -- default 
    delta   = 3/100 -- adjust by
