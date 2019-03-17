import XMonad
import XMonad.Hooks.DynamicLog
 
-- =<< xmobar
-- xmobar の機能を有効にする
--
main = xmonad =<< xmobar defaultConfig
        -- Use Alt(mod1Mask) or Super(mod4Mask)
        { modMask = mod1Mask -- Use Super instead of Alt

        -- 何かよくわからないのでコメントアウト
        -- , terminal = "urxvt"

        -- more changes
        }
