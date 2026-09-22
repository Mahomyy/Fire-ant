;; debugging? :: boolean
(define debugging? #t)

;; debug :: any -> /
(define (debug . msg)
  (if debugging?
      (begin (display msg)
             (newline))))
;dit heb ik overgenomen van de snake spel uit wpo massaprogrammere, ik heb dit ADT nog niet nodig gehad, maar in fase 2 zal ik het wel nodig hebben

(define (posities-objecten x)
  (map
   (lambda (xy-coordinaat)
     (maak-positie (quotient spel-breedte (car xy-coordinaat)) (quotient spel-hoogte (cdr xy-coordinaat)))) x))


(define (posities-objecten-zonder-spelhoogte-en-breedte x)
  (map
   (lambda (xy-coordinaat)
     (maak-positie (car xy-coordinaat) (cdr xy-coordinaat))) x))



(define (adt-aanmaak x y)
  (map
   (lambda (xy-coordinaat)
     (y xy-coordinaat)) x))

(define (drawb x y)
  (map
   (lambda (xy-coordinaat)
     ((y 'add-drawable) xy-coordinaat)) x)
 )

(define (remove-drawb x y)
  (map
   (lambda (xy-coordinaat)
     ((y 'remove-drawable) xy-coordinaat)) x)
  )

