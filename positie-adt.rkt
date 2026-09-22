
(define (maak-positie x y)

   (define (x! nieuwe-x)
    (set! x nieuwe-x))
  (define (y! nieuwe-y)
    (set! y nieuwe-y))
  (define (gelijk? andere-positie)
    (and (= x (andere-positie 'x))
         (= y (andere-positie 'y))))
  (define (beweeg richting x y)
    (cond ((eq? richting 'omhoog) (maak-positie x (- y 1)))
          ((eq? richting 'omlaag) (maak-positie x (+ y 1)))
          ((eq? richting 'links) (maak-positie (- x 1) y))
          ((eq? richting 'rechts) (maak-positie (+ x 1) y))))
;de bovenstaande procedures zijn nodig om de x en y coördinaten van karakters zoals bijvoorbeeld de vuurmier en de schorpioenen te veranderen of te vergelijken.
  (define (dispatch-positie m)
    (cond ((eq? m 'x) x)
          ((eq? m 'y) y)
          ((eq? m 'x!) x!)
          ((eq? m 'y!) y!) 
          ((eq? m 'beweeg) beweeg)
          ((eq? m 'gelijk?) gelijk?)))
          

  dispatch-positie)
     

;zoals u kan zien, ik heb dit overgenomen van de positie-adt van de snake spel die we hebben behandeld tijdens wpo massaprogrammeren