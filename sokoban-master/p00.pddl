(define (problem sokoban-test)
  (:domain sokoban)
  (:objects
    player1 - player
    box_2_1 - box
    box_2_2 - box
    pos_3_3 - location
    pos_1_1 - location
    pos_2_1 - location
    pos_1_2 - location
    pos_3_1 - location
    pos_2_2 - location
    pos_1_3 - location
    pos_3_2 - location
    pos_2_3 - location
  )
  (:init
(at player1 pos_1_1)
(box-at box_2_1 pos_2_1)
(clear pos_3_1)
(goal pos_3_1)
(clear pos_1_2)
(box-at box_2_2 pos_2_2)
(clear pos_3_2)
(goal pos_3_2)
(clear pos_1_3)
(clear pos_2_3)
(clear pos_3_3)
    (adjacent pos_1_3 pos_2_3)
    (adjacent pos_2_1 pos_2_2)
    (adjacent pos_2_1 pos_3_1)
    (adjacent pos_1_3 pos_1_2)
    (adjacent pos_3_3 pos_3_2)
    (adjacent pos_3_3 pos_2_3)
    (adjacent pos_2_1 pos_1_1)
    (adjacent pos_1_2 pos_2_2)
    (adjacent pos_1_2 pos_1_3)
    (adjacent pos_3_2 pos_3_3)
    (adjacent pos_3_2 pos_2_2)
    (adjacent pos_1_2 pos_1_1)
    (adjacent pos_3_2 pos_3_1)
    (adjacent pos_3_1 pos_3_2)
    (adjacent pos_2_3 pos_3_3)
    (adjacent pos_1_1 pos_2_1)
    (adjacent pos_2_3 pos_2_2)
    (adjacent pos_2_3 pos_1_3)
    (adjacent pos_3_1 pos_2_1)
    (adjacent pos_1_1 pos_1_2)
    (adjacent pos_2_2 pos_3_2)
    (adjacent pos_2_2 pos_2_3)
    (adjacent pos_2_2 pos_1_2)
    (adjacent pos_2_2 pos_2_1)
    (direction pos_2_3 pos_1_3 west)
    (direction pos_2_1 pos_1_1 west)
    (direction pos_1_1 pos_1_2 south)
    (direction pos_2_2 pos_1_2 west)
    (direction pos_1_3 pos_2_3 east)
    (direction pos_1_1 pos_2_1 east)
    (direction pos_2_2 pos_2_1 north)
    (direction pos_1_2 pos_1_1 north)
    (direction pos_3_1 pos_2_1 west)
    (direction pos_1_2 pos_2_2 east)
    (direction pos_2_2 pos_2_3 south)
    (direction pos_1_3 pos_1_2 north)
    (direction pos_1_2 pos_1_3 south)
    (direction pos_2_2 pos_3_2 east)
    (direction pos_3_2 pos_3_3 south)
    (direction pos_3_2 pos_3_1 north)
    (direction pos_3_1 pos_3_2 south)
    (direction pos_3_2 pos_2_2 west)
    (direction pos_3_3 pos_3_2 north)
    (direction pos_2_3 pos_3_3 east)
    (direction pos_3_3 pos_2_3 west)
    (direction pos_2_1 pos_3_1 east)
    (direction pos_2_1 pos_2_2 south)
    (direction pos_2_3 pos_2_2 north)
  )
  (:goal
    (and
      (box-at box_2_1 pos_3_1)
      (box-at box_2_2 pos_3_2)
    )
  )
)
