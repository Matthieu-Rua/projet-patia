(define (problem sokoban-test)
  (:domain sokoban)
  (:objects
    player1 - player
    box_2_3 - box
    box_2_4 - box
    box_4_4 - box
    pos_6_4 - location
    pos_0_0 - location
    pos_0_1 - location
    pos_4_2 - location
    pos_3_3 - location
    pos_2_4 - location
    pos_1_5 - location
    pos_5_2 - location
    pos_4_3 - location
    pos_3_4 - location
    pos_2_5 - location
    pos_5_3 - location
    pos_4_4 - location
    pos_3_5 - location
    pos_6_3 - location
    pos_5_4 - location
    pos_0_2 - location
    pos_2_1 - location
    pos_3_1 - location
    pos_2_2 - location
    pos_4_1 - location
    pos_2_3 - location
    pos_1_4 - location
  )
  (:init
(clear pos_0_0)
(clear pos_0_1)
(clear pos_2_1)
(clear pos_3_1)
(clear pos_4_1)
(clear pos_0_2)
(clear pos_2_2)
(clear pos_4_2)
(clear pos_5_2)
(goal pos_5_2)
(box-at box_2_3 pos_2_3)
(clear pos_3_3)
(clear pos_4_3)
(goal pos_4_3)
(clear pos_5_3)
(clear pos_6_3)
(at player1 pos_1_4)
(box-at box_2_4 pos_2_4)
(clear pos_3_4)
(goal pos_3_4)
(box-at box_4_4 pos_4_4)
(clear pos_5_4)
(clear pos_6_4)
(clear pos_1_5)
(clear pos_2_5)
(clear pos_3_5)
    (adjacent pos_4_3 pos_5_3)
    (adjacent pos_2_1 pos_3_1)
    (adjacent pos_4_3 pos_4_2)
    (adjacent pos_4_4 pos_5_4)
    (adjacent pos_3_3 pos_4_3)
    (adjacent pos_4_4 pos_4_3)
    (adjacent pos_2_3 pos_3_3)
    (adjacent pos_2_3 pos_2_2)
    (adjacent pos_3_4 pos_4_4)
    (adjacent pos_3_4 pos_3_3)
    (adjacent pos_2_2 pos_2_1)
    (adjacent pos_2_4 pos_2_5)
    (adjacent pos_3_5 pos_2_5)
    (adjacent pos_2_5 pos_1_5)
    (adjacent pos_2_4 pos_1_4)
    (adjacent pos_6_4 pos_6_3)
    (adjacent pos_4_2 pos_5_2)
    (adjacent pos_5_3 pos_6_3)
    (adjacent pos_0_1 pos_0_2)
    (adjacent pos_3_1 pos_4_1)
    (adjacent pos_5_3 pos_5_2)
    (adjacent pos_1_4 pos_1_5)
    (adjacent pos_5_4 pos_6_4)
    (adjacent pos_5_4 pos_5_3)
    (adjacent pos_4_2 pos_4_1)
    (adjacent pos_4_3 pos_4_4)
    (adjacent pos_2_1 pos_2_2)
    (adjacent pos_3_3 pos_2_3)
    (adjacent pos_4_3 pos_3_3)
    (adjacent pos_3_3 pos_3_4)
    (adjacent pos_4_4 pos_3_4)
    (adjacent pos_0_0 pos_0_1)
    (adjacent pos_3_4 pos_2_4)
    (adjacent pos_2_3 pos_2_4)
    (adjacent pos_2_2 pos_2_3)
    (adjacent pos_3_4 pos_3_5)
    (adjacent pos_2_4 pos_3_4)
    (adjacent pos_6_3 pos_6_4)
    (adjacent pos_4_1 pos_4_2)
    (adjacent pos_3_5 pos_3_4)
    (adjacent pos_6_3 pos_5_3)
    (adjacent pos_4_1 pos_3_1)
    (adjacent pos_2_5 pos_2_4)
    (adjacent pos_2_5 pos_3_5)
    (adjacent pos_5_2 pos_5_3)
    (adjacent pos_2_4 pos_2_3)
    (adjacent pos_6_4 pos_5_4)
    (adjacent pos_5_2 pos_4_2)
    (adjacent pos_5_3 pos_5_4)
    (adjacent pos_4_2 pos_4_3)
    (adjacent pos_1_5 pos_1_4)
    (adjacent pos_5_3 pos_4_3)
    (adjacent pos_0_1 pos_0_0)
    (adjacent pos_3_1 pos_2_1)
    (adjacent pos_5_4 pos_4_4)
    (adjacent pos_1_5 pos_2_5)
    (adjacent pos_1_4 pos_2_4)
    (adjacent pos_0_2 pos_0_1)
    (direction pos_0_2 pos_0_1 north)
    (direction pos_4_3 pos_4_4 south)
    (direction pos_2_4 pos_2_5 south)
    (direction pos_4_4 pos_5_4 east)
    (direction pos_4_4 pos_3_4 west)
    (direction pos_2_2 pos_2_3 south)
    (direction pos_2_5 pos_3_5 east)
    (direction pos_6_3 pos_5_3 west)
    (direction pos_3_5 pos_3_4 north)
    (direction pos_2_3 pos_3_3 east)
    (direction pos_0_0 pos_0_1 south)
    (direction pos_5_4 pos_5_3 north)
    (direction pos_2_1 pos_3_1 east)
    (direction pos_2_3 pos_2_2 north)
    (direction pos_3_4 pos_2_4 west)
    (direction pos_4_2 pos_4_1 north)
    (direction pos_3_1 pos_4_1 east)
    (direction pos_3_3 pos_4_3 east)
    (direction pos_0_1 pos_0_2 south)
    (direction pos_5_3 pos_4_3 west)
    (direction pos_4_3 pos_4_2 north)
    (direction pos_6_4 pos_6_3 north)
    (direction pos_3_4 pos_3_5 south)
    (direction pos_4_1 pos_4_2 south)
    (direction pos_5_3 pos_5_4 south)
    (direction pos_2_4 pos_1_4 west)
    (direction pos_2_4 pos_2_3 north)
    (direction pos_4_3 pos_5_3 east)
    (direction pos_5_3 pos_6_3 east)
    (direction pos_6_3 pos_6_4 south)
    (direction pos_4_1 pos_3_1 west)
    (direction pos_1_4 pos_2_4 east)
    (direction pos_3_4 pos_3_3 north)
    (direction pos_1_5 pos_1_4 north)
    (direction pos_0_1 pos_0_0 north)
    (direction pos_2_2 pos_2_1 north)
    (direction pos_5_3 pos_5_2 north)
    (direction pos_3_1 pos_2_1 west)
    (direction pos_4_3 pos_3_3 west)
    (direction pos_6_4 pos_5_4 west)
    (direction pos_2_4 pos_3_4 east)
    (direction pos_4_2 pos_4_3 south)
    (direction pos_3_3 pos_2_3 west)
    (direction pos_3_5 pos_2_5 west)
    (direction pos_2_3 pos_2_4 south)
    (direction pos_3_3 pos_3_4 south)
    (direction pos_3_4 pos_4_4 east)
    (direction pos_5_2 pos_4_2 west)
    (direction pos_1_4 pos_1_5 south)
    (direction pos_2_5 pos_1_5 west)
    (direction pos_4_2 pos_5_2 east)
    (direction pos_2_5 pos_2_4 north)
    (direction pos_5_4 pos_6_4 east)
    (direction pos_5_2 pos_5_3 south)
    (direction pos_4_4 pos_4_3 north)
    (direction pos_2_1 pos_2_2 south)
    (direction pos_1_5 pos_2_5 east)
    (direction pos_5_4 pos_4_4 west)
  )
  (:goal
    (and
      (box-on-goal box_2_3)
      (box-on-goal box_2_4)
      (box-on-goal box_4_4)
    )
  )
)
