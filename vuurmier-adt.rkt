
(define (maak-vuurmier-adt positie-vuurmier)
  (let
      ((Doolhof-adt (maak-doolhof-adt))
         
       (positie-vuurmier vuurmier-start-positie)
       (puzzel-genomen #f)) ;start-positie-vuurmier is gedefinieerd in Constanten.rkt
        
     
  
    (define (positie! nieuwe-positie)
      (set! positie-vuurmier nieuwe-positie))


    (define positie-soort2 (cons 0 0))
    
    (define (vuurmier-heeft-puzzel! positie-vuurmier)
      (cond
        ((= huidig-level 1)
         (if (and (= (positie-vuurmier 'x) 25) (= (positie-vuurmier 'y) 6))
             (set! positie-soort2 (cons 1 1))))
        ((= huidig-level 2)
         (if (and (= (positie-vuurmier 'x) 6) (= (positie-vuurmier 'y) 7))
             (set! positie-soort2 (cons 2 2))))
        ((= huidig-level 3)

         (cond  ((and (and (= (positie-vuurmier 'x) 21) (= (positie-vuurmier 'y) 6)) (not puzzel-genomen))
                      (set! positie-soort2 (cons 3 0))
                      (set! puzzel-genomen #t))
                ((and (= (positie-vuurmier 'x) 29) (= (positie-vuurmier 'y) 9))
                 (if (= (car positie-soort2) 3)
                      (set! positie-soort2 (cons 3 3)))))))
                 
      
      
            
                       )
            
                 



   

   
    
    ; kijk eerst naar aanpassingen in vuurmier-adt
    (define (vuurmier-beweegt! richting)
      (let((new-position ((Doolhof-adt 'beweegt!) richting positie-vuurmier positie-soort2 huidig-level)))    ; ik gebruik beweegt! uit doolhof-adt zodat de vuurmier niet op de muren gaat, maar gwn de gang volgt
          
        
        
           (set! positie-vuurmier new-position)))
        
        
    

    
    (define (dispatch m)
      (cond
        ((eq? m 'positie) positie-vuurmier)
        ((eq? m 'positie!) positie!)
        ((eq? m 'vuurmier-beweegt!) vuurmier-beweegt!)
        ((eq? m 'vuurmier-heeft-puzzel!) vuurmier-heeft-puzzel!)))
      
    dispatch))
      
      

;ik begin eerst met een positie die ik geef aan de vuurmier
;de vuurmier-beweegt! procedure is nodig om de positie van de vuurmier te veranderen, hierbij maak ik gebruik van de doolhof-adt
      




