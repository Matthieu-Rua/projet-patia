(define (problem p003)
    (:domain taquin)
    (:objects 
        tile1 tile2 tile3 tile4 tile5 tile6 tile7 tile8 - tile
        pos1 pos2 pos3 pos4 pos5 pos6 pos7 pos8 pos9 - position
    )
    (:init 
        (empty pos1) (at tile2 pos2) (at tile5 pos3) (at tile3 pos4) (at tile4 pos5) (at tile1 pos6) (at tile6 pos7) (at tile7 pos8) (at tile8 pos9)
        (adjacent pos1 pos2) (adjacent pos2 pos1) (adjacent pos1 pos4) (adjacent pos4 pos1) (adjacent pos2 pos3) (adjacent pos3 pos2) (adjacent pos2 pos5) (adjacent pos5 pos2) (adjacent pos3 pos6) (adjacent pos6 pos3) (adjacent pos4 pos5) (adjacent pos5 pos4) (adjacent pos4 pos7) (adjacent pos7 pos4) (adjacent pos5 pos6) (adjacent pos6 pos5) (adjacent pos5 pos8) (adjacent pos8 pos5) (adjacent pos6 pos9) (adjacent pos9 pos6) (adjacent pos7 pos8) (adjacent pos8 pos7) (adjacent pos8 pos9) (adjacent pos9 pos8)
    )
    (:goal (and 
        (at tile1 pos2) (at tile2 pos3) (at tile3 pos4) (at tile4 pos5) (at tile5 pos6) (at tile6 pos7) (at tile7 pos8) (at tile8 pos9) (empty pos1)
    ))
)