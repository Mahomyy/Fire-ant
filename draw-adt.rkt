(#%require "Graphics.rkt")
(define (maak-draw-adt pixels-horizontaal pixels-verticaal)
  (let* ((venster (make-window pixels-horizontaal pixels-verticaal "Fire Ant")))
       
       
         
                        
         
       

   

    (define mijn-eerste-laag (venster 'make-layer))
    (define doolhof (make-tile pixels-horizontaal pixels-horizontaal "Afbeeldingen/Doolhof.jpg"))
    (define doolhof2  (make-tile pixels-horizontaal pixels-horizontaal "Afbeeldingen/Doolhof2.jpg"))
      (define doolhof3  (make-tile pixels-horizontaal pixels-horizontaal "Afbeeldingen/Doolhof3.jpg"))
     (define laatst-venster  (make-tile pixels-horizontaal pixels-horizontaal "Afbeeldingen/laatst-venster.jpg"))
    (define voedsel-laag (venster 'make-layer))
    (define voedsel2-tiles (list (make-bitmap-tile "Afbeeldingen/goud-voedsel.png" "Afbeeldingen/goud-voedsel-mask.png")))
    (define powerup-tile (list (make-bitmap-tile "Afbeeldingen/powerup1.png" "Afbeeldingen/powerup1-mask.png")))
    (define powerup-tile2 (list (make-bitmap-tile "Afbeeldingen/powerup2.png" "Afbeeldingen/powerup2-mask.png")))
    (define voedsel-tiles (list (make-bitmap-tile "Afbeeldingen/ei.png" "Afbeeldingen/ei-mask.png")))
 

    (define surfplank-tile
       (list (make-bitmap-tile "Afbeeldingen/surfplank.png" "Afbeeldingen/surfplank-mask.png")))
   (define sleutel-tiles-level3
      (list (make-bitmap-tile "Afbeeldingen/sleutel.png" "Afbeeldingen/sleutel-mask.png") (make-bitmap-tile "Afbeeldingen/sleutel.png" "Afbeeldingen/sleutel-mask.png")))
    (define sleutel-tile
      (list (make-bitmap-tile "Afbeeldingen/sleutel.png" "Afbeeldingen/sleutel-mask.png")))
    (define vuurmier-laag (venster 'make-layer))
    (define vuurmier-tile
     (make-bitmap-tile "Afbeeldingen/vuurmier.png" "Afbeeldingen/vuurmier-mask.png"))
      

    (define schorpioen-laag (venster 'make-layer))
    (define schorpioen-tile
      (make-bitmap-tile "Afbeeldingen/Schorpioen.png" "Afbeeldingen/Schorpioen-mask.png"))
      (define schorpioen-snel-tile
        
      (make-bitmap-tile "Afbeeldingen/Schorpioen-snel.png" "Afbeeldingen/Schorpioen-snel-mask.png"))
    (define schorpioen2-snel-tile
      (make-bitmap-tile "Afbeeldingen/Schorpioen2-snel.png" "Afbeeldingen/Schorpioen2-snel-mask.png"))
(define schorpioen-tile2
      (make-bitmap-tile "Afbeeldingen/Schorpioen2.png" "Afbeeldingen/Schorpioen2-mask.png"))
    
    ((mijn-eerste-laag 'add-drawable) doolhof)
    ;ik heb hierbij van een afbeelding een tile gemaakt en het gezet op de layer die ik heb aangemaakt op de venster.Ik kon de doolhof ook zelf tekenen, maar ik vond het makkelijker en efficiënter om de doolhof appart te bewerken

  ((doolhof 'draw-text) "Score : 0 " 20 380 450 "white")
  ((doolhof 'draw-text) "Hoogste Score : 0 "  20 150 450 "white")
  
    
      (drawb surfplank-tile voedsel-laag)
    
    (drawb voedsel-tiles voedsel-laag)
    
     (drawb voedsel2-tiles voedsel-laag)
    (drawb powerup-tile2 voedsel-laag)
               
    ((vuurmier-laag 'add-drawable) vuurmier-tile)
   
             
   ((schorpioen-laag 'add-drawable) schorpioen-tile2)


    (define (teken-score level-adt vuurmier-adt voedsel-adt x doolhof)
        (let  
             ( (vuurmier-positie (vuurmier-adt 'positie))
               (hoogste-score (level-adt 'hoogste-score))
                (levens (level-adt 'levens))
              (score (level-adt 'score)))




     
     (for-each (lambda (xy-coordinaat) (if  xy-coordinaat (if  (and (= ((xy-coordinaat 'positie) 'x) (vuurmier-positie 'x)) (= ((xy-coordinaat 'positie) 'y) (vuurmier-positie 'y)))
                                                               (begin
                                                               (doolhof 'clear)
           ((doolhof 'draw-text) (string-append "Score : " (number->string (+ score x))) 20 380 450 "white")
           ((doolhof 'draw-text) (string-append "Levens : " (number->string levens)) 20 550 450 "white")
           (if 
     (> (+ score x) hoogste-score)
           ((doolhof 'draw-text) (string-append "Hoogste Score : " (number->string (+ hoogste-score x))) 20 150 450 "white")
            ((doolhof 'draw-text) (string-append "Hoogste Score : " (number->string hoogste-score )) 20 150 450 "white")))
           ))) voedsel-adt)))


    
 (define (schorpioen-tile-kies level indicator indicator2 schorpioen-timer schorpioen2-timer x y schorpioen-tile schorpioen-snel-tile)
   
          (cond
           ((or (= schorpioen-timer 0)
               
                (> (+ x 100) schorpioen-timer x))
            (cond
            ((equal? indicator #f)
             
        
              ((schorpioen-laag 'add-drawable) schorpioen-tile))
              
             
            ((equal? indicator #t)
              
              ((schorpioen-laag 'remove-drawable) schorpioen-tile)
              ((schorpioen-laag 'add-drawable) schorpioen-snel-tile)))))
  (cond
           ((or (= schorpioen2-timer 0)
               
                (> (+ y 100) schorpioen2-timer y))
            (cond
            ((equal? indicator2 #f)
             
        
              ((schorpioen-laag 'add-drawable) schorpioen-tile2))
              
             
            ((equal? indicator2 #t)
              
              ((schorpioen-laag 'remove-drawable) schorpioen-tile2)
              ((schorpioen-laag 'add-drawable) schorpioen2-snel-tile))))))
   

    
(define (remove-blauw-schorpioen level)
  (let ((indicator (level 'indicator)))

    (if
     (equal? indicator #f)
    ((schorpioen-laag 'remove-drawable) schorpioen-snel-tile))))
            
(define (remove-blauw-schorpioen2 level)
  (let ((indicator2 (level 'indicator2)))

    (if
     (equal? indicator2 #f)
    ((schorpioen-laag 'remove-drawable) schorpioen2-snel-tile))))
    
    


    
 (define (schorpioen-teken-kies level-adt indicator)
 
      (cond
        ((= huidig-level 1)
            
           
      
        (cond
          
              ((equal? indicator #t)
               (teken-schorpioen-snel! (level-adt 'schorpioen)))
              
               ((equal? indicator #f)
                 (teken-schorpioen! (level-adt 'schorpioen)))))
        ((= huidig-level 2)
            
           
      
        (cond
          
              ((equal? indicator #t)
               (teken-schorpioen-snel! (level-adt 'schorpioen-level2)))
              
               ((equal? indicator #f)
                 (teken-schorpioen! (level-adt 'schorpioen-level2)))))
        ((= huidig-level 3)
            
           
      
        (cond
          
              ((equal? indicator #t)
               (teken-schorpioen-snel! (level-adt 'schorpioen-level3)))
              
               ((equal? indicator #f)
                 (teken-schorpioen! (level-adt 'schorpioen-level3))))) ))
        


     (define (schorpioen-teken-kies2 level-adt indicator)
 
      (cond
        ((= huidig-level 1)
            
           
      
        (cond
          
              ((equal? indicator #t)
               (teken-schorpioen-snel2! (level-adt 'schorpioen2)))
              
               ((equal? indicator #f)
                 (teken-schorpioen2! (level-adt 'schorpioen2)))))
        ((= huidig-level 2)
            
           
      
        (cond
          
              ((equal? indicator #t)
               (teken-schorpioen-snel2! (level-adt 'schorpioen2-level2)))
              
               ((equal? indicator #f)
                 (teken-schorpioen2! (level-adt 'schorpioen2-level2)))))
        ((= huidig-level 3)
            
           
      
        (cond
          
              ((equal? indicator #t)
               (teken-schorpioen-snel2! (level-adt 'schorpioen2-level3)))
              
               ((equal? indicator #f)
                 (teken-schorpioen2! (level-adt 'schorpioen2-level3)))))))

   
        
        
        


                 
                                                           
      (define (teken-levens level-adt vuurmier-adt schorpioen-adt powerups x y doolhof)
         (let  
             ( (vuurmier-positie (vuurmier-adt 'positie))
               (schorpioen-positie (schorpioen-adt 'positie))
              (levens (level-adt 'levens))
              (bescherming-vuurmier (level-adt 'bescherming-vuurmier))
              (score (level-adt 'score))
              (hoogste-score (level-adt 'hoogste-score)))
         (if
             (and (and (= (schorpioen-positie 'x) (vuurmier-positie 'x)) (= (schorpioen-positie 'y) (vuurmier-positie 'y))) (equal? bescherming-vuurmier #f))
             (begin
             (doolhof 'clear)
              
                                                                 ((doolhof 'draw-text) (string-append "Score : " (number->string  score)) 20 380 450 "white")
            ((doolhof 'draw-text) (string-append "Hoogste Score : " (number->string hoogste-score )) 20 150 450 "white")
             ((doolhof 'draw-text) (string-append "Levens : " (number->string (- levens x))) 20 550 450 "white"))


             (cond
               ((= huidig-level 2)
          

              (for-each (lambda (xy-coordinaat) (if  xy-coordinaat (if  (and (= ((xy-coordinaat 'positie) 'x) (vuurmier-positie 'x)) (= ((xy-coordinaat 'positie) 'y) (vuurmier-positie 'y)))
                                                                         (begin
                                                               (doolhof 'clear)
                                                                 ((doolhof 'draw-text) (string-append "Score : " (number->string  score)) 20 380 450 "white")
            ((doolhof 'draw-text) (string-append "Hoogste Score : " (number->string hoogste-score )) 20 150 450 "white")
             ((doolhof 'draw-text) (string-append "Levens : " (number->string (+ y levens))) 20 550 450 "white"))))) powerups))))))
            
                                                             
    
               
       (define (verander-levensweg-schorpioen x schorpioen-adt level-adt doolhof)
      (let  
             ((vuurmier-positie (vuurmier-adt 'positie)))
              
        
      (cond
        ((and (= ((schorpioen-adt 'positie) 'x) (vuurmier-positie 'x)) (= ((schorpioen-adt 'positie) 'y) (vuurmier-positie 'y)))
          (doolhof 'clear)
                                                                 ((doolhof 'draw-text) (string-append "Score : " (number->string  score)) 20 380 450 "white")
            ((doolhof 'draw-text) (string-append "Hoogste Score : " (number->string hoogste-score )) 20 150 450 "white")
             ((doolhof 'draw-text) (string-append "Levens : " (number->string (- levens x))) 20 550 450 "white")))))
            
   
   
       
   (define (level-hestart vuurmier-adt schorpioen-adt)
     (let  
             ( (vuurmier-positie (vuurmier-adt 'positie))
               (schorpioen-positie (schorpioen-adt 'positie)))
      
        (if
             (and (= (schorpioen-positie 'x) (vuurmier-positie 'x)) (= (schorpioen-positie 'y) (vuurmier-positie 'y)))
             (begin
             (drawb voedsel-tiles voedsel-laag)
             (drawb voedsel2-tiles voedsel-laag)))))



     
         
       

    (define (draw level-adt vuurmier-adt level)
      (let  ( (vuurmier-positie (vuurmier-adt 'positie))
             (hoogste-score (level-adt 'hoogste-score))
              (score (level-adt 'score))
              (levens (level-adt 'levens)))
            

      
             
        (if
         (and (or (= (vuurmier-positie 'x) 2)  (= (vuurmier-positie 'x) 1))   (= (vuurmier-positie 'y) 16))
         (cond
           ((= huidig-level 2)
              (set! huidig-level 3)

            
              ((schorpioen-laag 'remove-drawable)schorpioen-tile)
               ((schorpioen-laag 'remove-drawable)schorpioen-snel-tile)
              ((schorpioen-laag 'remove-drawable)schorpioen-tile2)
              ((vuurmier-laag 'remove-drawable) vuurmier-tile)
              (remove-drawb voedsel-tiles voedsel-laag)
             (remove-drawb powerup-tile voedsel-laag)
            (remove-drawb voedsel2-tiles voedsel-laag)
            

              ((mijn-eerste-laag 'remove-drawable) doolhof2)
              
        
            ((mijn-eerste-laag 'add-drawable) doolhof3)
            ;ik heb hierbij van een afbeelding een tile gemaakt en het gezet op de layer die ik heb aangemaakt op de venster.Ik kon de doolhof ook zelf tekenen, maar ik vond het makkelijker en efficiënter om de doolhof appart te bewerken


            
    ((doolhof3 'draw-text) (string-append "Levens : " (number->string levens)) 20 550 450 "white")
     ((doolhof3 'draw-text) (string-append "Score : " (number->string score)) 20 380 450 "white")
      ((doolhof3 'draw-text) (string-append "Hoogste Score : " (number->string hoogste-score)) 20 150 450 "white")
       
            (drawb sleutel-tiles-level3 voedsel-laag)
            (drawb voedsel-tiles voedsel-laag)
            (drawb voedsel2-tiles voedsel-laag)
            
    
               
            ((vuurmier-laag 'add-drawable) vuurmier-tile)
        
             




             ((schorpioen-laag 'add-drawable) schorpioen-tile)
            ((schorpioen-laag 'add-drawable) schorpioen-tile2)
            
            )
                


           ((= huidig-level 1)
           
       (set! huidig-level 2)
       ((schorpioen-laag 'remove-drawable)schorpioen-snel-tile)
              ((schorpioen-laag 'remove-drawable)schorpioen-tile)
              ((schorpioen-laag 'remove-drawable)schorpioen-tile2)
              ((vuurmier-laag 'remove-drawable) vuurmier-tile)
              (remove-drawb powerup-tile2 voedsel-laag)
              (remove-drawb voedsel-tiles voedsel-laag)
               ((mijn-eerste-laag 'remove-drawable) doolhof)

          
     
      
     
            ((mijn-eerste-laag 'add-drawable) doolhof2)
          ((doolhof2 'draw-text) (string-append "Score : " (number->string score)) 20 380 450 "white")
           ((doolhof2 'draw-text) (string-append "Hoogste Score : " (number->string hoogste-score)) 20 150 450 "white")
            ((doolhof2 'draw-text) (string-append "Levens : " (number->string levens)) 20 550 450 "white")
           (drawb sleutel-tile voedsel-laag)
              (drawb voedsel-tiles voedsel-laag)
               (drawb powerup-tile voedsel-laag)
            (drawb voedsel2-tiles voedsel-laag)
            

            ((vuurmier-laag 'add-drawable) vuurmier-tile)
      
             ((schorpioen-laag 'add-drawable) schorpioen-tile)
            ((schorpioen-laag 'add-drawable) schorpioen-tile2))

           ((= huidig-level 3)
              (set! huidig-level 4)

              ((schorpioen-laag 'remove-drawable)schorpioen-snel-tile)
             
              ((schorpioen-laag 'remove-drawable)schorpioen2-snel-tile)
              ((schorpioen-laag 'remove-drawable)schorpioen-tile)
              ((schorpioen-laag 'remove-drawable)schorpioen-tile2)
              ((vuurmier-laag 'remove-drawable) vuurmier-tile)
              (remove-drawb voedsel-tiles voedsel-laag)
              (remove-drawb voedsel2-tiles voedsel-laag)
              ((mijn-eerste-laag 'remove-drawable) doolhof3)

              ((mijn-eerste-laag 'add-drawable) laatst-venster)
                ((laatst-venster 'draw-text) (string-append "Hoogste Score : " (number->string hoogste-score)) 20 150 450 "white")
                ((laatst-venster 'draw-text) (string-append "Score : " (number->string score)) 20 380 450 "white")
              )
           ((= huidig-level 4)
            ((schorpioen-laag 'remove-drawable)schorpioen-snel-tile)
             
              ((schorpioen-laag 'remove-drawable)schorpioen2-snel-tile))))))
              
           
         

     
   
          
     
      
     
        

        

   

 
      (define (teken-voedsel! voedsel-adt)
        (map (lambda (x y z)
               (if x (teken-object! z y) (and ((voedsel-laag 'remove-drawable) y)))) voedsel-adt voedsel-tiles voedsel-adt)1)
    (define (teken-goud-voedsel! voedsel-adt)
        (map (lambda (x y z)
               (if x (teken-object! z y) (and ((voedsel-laag 'remove-drawable) y)))) voedsel-adt voedsel2-tiles voedsel-adt))

    (define (teken-powerup1! voedsel-adt)
        (map (lambda (x y z)
               (if x (teken-object! z y) (and ((voedsel-laag 'remove-drawable) y)))) voedsel-adt powerup-tile voedsel-adt))
     (define (teken-powerup2! voedsel-adt)
        (map (lambda (x y z)
               (if x (teken-object! z y) (and ((voedsel-laag 'remove-drawable) y)))) voedsel-adt powerup-tile2 voedsel-adt))


    (define (teken-surfplank! voedsel-adt)
        (map (lambda (x y z)
               (if x (teken-object! z y) ((voedsel-laag 'remove-drawable) y))) voedsel-adt surfplank-tile voedsel-adt))
      
      (define (teken-sleutel! voedsel-adt)
        (map (lambda (x y z)
               (if x (teken-object! z y) ((voedsel-laag 'remove-drawable) y))) voedsel-adt sleutel-tile voedsel-adt))
      
       (define (teken-sleutels! voedsel-adt)
        (map (lambda (x y z)
               (if x (teken-object! z y) ((voedsel-laag 'remove-drawable) y))) voedsel-adt sleutel-tiles-level3 voedsel-adt))
      
      
         
   
      (define (teken-vuurmier! vuurmier-adt)
        (if vuurmier-adt
            (teken-object! vuurmier-adt vuurmier-tile)))
       
      

  
      (define (teken-schorpioen! schorpioen-adt)
        (if schorpioen-adt
            (teken-object! schorpioen-adt schorpioen-tile)))

    (define (teken-schorpioen-snel! schorpioen-adt)
        (if schorpioen-adt
            (teken-object! schorpioen-adt schorpioen-snel-tile)))

     (define (teken-schorpioen-snel2! schorpioen-adt)
        (if schorpioen-adt
            (teken-object! schorpioen-adt schorpioen2-snel-tile)))
    
    (define (teken-schorpioen2! schorpioen-adt)
        (if schorpioen-adt
            (teken-object! schorpioen-adt schorpioen-tile2)))

    
    
      ;; set-spel-lus-functie! :: (number -> /) -> /
      (define (set-spel-lus-functie! fun)
        ((venster 'set-update-callback!) fun))
    
    
      ;; set-toets-functie! :: (symbol, any -> /) -> /
      (define (set-toets-functie! fun)
        ((venster 'set-key-callback!) fun))

      (define (teken-object! obj tile)
        (let* ((obj-x ((obj 'positie) 'x))
               (obj-y ((obj 'positie) 'y))
               (screen-x (* cel-breedte-px obj-x))
               (screen-y (* cel-hoogte-px obj-y)))
          ((tile 'set-x!) screen-x)
          ((tile 'set-y!) screen-y)))


                
    
      (define (teken-level! level-adt)
        (let ((huidig-level (level-adt 'current-level))
             (score (level-adt 'score))
              (levens (level-adt 'levens))
              (hoogste-score (level-adt 'hoogste-score)))
        
          (cond
            ((= huidig-level 1)
             (teken-score level-adt (level-adt 'vuurmier) (level-adt 'voedsel-adt) appel-score doolhof)
             (teken-score level-adt (level-adt 'vuurmier) (level-adt 'voedsel2-adt) goud-appel-score doolhof)
              (teken-powerup2! (level-adt 'powerups2))
          
          
             (teken-voedsel! (level-adt 'voedsel-adt))

             (teken-goud-voedsel! (level-adt 'voedsel2-adt))
             (teken-surfplank! (level-adt 'surfplank))
             (teken-vuurmier! (level-adt 'vuurmier))
             (level-hestart (level-adt 'vuurmier) (level-adt 'schorpioen))
            
           
           
           
             (schorpioen-tile-kies  level-adt (level-adt 'indicator) (level-adt 'indicator2) (level-adt 'schorpioen-timer) (level-adt 'schorpioen2-timer) nu-schorpioen-sneller-level1 nu-schorpioen2-sneller-level1 schorpioen-tile schorpioen-snel-tile)
               (schorpioen-teken-kies  level-adt (level-adt 'indicator))
            (schorpioen-teken-kies2  level-adt (level-adt 'indicator2))
             (remove-blauw-schorpioen level-adt)
             (remove-blauw-schorpioen2 level-adt)
              (teken-levens level-adt (level-adt 'vuurmier) (level-adt 'schorpioen) (level-adt 'powerups) levens-min levens-extra doolhof)
              (teken-levens level-adt (level-adt 'vuurmier) (level-adt 'schorpioen2) (level-adt 'powerups) levens-min levens-extra doolhof)
            ((doolhof 'draw-text) "Level 1" 20 10 450 "white")
          
    
             (draw level-adt (level-adt 'vuurmier) level-adt))
            
            ((= huidig-level 2)
              (teken-score level-adt (level-adt 'vuurmier) (level-adt 'voedsel-adt2) appel-score doolhof2)
             (teken-score level-adt (level-adt 'vuurmier) (level-adt 'voedsel2-adt2) goud-appel-score doolhof2)
             (teken-powerup1! (level-adt 'powerups))
             (teken-voedsel! (level-adt 'voedsel-adt2))
             (teken-goud-voedsel! (level-adt 'voedsel2-adt2))
             (teken-sleutel! (level-adt 'sleutel))
             (teken-vuurmier! (level-adt 'vuurmier))

         
             (schorpioen-tile-kies  level-adt (level-adt 'indicator) (level-adt 'indicator2) (level-adt 'schorpioen-timer) (level-adt 'schorpioen2-timer) nu-schorpioen-sneller-level2 nu-schorpioen2-sneller-level2 schorpioen-tile schorpioen-snel-tile)
               (schorpioen-teken-kies  level-adt (level-adt 'indicator))
            (schorpioen-teken-kies2  level-adt (level-adt 'indicator2))
             (remove-blauw-schorpioen level-adt)
             (remove-blauw-schorpioen2 level-adt)



             
           
         
            ((doolhof2 'draw-text) "Level 2" 20 10 450 "white")
            (teken-levens level-adt (level-adt 'vuurmier) (level-adt 'schorpioen-level2) (level-adt 'powerups) levens-min levens-extra doolhof2)
             (teken-levens level-adt (level-adt 'vuurmier) (level-adt 'schorpioen2-level2) (level-adt 'powerups) levens-min levens-extra doolhof2)
       
              

               (draw level-adt (level-adt 'vuurmier) level-adt))
            ((= huidig-level 3)
             (teken-voedsel! (level-adt 'voedsel-adt3))
             (teken-goud-voedsel! (level-adt 'voedsel2-adt3))
                 (teken-sleutels! (level-adt 'sleutels-level3))
             (teken-vuurmier! (level-adt 'vuurmier))
              
             (schorpioen-tile-kies  level-adt (level-adt 'indicator) (level-adt 'indicator2) (level-adt 'schorpioen-timer) (level-adt 'schorpioen2-timer) nu-schorpioen-sneller-level3 nu-schorpioen2-sneller-level3 schorpioen-tile schorpioen-snel-tile)
                (schorpioen-teken-kies  level-adt (level-adt 'indicator))
            (schorpioen-teken-kies2  level-adt (level-adt 'indicator2))
           
             (remove-blauw-schorpioen level-adt)
             (remove-blauw-schorpioen2 level-adt)


           
              (teken-score level-adt (level-adt 'vuurmier) (level-adt 'voedsel-adt3) appel-score doolhof3)
             (teken-score level-adt (level-adt 'vuurmier) (level-adt 'voedsel2-adt3) goud-appel-score doolhof3)
             (teken-levens level-adt (level-adt 'vuurmier) (level-adt 'schorpioen-level3) (level-adt 'powerups) levens-min levens-extra doolhof3)
             (teken-levens level-adt (level-adt 'vuurmier) (level-adt 'schorpioen2-level3) (level-adt 'powerups) levens-min levens-extra doolhof3)
              ((doolhof3 'draw-text) "Level 3" 20 10 450 "white")
               
           
             (draw level-adt (level-adt 'vuurmier) level-adt))
            ((= huidig-level 4)
             (draw level-adt (level-adt 'vuurmier) level-adt)))))
                   
         
           
         
      


    


      (define (teken-spel! spel-adt)
        (teken-level! (spel-adt 'level)))
    
  
                  
    
    
      ;;
      ;; Dispatch
      ;;
    
      (define (dispatch-teken-adt msg)
        (cond ((eq? msg 'set-toets-functie!) set-toets-functie!)
              ((eq? msg 'set-spel-lus-functie!) set-spel-lus-functie!)
              ((eq? msg 'teken-spel!) teken-spel!)))
      dispatch-teken-adt))
  ;ik heb meerdere procedures zelfde als de adt-teken van de snake spel, ik begreep de werking van die procedures en dus paste ik ze aan om ze te kunnen gebruiken in Fire Ant
  