(define (maak-op-te-rapen-objecten-adt positie-object)  
  (define (positie! nieuwe-positie)
    (set! positie nieuwe-positie))
  (define (dispatch-voedsel m)
    (cond ((eq? m 'positie) positie-object)
          ((eq? m 'positie!) positie!)))
  dispatch-voedsel)

;voor de positie van de objecten dat kan opgerapen worden door de vuurmier zijn er twee belangrijke dingen, ten eerste moet ik de positie van het object kunnen opvragen en ten tweede moet ik de positie kunnen veranderen
;ik heb mijn inspiratie gehaald uit de implementatie van de appel in snake, het spel die we tijdens de wpo massaprogrammeren hebben bekeken