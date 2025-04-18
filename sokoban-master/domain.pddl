(define (domain sokoban)
  (:requirements :typing :strips :equality :conditional-effects)
  
  (:types 
    location 
    box 
    player 
    direction
  )

  (:constants
    north south east west - direction
  )

  (:predicates
    (at ?p - player ?l - location)
    (box-at ?b - box ?l - location)
    (goal ?l - location)
    (clear ?l - location)
    (adjacent ?from - location ?to - location)
    (direction ?from - location ?to - location ?d - direction)
    (box-on-goal ?b - box)
  )

  ;; Déplacement du joueur
  (:action move
    :parameters (?p - player ?from - location ?to - location)
    :precondition (and
      (at ?p ?from)
      (adjacent ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Push vers l’est
  (:action push-east
    :parameters (?p - player ?b - box ?from - location ?boxloc - location ?to - location)
    :precondition (and
      (at ?p ?from)
      (box-at ?b ?boxloc)
      (clear ?to)
      (adjacent ?from ?boxloc)
      (adjacent ?boxloc ?to)
      (direction ?from ?boxloc east)
      (direction ?boxloc ?to east)
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?boxloc)
      (clear ?from)
      (not (clear ?boxloc))

      (not (box-at ?b ?boxloc))
      (box-at ?b ?to)
      (clear ?boxloc)
      (not (clear ?to))

      (when (goal ?to)
        (box-on-goal ?b))
      (when (goal ?boxloc)
        (not (box-on-goal ?b)))
    )
  )

  ;; Push vers l’ouest
  (:action push-west
    :parameters (?p - player ?b - box ?from - location ?boxloc - location ?to - location)
    :precondition (and
      (at ?p ?from)
      (box-at ?b ?boxloc)
      (clear ?to)
      (adjacent ?from ?boxloc)
      (adjacent ?boxloc ?to)
      (direction ?from ?boxloc west)
      (direction ?boxloc ?to west)
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?boxloc)
      (clear ?from)
      (not (clear ?boxloc))

      (not (box-at ?b ?boxloc))
      (box-at ?b ?to)
      (clear ?boxloc)
      (not (clear ?to))

      (when (goal ?to)
        (box-on-goal ?b))
      (when (goal ?boxloc)
        (not (box-on-goal ?b)))
    )
  )

  ;; Push vers le nord
  (:action push-north
    :parameters (?p - player ?b - box ?from - location ?boxloc - location ?to - location)
    :precondition (and
      (at ?p ?from)
      (box-at ?b ?boxloc)
      (clear ?to)
      (adjacent ?from ?boxloc)
      (adjacent ?boxloc ?to)
      (direction ?from ?boxloc north)
      (direction ?boxloc ?to north)
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?boxloc)
      (clear ?from)
      (not (clear ?boxloc))

      (not (box-at ?b ?boxloc))
      (box-at ?b ?to)
      (clear ?boxloc)
      (not (clear ?to))

      (when (goal ?to)
        (box-on-goal ?b))
      (when (goal ?boxloc)
        (not (box-on-goal ?b)))
    )
  )

  ;; Push vers le sud
  (:action push-south
    :parameters (?p - player ?b - box ?from - location ?boxloc - location ?to - location)
    :precondition (and
      (at ?p ?from)
      (box-at ?b ?boxloc)
      (clear ?to)
      (adjacent ?from ?boxloc)
      (adjacent ?boxloc ?to)
      (direction ?from ?boxloc south)
      (direction ?boxloc ?to south)
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?boxloc)
      (clear ?from)
      (not (clear ?boxloc))

      (not (box-at ?b ?boxloc))
      (box-at ?b ?to)
      (clear ?boxloc)
      (not (clear ?to))

      (when (goal ?to)
        (box-on-goal ?b))
      (when (goal ?boxloc)
        (not (box-on-goal ?b)))
    )
  )
)
