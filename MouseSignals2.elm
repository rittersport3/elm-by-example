module MouseSignals2 where


import Graphics.Element exposing (Element, show)
import Mouse
import Signal exposing (map2, map)


combine : a -> b -> Element
combine a b = show (a,b)

combine2: a -> Element
combine2 a = show a

combine3: number -> number -> number
combine3 a b = a + b

main =  combine <~  Mouse.x ~ Mouse.y
