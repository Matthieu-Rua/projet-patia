;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 4 Op-blocks world
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain taquin)
    (:requirements :strips :typing)
    (:types
        tile
        position
    )
    (:predicates
        ;;; la case x est à la position p 
        (at ?x - tile ?p - position)
        ;;: la position p est adjacente à p2
        (adjacent ?p - position ?p2 - position)
        ;;; la position p est vide
        (empty ?p - position)
    )

    ;;; on veut bouger à x
    (:action move
        :parameters (?x - tile ?old_p - position ?new_p - position)
        :precondition (and (at ?x ?old_p) (empty ?new_p) (adjacent ?old_p ?new_p))
        :effect (and(not (empty ?new_p)) 
        (empty ?old_p)
        (at ?x ?new_p) 
        (not(at ?x ?old_p)))
    )

)