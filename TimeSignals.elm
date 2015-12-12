
module TimeSignals where





import Graphics.Element exposing (down, flow, leftAligned)
import List exposing (map)

import Mouse

import Signal exposing (map, map2)
import Text exposing (fromString)
import Time exposing (delay, every, fps, fpsWhen, second, since, timestamp)




showsignals a b c d e f =

    flow down <|
    
        List.map (fromString >> leftAligned) [
                    "every (5*second): " ++ toString a,
                    "since (2*second) Mouse.clicks: " ++ toString b,
                    "timestamp Mouse.isDown: " ++ toString c,
                    "delay second Mouse.position: " ++ toString d,
                    "fps 200:" ++ toString e,
                    "fpsWhen 200 Mouse.isDown: " ++ toString f
                ]
                


andMap : Signal(a -> b) -> Signal a -> Signal b
andMap = map2 (\a x -> a x)


main = Signal.map showsignals 
           <| every (5*second)
           <| andMap since (2*second) Mouse.clicks
           <| andMap timestamp Mouse.isDown
           <| andMap (delay second) Mouse.position andMap fps 200 andMap (fpsWhen 200) Mouse.isDown
           