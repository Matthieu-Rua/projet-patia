(define (problem sokoban-test)
  (:domain sokoban)
  (:objects
    player1 - player
    box_2_2 - box
    box_3_2 - box
    box_2_5 - box
    pos_4_6 - location
    pos_0_0 - location
    pos_0_1 - location
    pos_3_3 - location
    pos_1_5 - location
    pos_4_3 - location
    pos_3_4 - location
    pos_2_5 - location
    pos_0_7 - location
    pos_5_3 - location
    pos_4_4 - location
    pos_3_5 - location
    pos_1_7 - location
    pos_5_4 - location
    pos_4_5 - location
    pos_3_6 - location
    pos_2_1 - location
    pos_3_1 - location
    pos_2_2 - location
    pos_1_3 - location
    pos_3_2 - location
    pos_2_3 - location
    pos_1_4 - location
  )
  (:init
(clear pos_0_0)
(clear pos_0_1)
(clear pos_2_1)
(at player1 pos_3_1)
(box-at box_2_2 pos_2_2)
(box-at box_3_2 pos_3_2)
(goal pos_3_2)
(clear pos_1_3)
(clear pos_2_3)
(clear pos_3_3)
(goal pos_3_3)
(clear pos_4_3)
(clear pos_5_3)
(clear pos_1_4)
(clear pos_3_4)
(goal pos_3_4)
(clear pos_4_4)
(clear pos_5_4)
(clear pos_1_5)
(box-at box_2_5 pos_2_5)
(clear pos_3_5)
(clear pos_4_5)
(clear pos_3_6)
(clear pos_4_6)
(clear pos_0_7)
(clear pos_1_7)
    (adjacent pos_4_3 pos_5_3)
    (adjacent pos_2_1 pos_3_1)
    (adjacent pos_3_3 pos_3_2)
    (adjacent pos_4_4 pos_5_4)
    (adjacent pos_3_3 pos_4_3)
    (adjacent pos_1_7 pos_0_7)
    (adjacent pos_4_4 pos_4_3)
    (adjacent pos_3_2 pos_3_1)
    (adjacent pos_4_5 pos_4_4)
    (adjacent pos_2_3 pos_3_3)
    (adjacent pos_2_3 pos_2_2)
    (adjacent pos_2_2 pos_3_2)
    (adjacent pos_3_4 pos_4_4)
    (adjacent pos_4_6 pos_4_5)
    (adjacent pos_3_4 pos_3_3)
    (adjacent pos_2_2 pos_2_1)
    (adjacent pos_1_3 pos_1_4)
    (adjacent pos_3_5 pos_3_6)
    (adjacent pos_3_5 pos_2_5)
    (adjacent pos_2_5 pos_1_5)
    (adjacent pos_1_4 pos_1_5)
    (adjacent pos_5_4 pos_5_3)
    (adjacent pos_4_3 pos_4_4)
    (adjacent pos_2_1 pos_2_2)
    (adjacent pos_3_3 pos_2_3)
    (adjacent pos_4_3 pos_3_3)
    (adjacent pos_3_3 pos_3_4)
    (adjacent pos_4_4 pos_4_5)
    (adjacent pos_3_2 pos_3_3)
    (adjacent pos_4_4 pos_3_4)
    (adjacent pos_0_0 pos_0_1)
    (adjacent pos_3_2 pos_2_2)
    (adjacent pos_4_5 pos_3_5)
    (adjacent pos_4_5 pos_4_6)
    (adjacent pos_2_3 pos_1_3)
    (adjacent pos_2_2 pos_2_3)
    (adjacent pos_0_7 pos_1_7)
    (adjacent pos_3_4 pos_3_5)
    (adjacent pos_4_6 pos_3_6)
    (adjacent pos_1_3 pos_2_3)
    (adjacent pos_3_5 pos_4_5)
    (adjacent pos_3_5 pos_3_4)
    (adjacent pos_3_6 pos_3_5)
    (adjacent pos_2_5 pos_3_5)
    (adjacent pos_3_6 pos_4_6)
    (adjacent pos_5_3 pos_5_4)
    (adjacent pos_3_1 pos_3_2)
    (adjacent pos_1_5 pos_1_4)
    (adjacent pos_5_3 pos_4_3)
    (adjacent pos_0_1 pos_0_0)
    (adjacent pos_3_1 pos_2_1)
    (adjacent pos_1_4 pos_1_3)
    (adjacent pos_5_4 pos_4_4)
    (adjacent pos_1_5 pos_2_5)
    (direction pos_4_3 pos_4_4 south)
    (direction pos_1_4 pos_1_3 north)
    (direction pos_1_3 pos_2_3 east)
    (direction pos_4_4 pos_5_4 east)
    (direction pos_4_4 pos_3_4 west)
    (direction pos_2_2 pos_2_3 south)
    (direction pos_2_5 pos_3_5 east)
    (direction pos_3_5 pos_3_4 north)
    (direction pos_4_6 pos_3_6 west)
    (direction pos_3_1 pos_3_2 south)
    (direction pos_3_2 pos_2_2 west)
    (direction pos_2_3 pos_3_3 east)
    (direction pos_0_0 pos_0_1 south)
    (direction pos_5_4 pos_5_3 north)
    (direction pos_2_1 pos_3_1 east)
    (direction pos_2_3 pos_2_2 north)
    (direction pos_3_3 pos_4_3 east)
    (direction pos_5_3 pos_4_3 west)
    (direction pos_3_6 pos_4_6 east)
    (direction pos_1_3 pos_1_4 south)
    (direction pos_3_4 pos_3_5 south)
    (direction pos_3_6 pos_3_5 north)
    (direction pos_5_3 pos_5_4 south)
    (direction pos_4_5 pos_4_4 north)
    (direction pos_4_4 pos_4_5 south)
    (direction pos_3_2 pos_3_3 south)
    (direction pos_4_3 pos_5_3 east)
    (direction pos_3_3 pos_3_2 north)
    (direction pos_3_4 pos_3_3 north)
    (direction pos_1_5 pos_1_4 north)
    (direction pos_0_1 pos_0_0 north)
    (direction pos_2_2 pos_2_1 north)
    (direction pos_4_5 pos_3_5 west)
    (direction pos_3_1 pos_2_1 west)
    (direction pos_4_3 pos_3_3 west)
    (direction pos_2_2 pos_3_2 east)
    (direction pos_3_3 pos_2_3 west)
    (direction pos_3_5 pos_2_5 west)
    (direction pos_3_5 pos_3_6 south)
    (direction pos_4_6 pos_4_5 north)
    (direction pos_3_5 pos_4_5 east)
    (direction pos_3_3 pos_3_4 south)
    (direction pos_2_3 pos_1_3 west)
    (direction pos_3_4 pos_4_4 east)
    (direction pos_1_4 pos_1_5 south)
    (direction pos_4_5 pos_4_6 south)
    (direction pos_0_7 pos_1_7 east)
    (direction pos_2_5 pos_1_5 west)
    (direction pos_1_7 pos_0_7 west)
    (direction pos_3_2 pos_3_1 north)
    (direction pos_4_4 pos_4_3 north)
    (direction pos_2_1 pos_2_2 south)
    (direction pos_1_5 pos_2_5 east)
    (direction pos_5_4 pos_4_4 west)
  )
  (:goal
    (and
      (box-on-goal box_2_2)
      (box-on-goal box_3_2)
      (box-on-goal box_2_5)
    )
  )
)
