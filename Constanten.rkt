(load "positie-adt.rkt")

(define cel-breedte-px 25)
(define cel-hoogte-px 25)

(define spel-breedte 32)
(define spel-hoogte  20)
(define vuurmier-start-positie (maak-positie (quotient spel-breedte 2)
                                             (quotient spel-hoogte 10)))

(define venster-breedte-px (* cel-breedte-px spel-breedte))
(define venster-hoogte-px (* cel-hoogte-px spel-hoogte))

(define schorpioen-start-positie1 (maak-positie 12
                                               8))
(define schorpioen-eind-positie1
  (maak-positie 13
                8)) ;er is een eind en begin positie zodat de schorpioen van richting verandert wanneer het één van beide posities bereikt
; richting verandert naar rechts wanneer schorpioen-start-positie wordt bereikt en wanneer schorpioen-eind-positie1 wordt bereikt verandert de richting naar links
; er staat een 1 na de positie zodat ik later andere schorpioenen kan implemnteren

(define schorpioen-start-positie1-level2 (maak-positie 3 8))
(define schorpioen-eind-positie1-level2
  (maak-positie 6
                8))

(define schorpioen-start-positie1-level3 (maak-positie 8
                                                13))
(define schorpioen-eind-positie1-level3
  (maak-positie 16
                13))
(define seconden-nieuw-spel 30000)
(define schorpioen-start-positie2 (maak-positie 5 8))

(define schorpioen-start-positie2-level2 (maak-positie 12 6))
(define schorpioen-start-positie2-level3 (maak-positie 27 10))


(define lijst-voedsel-level3 (list  (cons 3 5)))
(define lijst-voedsel2-level3 (list (cons 2 4)))
(define lijst-voedsel-level2 (list (cons 6 2)))
(define lijst-voedsel2-level2 (list (cons 8 5)))
(define lijst-powerup (list (cons 25 14)))
(define lijst-powerup2 (list (cons 29 13)))
(define lijst-voedsel-level (list (cons 2 3)))
(define lijst-voedsel2-level (list (cons 3 4)))
(define lijst-surfplank-level (list (cons 25 6)))
(define lijst-sleutels (list (cons 6 7)))
(define lijst-sleutels-level3 (list (cons 21 6)(cons 29 9) ))



(define goud-appel-score 5)
(define appel-score 1)

 (define levens-extra 100)
 (define levens-min 10)
  (define huidig-level 1)


(define seconden-snel 5000)

  
(define sneller1 500)
(define sneller2 400)
(define sneller3 600)
(define constante-sneller 100)
(define schorpioen-snelheid-level2 800)
(define schorpioen-snelheid-level3 700)
(define schorpioen-snelheid-level1 950)
(define schorpioen2-snelheid-level2 500)
(define schorpioen2-snelheid-level3 800)
(define schorpioen2-snelheid-level1 600)
(define nu-schorpioen-sneller-level1 20000)
(define nu-schorpioen2-sneller-level1 10000)
(define nu-schorpioen-sneller-level2 15000)
(define nu-schorpioen2-sneller-level2 8000)
(define nu-schorpioen-sneller-level3 10000)
(define nu-schorpioen2-sneller-level3 6000)


(define vuurmier-snelheid 200)
;ik heb me geïnspireerd van de snake spel uit de wpo, ik gebruik de constanten in andere ADT's