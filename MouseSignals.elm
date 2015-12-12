module MouseSignals where


import Mouse
import Signal exposing (map)
import Graphics.Element exposing (show)


main = show <~ Mouse.x
