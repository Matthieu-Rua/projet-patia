(define (domain hanoi)
    (:requirements :strips :typing)
    (:types disk peg)

    (:predicates
        (on ?d1 - disk ?d2 - disk)
        (on-peg ?d - disk ?p - peg)
        (clear ?d - disk)
        (clear-peg ?p - peg)
        (smaller ?small - disk ?big - disk)
    )

    ;; Depuis un disque vers une tour
    (:action disk-to-peg
        :parameters (?disk - disk ?from - disk ?to - peg)
        :precondition (and (on ?disk ?from) (clear ?disk) (clear-peg ?to))
        :effect (and
            (on-peg ?disk ?to) (clear ?from)
            (not (on ?disk ?from)) (not (clear-peg ?to)))
    )

    ;; Depuis une tour vers un disque
    (:action peg-to-disk
        :parameters (?disk - disk ?from - peg ?to - disk)
        :precondition (and (on-peg ?disk ?from) (clear ?disk) (clear ?to) (smaller ?disk ?to))
        :effect (and
            (on ?disk ?to) (clear-peg ?from)
            (not (on-peg ?disk ?from)) (not (clear ?to)))
    )

    ;; Depuis une tour vers une autre tour
    (:action peg-to-peg
        :parameters (?disk - disk ?from - peg ?to - peg)
        :precondition (and (on-peg ?disk ?from) (clear ?disk) (clear-peg ?to))
        :effect (and
            (on-peg ?disk ?to) (clear-peg ?from)
            (not (on-peg ?disk ?from)) (not (clear-peg ?to)))
    )

    ;; Depuis un disque vers un autre disque
    (:action disk-to-disk
        :parameters (?disk - disk ?from - disk ?to - disk)
        :precondition (and (on ?disk ?from) (clear ?disk) (clear ?to) (smaller ?disk ?to))
        :effect (and
            (on ?disk ?to) (clear ?from)
            (not (on ?disk ?from)) (not (clear ?to)))
    )
)
