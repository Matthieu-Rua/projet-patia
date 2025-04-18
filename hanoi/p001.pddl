(define (problem hanoi-3disk)
    (:domain hanoi)
    (:objects
        disk1 disk2 disk3 - disk
        peg1 peg2 peg3 - peg
    )

    (:init
        ;; Situation initiale (tous sur peg1)
        (on disk1 disk2)
        (on disk2 disk3)
        (on-peg disk3 peg1)

        (clear disk1)
        (clear-peg peg2)
        (clear-peg peg3)

        ;; Relations de taille des disques
        (smaller disk1 disk2)
        (smaller disk1 disk3)
        (smaller disk2 disk3)
    )

    (:goal (and
        (on disk1 disk2)
        (on disk2 disk3)
        (on-peg disk3 peg3)
    ))
)
