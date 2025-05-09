(define (domain gripper-strips-typed)
  (:requirements :typing :strips)
  
  (:types
    room
    ball
    gripper
  )

  (:predicates
    (at-robby ?r - room)
    (at ?b - ball ?r - room)
    (carry ?b - ball ?g - gripper)
    (free ?g - gripper)
    (connected ?from - room ?to - room)
  )

  (:action move
    :parameters (?from - room ?to - room)
    :precondition (and
      (at-robby ?from)
      (connected ?from ?to)
    )
    :effect (and
      (at-robby ?to)
      (not (at-robby ?from))
    )
  )

  (:action pick
    :parameters (?b - ball ?r - room ?g - gripper)
    :precondition (and
      (at-robby ?r)
      (at ?b ?r)
      (free ?g)
    )
    :effect (and
      (carry ?b ?g)
      (not (at ?b ?r))
      (not (free ?g))
    )
  )

  (:action drop
    :parameters (?b - ball ?r - room ?g - gripper)
    :precondition (and
      (at-robby ?r)
      (carry ?b ?g)
    )
    :effect (and
      (at ?b ?r)
      (free ?g)
      (not (carry ?b ?g))
    )
  )
)
