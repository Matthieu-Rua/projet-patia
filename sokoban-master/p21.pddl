(define (problem sokoban-test)
  (:domain sokoban)
  (:objects
    player1 - player
    box_2_4 - box
    box_4_4 - box
    box_3_5 - box
    box_4_5 - box
    box_2_6 - box
    pos_0_0 - location
    pos_1_0 - location
    pos_0_1 - location
    pos_4_2 - location
    pos_3_3 - location
    pos_2_4 - location
    pos_1_5 - location
    pos_4_3 - location
    pos_3_4 - location
    pos_1_6 - location
    pos_4_4 - location
    pos_3_5 - location
    pos_2_6 - location
    pos_0_8 - location
    pos_4_5 - location
    pos_3_6 - location
    pos_1_8 - location
    pos_1_1 - location
    pos_0_2 - location
    pos_3_1 - location
    pos_4_1 - location
    pos_3_2 - location
    pos_2_3 - location
    pos_1_4 - location
    pos_7_7 - location
    pos_5_5 - location
    pos_4_6 - location
    pos_2_8 - location
    pos_5_6 - location
    pos_4_7 - location
    pos_6_6 - location
    pos_5_7 - location
    pos_7_6 - location
    pos_6_7 - location
  )
  (:init
(clear pos_0_0)
(clear pos_1_0)
(clear pos_0_1)
(clear pos_1_1)
(clear pos_3_1)
(clear pos_4_1)
(clear pos_0_2)
(clear pos_3_2)
(clear pos_4_2)
(clear pos_2_3)
(clear pos_3_3)
(clear pos_4_3)
(goal pos_4_3)
(clear pos_1_4)
(box-at box_2_4 pos_2_4)
(goal pos_2_4)
(clear pos_3_4)
(box-at box_4_4 pos_4_4)
(goal pos_4_4)
(at player1 pos_1_5)
(box-at box_3_5 pos_3_5)
(box-at box_4_5 pos_4_5)
(goal pos_4_5)
(clear pos_5_5)
(clear pos_1_6)
(box-at box_2_6 pos_2_6)
(goal pos_2_6)
(clear pos_3_6)
(clear pos_4_6)
(clear pos_5_6)
(clear pos_6_6)
(clear pos_7_6)
(clear pos_4_7)
(clear pos_5_7)
(clear pos_6_7)
(clear pos_7_7)
(clear pos_0_8)
(clear pos_1_8)
(clear pos_2_8)
    (adjacent pos_7_7 pos_7_6)
    (adjacent pos_3_3 pos_3_2)
    (adjacent pos_4_3 pos_4_2)
    (adjacent pos_1_1 pos_1_0)
    (adjacent pos_3_3 pos_4_3)
    (adjacent pos_2_8 pos_1_8)
    (adjacent pos_3_2 pos_4_2)
    (adjacent pos_0_0 pos_1_0)
    (adjacent pos_4_4 pos_4_3)
    (adjacent pos_3_2 pos_3_1)
    (adjacent pos_4_5 pos_4_4)
    (adjacent pos_4_5 pos_5_5)
    (adjacent pos_2_3 pos_3_3)
    (adjacent pos_1_8 pos_0_8)
    (adjacent pos_3_4 pos_4_4)
    (adjacent pos_4_6 pos_4_5)
    (adjacent pos_3_4 pos_3_3)
    (adjacent pos_3_5 pos_3_6)
    (adjacent pos_4_6 pos_5_6)
    (adjacent pos_5_7 pos_6_7)
    (adjacent pos_5_7 pos_5_6)
    (adjacent pos_3_6 pos_2_6)
    (adjacent pos_0_8 pos_1_8)
    (adjacent pos_2_4 pos_1_4)
    (adjacent pos_6_7 pos_6_6)
    (adjacent pos_5_6 pos_5_5)
    (adjacent pos_5_6 pos_6_6)
    (adjacent pos_6_7 pos_7_7)
    (adjacent pos_0_1 pos_0_2)
    (adjacent pos_3_1 pos_4_1)
    (adjacent pos_1_4 pos_1_5)
    (adjacent pos_1_5 pos_1_6)
    (adjacent pos_6_6 pos_7_6)
    (adjacent pos_2_6 pos_1_6)
    (adjacent pos_4_2 pos_4_1)
    (adjacent pos_1_6 pos_1_5)
    (adjacent pos_1_6 pos_2_6)
    (adjacent pos_4_3 pos_4_4)
    (adjacent pos_7_7 pos_6_7)
    (adjacent pos_5_5 pos_4_5)
    (adjacent pos_3_3 pos_2_3)
    (adjacent pos_4_3 pos_3_3)
    (adjacent pos_1_1 pos_0_1)
    (adjacent pos_3_3 pos_3_4)
    (adjacent pos_4_4 pos_4_5)
    (adjacent pos_7_6 pos_6_6)
    (adjacent pos_7_6 pos_7_7)
    (adjacent pos_3_2 pos_3_3)
    (adjacent pos_4_4 pos_3_4)
    (adjacent pos_0_0 pos_0_1)
    (adjacent pos_3_4 pos_2_4)
    (adjacent pos_4_5 pos_3_5)
    (adjacent pos_4_5 pos_4_6)
    (adjacent pos_2_3 pos_2_4)
    (adjacent pos_4_7 pos_4_6)
    (adjacent pos_4_7 pos_5_7)
    (adjacent pos_1_8 pos_2_8)
    (adjacent pos_3_4 pos_3_5)
    (adjacent pos_4_6 pos_3_6)
    (adjacent pos_1_0 pos_1_1)
    (adjacent pos_1_0 pos_0_0)
    (adjacent pos_2_4 pos_3_4)
    (adjacent pos_3_5 pos_4_5)
    (adjacent pos_4_6 pos_4_7)
    (adjacent pos_5_7 pos_4_7)
    (adjacent pos_4_1 pos_4_2)
    (adjacent pos_3_5 pos_3_4)
    (adjacent pos_4_1 pos_3_1)
    (adjacent pos_3_6 pos_3_5)
    (adjacent pos_3_6 pos_4_6)
    (adjacent pos_2_4 pos_2_3)
    (adjacent pos_5_6 pos_4_6)
    (adjacent pos_6_7 pos_5_7)
    (adjacent pos_3_1 pos_3_2)
    (adjacent pos_4_2 pos_4_3)
    (adjacent pos_5_6 pos_5_7)
    (adjacent pos_0_1 pos_1_1)
    (adjacent pos_1_5 pos_1_4)
    (adjacent pos_0_1 pos_0_0)
    (adjacent pos_5_5 pos_5_6)
    (adjacent pos_2_6 pos_3_6)
    (adjacent pos_6_6 pos_6_7)
    (adjacent pos_1_4 pos_2_4)
    (adjacent pos_6_6 pos_5_6)
    (adjacent pos_0_2 pos_0_1)
    (adjacent pos_4_2 pos_3_2)
    (direction pos_0_2 pos_0_1 north)
    (direction pos_4_3 pos_4_4 south)
    (direction pos_4_7 pos_4_6 north)
    (direction pos_7_7 pos_6_7 west)
    (direction pos_1_0 pos_1_1 south)
    (direction pos_4_6 pos_5_6 east)
    (direction pos_7_6 pos_7_7 south)
    (direction pos_4_4 pos_3_4 west)
    (direction pos_5_5 pos_5_6 south)
    (direction pos_1_5 pos_1_6 south)
    (direction pos_3_5 pos_3_4 north)
    (direction pos_4_6 pos_3_6 west)
    (direction pos_3_1 pos_3_2 south)
    (direction pos_2_3 pos_3_3 east)
    (direction pos_1_6 pos_1_5 north)
    (direction pos_3_6 pos_2_6 west)
    (direction pos_0_0 pos_0_1 south)
    (direction pos_1_1 pos_1_0 north)
    (direction pos_3_4 pos_2_4 west)
    (direction pos_4_2 pos_4_1 north)
    (direction pos_3_1 pos_4_1 east)
    (direction pos_3_3 pos_4_3 east)
    (direction pos_5_5 pos_4_5 west)
    (direction pos_5_7 pos_4_7 west)
    (direction pos_0_1 pos_0_2 south)
    (direction pos_3_6 pos_4_6 east)
    (direction pos_2_6 pos_1_6 west)
    (direction pos_4_6 pos_4_7 south)
    (direction pos_6_7 pos_7_7 east)
    (direction pos_4_3 pos_4_2 north)
    (direction pos_3_4 pos_3_5 south)
    (direction pos_3_6 pos_3_5 north)
    (direction pos_4_1 pos_4_2 south)
    (direction pos_2_4 pos_1_4 west)
    (direction pos_5_7 pos_5_6 north)
    (direction pos_2_4 pos_2_3 north)
    (direction pos_1_8 pos_0_8 west)
    (direction pos_4_5 pos_4_4 north)
    (direction pos_2_6 pos_3_6 east)
    (direction pos_6_7 pos_5_7 west)
    (direction pos_4_4 pos_4_5 south)
    (direction pos_3_2 pos_3_3 south)
    (direction pos_3_3 pos_3_2 north)
    (direction pos_6_7 pos_6_6 north)
    (direction pos_5_7 pos_6_7 east)
    (direction pos_1_6 pos_2_6 east)
    (direction pos_4_1 pos_3_1 west)
    (direction pos_1_4 pos_2_4 east)
    (direction pos_0_0 pos_1_0 east)
    (direction pos_2_8 pos_1_8 west)
    (direction pos_5_6 pos_5_7 south)
    (direction pos_3_4 pos_3_3 north)
    (direction pos_1_8 pos_2_8 east)
    (direction pos_1_5 pos_1_4 north)
    (direction pos_7_6 pos_6_6 west)
    (direction pos_0_1 pos_0_0 north)
    (direction pos_4_5 pos_3_5 west)
    (direction pos_4_3 pos_3_3 west)
    (direction pos_1_0 pos_0_0 west)
    (direction pos_4_5 pos_5_5 east)
    (direction pos_2_4 pos_3_4 east)
    (direction pos_4_7 pos_5_7 east)
    (direction pos_6_6 pos_6_7 south)
    (direction pos_4_2 pos_4_3 south)
    (direction pos_0_8 pos_1_8 east)
    (direction pos_3_3 pos_2_3 west)
    (direction pos_3_5 pos_3_6 south)
    (direction pos_4_6 pos_4_5 north)
    (direction pos_2_3 pos_2_4 south)
    (direction pos_7_7 pos_7_6 north)
    (direction pos_3_5 pos_4_5 east)
    (direction pos_3_2 pos_4_2 east)
    (direction pos_3_3 pos_3_4 south)
    (direction pos_3_4 pos_4_4 east)
    (direction pos_6_6 pos_7_6 east)
    (direction pos_5_6 pos_4_6 west)
    (direction pos_1_4 pos_1_5 south)
    (direction pos_4_5 pos_4_6 south)
    (direction pos_1_1 pos_0_1 west)
    (direction pos_3_2 pos_3_1 north)
    (direction pos_6_6 pos_5_6 west)
    (direction pos_4_2 pos_3_2 west)
    (direction pos_5_6 pos_6_6 east)
    (direction pos_0_1 pos_1_1 east)
    (direction pos_4_4 pos_4_3 north)
    (direction pos_5_6 pos_5_5 north)
  )
  (:goal
    (and
      (box-on-goal box_2_4)
      (box-on-goal box_4_4)
      (box-on-goal box_3_5)
      (box-on-goal box_4_5)
      (box-on-goal box_2_6)
    )
  )
)
