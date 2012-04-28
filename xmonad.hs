import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.NoBorders

main = do
	xmonad $ defaultConfig
          { handleEventHook = fullscreenEventHook
          , normalBorderColor = "#073642"
          , focusedBorderColor = "#cb4b16"
          , layoutHook = layout
          }

layout = tiled ||| Mirror tiled ||| noBorders(Full)
  where
     tiled   = Tall nmaster delta ratio
     nmaster = 1     -- number of windows
     ratio   = 1/2   -- default 
     delta   = 3/100 -- adjust by
