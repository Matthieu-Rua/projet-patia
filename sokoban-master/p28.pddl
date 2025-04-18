(define (problem sokoban-test)
  (:domain sokoban)
  (:objects
    player1 - player
    box_5_4 - box
    box_6_4 - box
    box_2_5 - box
    box_4_5 - box
    box_5_5 - box
    pos_2_4 - location
    pos_1_5 - location
    pos_4_3 - location
    pos_3_4 - location
    pos_2_5 - location
    pos_1_6 - location
    pos_6_2 - location
    pos_5_3 - location
    pos_4_4 - location
    pos_3_5 - location
    pos_2_6 - location
    pos_1_7 - location
    pos_7_2 - location
    pos_6_3 - location
    pos_5_4 - location
    pos_4_5 - location
    pos_2_7 - location
    pos_1_1 - location
    pos_2_1 - location
    pos_1_2 - location
    pos_2_2 - location
    pos_1_3 - location
    pos_4_1 - location
    pos_2_3 - location
    pos_7_3 - location
    pos_6_4 - location
    pos_5_5 - location
    pos_4_6 - location
    pos_7_4 - location
    pos_6_5 - location
    pos_5_6 - location
    pos_4_7 - location
    pos_5_7 - location
  )
  (:init
(clear pos_1_1)
(clear pos_2_1)
(clear pos_4_1)
(clear pos_1_2)
(clear pos_2_2)
(clear pos_6_2)
(clear pos_7_2)
(clear pos_1_3)
(clear pos_2_3)
(clear pos_4_3)
(clear pos_5_3)
(clear pos_6_3)
(clear pos_7_3)
(clear pos_2_4)
(clear pos_3_4)
(clear pos_4_4)
(goal pos_4_4)
(box-at box_5_4 pos_5_4)
(goal pos_5_4)
(box-at box_6_4 pos_6_4)
(goal pos_6_4)
(clear pos_7_4)
(clear pos_1_5)
(box-at box_2_5 pos_2_5)
(clear pos_3_5)
(box-at box_4_5 pos_4_5)
(box-at box_5_5 pos_5_5)
(at player1 pos_6_5)
(clear pos_1_6)
(clear pos_2_6)
(clear pos_4_6)
(goal pos_4_6)
(clear pos_5_6)
(goal pos_5_6)
(clear pos_1_7)
(clear pos_2_7)
(clear pos_4_7)
(clear pos_5_7)
    (adjacent pos_1_6 pos_1_7)
    (adjacent pos_2_7 pos_1_7)
    (adjacent pos_4_3 pos_5_3)
    (adjacent pos_5_5 pos_5_4)
    (adjacent pos_4_4 pos_5_4)
    (adjacent pos_6_5 pos_6_4)
    (adjacent pos_7_2 pos_7_3)
    (adjacent pos_4_4 pos_4_3)
    (adjacent pos_7_2 pos_6_2)
    (adjacent pos_6_4 pos_7_4)
    (adjacent pos_4_5 pos_4_4)
    (adjacent pos_4_5 pos_5_5)
    (adjacent pos_1_1 pos_2_1)
    (adjacent pos_2_3 pos_2_2)
    (adjacent pos_7_3 pos_6_3)
    (adjacent pos_6_2 pos_6_3)
    (adjacent pos_3_4 pos_4_4)
    (adjacent pos_4_6 pos_4_5)
    (adjacent pos_7_4 pos_7_3)
    (adjacent pos_2_2 pos_2_1)
    (adjacent pos_2_4 pos_2_5)
    (adjacent pos_4_6 pos_5_6)
    (adjacent pos_5_7 pos_5_6)
    (adjacent pos_6_3 pos_7_3)
    (adjacent pos_3_5 pos_2_5)
    (adjacent pos_6_3 pos_6_2)
    (adjacent pos_2_5 pos_1_5)
    (adjacent pos_7_3 pos_7_4)
    (adjacent pos_2_5 pos_2_6)
    (adjacent pos_1_2 pos_1_3)
    (adjacent pos_6_4 pos_6_3)
    (adjacent pos_5_3 pos_6_3)
    (adjacent pos_5_6 pos_5_5)
    (adjacent pos_5_5 pos_6_5)
    (adjacent pos_2_6 pos_2_7)
    (adjacent pos_1_5 pos_1_6)
    (adjacent pos_5_4 pos_6_4)
    (adjacent pos_2_6 pos_1_6)
    (adjacent pos_5_4 pos_5_3)
    (adjacent pos_1_6 pos_1_5)
    (adjacent pos_2_7 pos_2_6)
    (adjacent pos_1_6 pos_2_6)
    (adjacent pos_4_3 pos_4_4)
    (adjacent pos_2_1 pos_2_2)
    (adjacent pos_5_5 pos_4_5)
    (adjacent pos_2_1 pos_1_1)
    (adjacent pos_4_4 pos_4_5)
    (adjacent pos_6_5 pos_5_5)
    (adjacent pos_4_4 pos_3_4)
    (adjacent pos_6_4 pos_6_5)
    (adjacent pos_3_4 pos_2_4)
    (adjacent pos_4_5 pos_3_5)
    (adjacent pos_1_7 pos_2_7)
    (adjacent pos_4_5 pos_4_6)
    (adjacent pos_2_3 pos_2_4)
    (adjacent pos_1_7 pos_1_6)
    (adjacent pos_2_3 pos_1_3)
    (adjacent pos_7_3 pos_7_2)
    (adjacent pos_4_7 pos_4_6)
    (adjacent pos_1_1 pos_1_2)
    (adjacent pos_2_2 pos_2_3)
    (adjacent pos_6_2 pos_7_2)
    (adjacent pos_4_7 pos_5_7)
    (adjacent pos_3_4 pos_3_5)
    (adjacent pos_2_2 pos_1_2)
    (adjacent pos_7_4 pos_6_4)
    (adjacent pos_1_3 pos_2_3)
    (adjacent pos_2_4 pos_3_4)
    (adjacent pos_3_5 pos_4_5)
    (adjacent pos_4_6 pos_4_7)
    (adjacent pos_6_3 pos_6_4)
    (adjacent pos_5_7 pos_4_7)
    (adjacent pos_3_5 pos_3_4)
    (adjacent pos_1_3 pos_1_2)
    (adjacent pos_6_3 pos_5_3)
    (adjacent pos_2_5 pos_2_4)
    (adjacent pos_2_5 pos_3_5)
    (adjacent pos_1_2 pos_2_2)
    (adjacent pos_2_4 pos_2_3)
    (adjacent pos_6_4 pos_5_4)
    (adjacent pos_1_2 pos_1_1)
    (adjacent pos_5_3 pos_5_4)
    (adjacent pos_5_6 pos_4_6)
    (adjacent pos_5_6 pos_5_7)
    (adjacent pos_5_3 pos_4_3)
    (adjacent pos_5_4 pos_4_4)
    (adjacent pos_1_5 pos_2_5)
    (adjacent pos_5_5 pos_5_6)
    (adjacent pos_5_4 pos_5_5)
    (adjacent pos_2_6 pos_2_5)
    (direction pos_7_3 pos_7_2 north)
    (direction pos_4_3 pos_4_4 south)
    (direction pos_6_2 pos_6_3 south)
    (direction pos_4_7 pos_4_6 north)
    (direction pos_1_7 pos_2_7 east)
    (direction pos_1_3 pos_2_3 east)
    (direction pos_1_1 pos_2_1 east)
    (direction pos_2_4 pos_2_5 south)
    (direction pos_4_6 pos_5_6 east)
    (direction pos_4_4 pos_5_4 east)
    (direction pos_2_6 pos_2_5 north)
    (direction pos_4_4 pos_3_4 west)
    (direction pos_5_5 pos_5_6 south)
    (direction pos_2_2 pos_2_3 south)
    (direction pos_2_5 pos_3_5 east)
    (direction pos_1_5 pos_1_6 south)
    (direction pos_1_2 pos_1_3 south)
    (direction pos_6_3 pos_5_3 west)
    (direction pos_3_5 pos_3_4 north)
    (direction pos_1_6 pos_1_5 north)
    (direction pos_5_4 pos_5_3 north)
    (direction pos_7_3 pos_6_3 west)
    (direction pos_2_3 pos_2_2 north)
    (direction pos_3_4 pos_2_4 west)
    (direction pos_7_2 pos_7_3 south)
    (direction pos_5_5 pos_4_5 west)
    (direction pos_5_7 pos_4_7 west)
    (direction pos_5_3 pos_4_3 west)
    (direction pos_6_3 pos_7_3 east)
    (direction pos_2_6 pos_1_6 west)
    (direction pos_1_7 pos_1_6 north)
    (direction pos_4_6 pos_4_7 south)
    (direction pos_2_2 pos_1_2 west)
    (direction pos_6_4 pos_6_3 north)
    (direction pos_3_4 pos_3_5 south)
    (direction pos_1_2 pos_1_1 north)
    (direction pos_5_3 pos_5_4 south)
    (direction pos_5_7 pos_5_6 north)
    (direction pos_2_4 pos_2_3 north)
    (direction pos_5_5 pos_5_4 north)
    (direction pos_4_5 pos_4_4 north)
    (direction pos_2_5 pos_2_6 south)
    (direction pos_4_4 pos_4_5 south)
    (direction pos_6_5 pos_5_5 west)
    (direction pos_4_3 pos_5_3 east)
    (direction pos_5_3 pos_6_3 east)
    (direction pos_5_5 pos_6_5 east)
    (direction pos_6_3 pos_6_4 south)
    (direction pos_1_6 pos_2_6 east)
    (direction pos_5_6 pos_5_7 south)
    (direction pos_2_7 pos_2_6 north)
    (direction pos_1_1 pos_1_2 south)
    (direction pos_7_2 pos_6_2 west)
    (direction pos_1_6 pos_1_7 south)
    (direction pos_2_2 pos_2_1 north)
    (direction pos_4_5 pos_3_5 west)
    (direction pos_1_2 pos_2_2 east)
    (direction pos_7_4 pos_7_3 north)
    (direction pos_6_4 pos_5_4 west)
    (direction pos_4_5 pos_5_5 east)
    (direction pos_5_4 pos_5_5 south)
    (direction pos_2_4 pos_3_4 east)
    (direction pos_6_5 pos_6_4 north)
    (direction pos_4_7 pos_5_7 east)
    (direction pos_3_5 pos_2_5 west)
    (direction pos_4_6 pos_4_5 north)
    (direction pos_2_3 pos_2_4 south)
    (direction pos_7_3 pos_7_4 south)
    (direction pos_7_4 pos_6_4 west)
    (direction pos_3_5 pos_4_5 east)
    (direction pos_2_3 pos_1_3 west)
    (direction pos_2_1 pos_1_1 west)
    (direction pos_6_3 pos_6_2 north)
    (direction pos_3_4 pos_4_4 east)
    (direction pos_2_6 pos_2_7 south)
    (direction pos_6_2 pos_7_2 east)
    (direction pos_2_7 pos_1_7 west)
    (direction pos_5_6 pos_4_6 west)
    (direction pos_4_5 pos_4_6 south)
    (direction pos_6_4 pos_7_4 east)
    (direction pos_2_5 pos_1_5 west)
    (direction pos_1_3 pos_1_2 north)
    (direction pos_6_4 pos_6_5 south)
    (direction pos_2_5 pos_2_4 north)
    (direction pos_5_4 pos_6_4 east)
    (direction pos_4_4 pos_4_3 north)
    (direction pos_5_6 pos_5_5 north)
    (direction pos_2_1 pos_2_2 south)
    (direction pos_1_5 pos_2_5 east)
    (direction pos_5_4 pos_4_4 west)
  )
  (:goal
    (and
      (box-on-goal box_5_4)
      (box-on-goal box_6_4)
      (box-on-goal box_2_5)
      (box-on-goal box_4_5)
      (box-on-goal box_5_5)
    )
  )
)
