(define (problem gripper-test-typed-01)
  (:domain gripper-strips-typed)

  (:objects
    rooma roomb - room
    ball1 ball2 - ball
    left right - gripper
  )

  (:init
    (at-robby rooma)
    (at ball1 rooma)
    (at ball2 rooma)
    (free left)
    (free right)

    ;; Connexions autorisées
    (connected rooma roomb)
    (connected roomb rooma)
  )

  (:goal (and
    (at ball1 roomb)
    (at ball2 roomb)
  ))
)
