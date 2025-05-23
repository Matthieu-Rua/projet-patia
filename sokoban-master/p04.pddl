(define (problem sokoban-test)
  (:domain sokoban)
  (:objects
    player1 - player
    box_4_2 - box
    box_3_4 - box
    box_4_4 - box
    pos_5_5 - location
    pos_0_0 - location
    pos_0_1 - location
    pos_4_2 - location
    pos_3_3 - location
    pos_2_4 - location
    pos_0_6 - location
    pos_4_3 - location
    pos_3_4 - location
    pos_1_6 - location
    pos_5_3 - location
    pos_4_4 - location
    pos_2_6 - location
    pos_5_4 - location
    pos_4_5 - location
    pos_2_1 - location
    pos_3_1 - location
    pos_2_2 - location
    pos_1_3 - location
    pos_4_1 - location
    pos_3_2 - location
    pos_2_3 - location
    pos_1_4 - location
  )
  (:init
(clear pos_0_0)
(clear pos_0_1)
(clear pos_2_1)
(clear pos_3_1)
(clear pos_4_1)
(clear pos_2_2)
(goal pos_2_2)
(clear pos_3_2)
(goal pos_3_2)
(box-at box_4_2 pos_4_2)
(clear pos_1_3)
(clear pos_2_3)
(clear pos_3_3)
(goal pos_3_3)
(clear pos_4_3)
(clear pos_5_3)
(clear pos_1_4)
(clear pos_2_4)
(box-at box_3_4 pos_3_4)
(box-at box_4_4 pos_4_4)
(clear pos_5_4)
(at player1 pos_4_5)
(clear pos_5_5)
(clear pos_0_6)
(clear pos_1_6)
(clear pos_2_6)
    (adjacent pos_1_6 pos_0_6)
    (adjacent pos_4_3 pos_5_3)
    (adjacent pos_5_5 pos_5_4)
    (adjacent pos_2_1 pos_3_1)
    (adjacent pos_3_3 pos_3_2)
    (adjacent pos_4_3 pos_4_2)
    (adjacent pos_4_4 pos_5_4)
    (adjacent pos_3_3 pos_4_3)
    (adjacent pos_3_2 pos_4_2)
    (adjacent pos_4_4 pos_4_3)
    (adjacent pos_3_2 pos_3_1)
    (adjacent pos_4_5 pos_4_4)
    (adjacent pos_4_5 pos_5_5)
    (adjacent pos_2_3 pos_3_3)
    (adjacent pos_2_3 pos_2_2)
    (adjacent pos_2_2 pos_3_2)
    (adjacent pos_3_4 pos_4_4)
    (adjacent pos_3_4 pos_3_3)
    (adjacent pos_2_2 pos_2_1)
    (adjacent pos_1_3 pos_1_4)
    (adjacent pos_2_4 pos_1_4)
    (adjacent pos_3_1 pos_4_1)
    (adjacent pos_2_6 pos_1_6)
    (adjacent pos_5_4 pos_5_3)
    (adjacent pos_4_2 pos_4_1)
    (adjacent pos_1_6 pos_2_6)
    (adjacent pos_4_3 pos_4_4)
    (adjacent pos_2_1 pos_2_2)
    (adjacent pos_5_5 pos_4_5)
    (adjacent pos_3_3 pos_2_3)
    (adjacent pos_4_3 pos_3_3)
    (adjacent pos_3_3 pos_3_4)
    (adjacent pos_4_4 pos_4_5)
    (adjacent pos_3_2 pos_3_3)
    (adjacent pos_4_4 pos_3_4)
    (adjacent pos_0_0 pos_0_1)
    (adjacent pos_3_2 pos_2_2)
    (adjacent pos_3_4 pos_2_4)
    (adjacent pos_0_6 pos_1_6)
    (adjacent pos_2_3 pos_2_4)
    (adjacent pos_2_3 pos_1_3)
    (adjacent pos_2_2 pos_2_3)
    (adjacent pos_1_3 pos_2_3)
    (adjacent pos_2_4 pos_3_4)
    (adjacent pos_4_1 pos_4_2)
    (adjacent pos_4_1 pos_3_1)
    (adjacent pos_2_4 pos_2_3)
    (adjacent pos_5_3 pos_5_4)
    (adjacent pos_3_1 pos_3_2)
    (adjacent pos_4_2 pos_4_3)
    (adjacent pos_5_3 pos_4_3)
    (adjacent pos_0_1 pos_0_0)
    (adjacent pos_3_1 pos_2_1)
    (adjacent pos_1_4 pos_1_3)
    (adjacent pos_5_4 pos_4_4)
    (adjacent pos_1_4 pos_2_4)
    (adjacent pos_5_4 pos_5_5)
    (adjacent pos_4_2 pos_3_2)
    (direction pos_4_3 pos_4_4 south)
    (direction pos_1_4 pos_1_3 north)
    (direction pos_1_3 pos_2_3 east)
    (direction pos_4_4 pos_5_4 east)
    (direction pos_4_4 pos_3_4 west)
    (direction pos_2_2 pos_2_3 south)
    (direction pos_3_1 pos_3_2 south)
    (direction pos_3_2 pos_2_2 west)
    (direction pos_2_3 pos_3_3 east)
    (direction pos_0_0 pos_0_1 south)
    (direction pos_5_4 pos_5_3 north)
    (direction pos_2_1 pos_3_1 east)
    (direction pos_2_3 pos_2_2 north)
    (direction pos_3_4 pos_2_4 west)
    (direction pos_4_2 pos_4_1 north)
    (direction pos_3_1 pos_4_1 east)
    (direction pos_3_3 pos_4_3 east)
    (direction pos_5_5 pos_4_5 west)
    (direction pos_5_3 pos_4_3 west)
    (direction pos_2_6 pos_1_6 west)
    (direction pos_1_3 pos_1_4 south)
    (direction pos_4_3 pos_4_2 north)
    (direction pos_0_6 pos_1_6 east)
    (direction pos_4_1 pos_4_2 south)
    (direction pos_5_3 pos_5_4 south)
    (direction pos_2_4 pos_1_4 west)
    (direction pos_2_4 pos_2_3 north)
    (direction pos_5_5 pos_5_4 north)
    (direction pos_1_6 pos_0_6 west)
    (direction pos_4_5 pos_4_4 north)
    (direction pos_4_4 pos_4_5 south)
    (direction pos_3_2 pos_3_3 south)
    (direction pos_4_3 pos_5_3 east)
    (direction pos_3_3 pos_3_2 north)
    (direction pos_1_6 pos_2_6 east)
    (direction pos_4_1 pos_3_1 west)
    (direction pos_1_4 pos_2_4 east)
    (direction pos_3_4 pos_3_3 north)
    (direction pos_0_1 pos_0_0 north)
    (direction pos_2_2 pos_2_1 north)
    (direction pos_3_1 pos_2_1 west)
    (direction pos_4_3 pos_3_3 west)
    (direction pos_4_5 pos_5_5 east)
    (direction pos_5_4 pos_5_5 south)
    (direction pos_2_4 pos_3_4 east)
    (direction pos_2_2 pos_3_2 east)
    (direction pos_4_2 pos_4_3 south)
    (direction pos_3_3 pos_2_3 west)
    (direction pos_2_3 pos_2_4 south)
    (direction pos_3_2 pos_4_2 east)
    (direction pos_3_3 pos_3_4 south)
    (direction pos_2_3 pos_1_3 west)
    (direction pos_3_4 pos_4_4 east)
    (direction pos_3_2 pos_3_1 north)
    (direction pos_4_2 pos_3_2 west)
    (direction pos_4_4 pos_4_3 north)
    (direction pos_2_1 pos_2_2 south)
    (direction pos_5_4 pos_4_4 west)
  )
  (:goal
    (and
      (box-on-goal box_4_2)
      (box-on-goal box_3_4)
      (box-on-goal box_4_4)
    )
  )
)
