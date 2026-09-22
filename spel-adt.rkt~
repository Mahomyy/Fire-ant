
(define (maak-adt-spel)
  ;; Dit is het eigenlijk spel object.
  (let ((level-adt (maak-adt-level spel-breedte spel-hoogte))
        (draw-adt (maak-draw-adt venster-breedte-px venster-hoogte-px)))
    
(define (toets-procedure status toets)
  ;; status is ofwel gelijk aan ...
  ;; - 'pressed: wanneer de toets ingedrukt wordt
  ;; - 'released: wanneer de toets losgelaten wordt
  ;; Wanneer de toets voor lange tijd ingedrukt wordt, dan wordt deze
  ;; procedure meermaals aangeroepen waarbij status gelijk is aan 'pressed
  ;; voor dezelfde toets!
  (if (eq? status 'pressed)
    ((level-adt 'toets!) toets)))

(define (spel-lus-procedure delta-tijd)
  ((draw-adt 'teken-spel!) dispatch-spel)
  ((level-adt 'update!) delta-tijd))
 
 

(define (start)
  ;; Zet de callbacks via het teken ADT
  ((draw-adt 'set-spel-lus-functie!) spel-lus-procedure)
  ((draw-adt 'set-toets-functie!) toets-procedure))
    
    ;; Dispatch functie
    (define (dispatch-spel msg)
      (cond ((eq? msg 'start) start)
            ((eq? msg 'level) level-adt)))
    
    dispatch-spel))

;zoals u ziet heb ik deze adt overgenomen van de wpo massaprogrammeren, dit heb ik gedaan omdat het me een nuttige adt leek te zijn, vooral voor de vuurmier


