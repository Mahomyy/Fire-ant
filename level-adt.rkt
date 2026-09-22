
(define (maak-adt-level aantal-cellen-breedte aantal-cellen-hoogte)
  (let*  ;ik maak start positie aan de hand van positie adt
         
      ((schorpioen-adt (maak-schorpioen-adt schorpioen-start-positie1))
       (schorpioen-adt2 (maak-schorpioen-adt schorpioen-start-positie2))
       (schorpioen-adt-level2 (maak-schorpioen-adt schorpioen-start-positie1-level2))
       (schorpioen-adt2-level2 (maak-schorpioen-adt schorpioen-start-positie2-level2))
       (schorpioen-adt-level3 (maak-schorpioen-adt schorpioen-start-positie1-level3))
       (schorpioen-adt2-level3 (maak-schorpioen-adt schorpioen-start-positie2-level3))
       (schorpioen-positie (schorpioen-adt 'positie))
       (schorpioen-positie2 (schorpioen-adt2 'positie))
       (schorpioen-positie-level2 (schorpioen-adt-level2 'positie))
       (schorpioen-positie2-level2 (schorpioen-adt2-level2 'positie))
       (schorpioen-positie-level3 (schorpioen-adt-level3 'positie))
       (schorpioen-positie2-level3 (schorpioen-adt2-level3 'positie))
       
       
       (voedsels (posities-objecten lijst-voedsel-level))
       (voedsels2 (posities-objecten lijst-voedsel2-level))
       (powerup-posities (posities-objecten-zonder-spelhoogte-en-breedte lijst-powerup))
         (powerup-posities2 (posities-objecten-zonder-spelhoogte-en-breedte lijst-powerup2))
       (powerups (adt-aanmaak powerup-posities  maak-op-te-rapen-objecten-adt))
       (powerups2 (adt-aanmaak powerup-posities2  maak-op-te-rapen-objecten-adt))
       (voedsel-level2 (posities-objecten lijst-voedsel-level2))
       (voedsel-level3 (posities-objecten lijst-voedsel-level3))
       (voedsel2-level2 (posities-objecten lijst-voedsel2-level2))
       (voedsel2-level3 (posities-objecten lijst-voedsel2-level3))
       (surfplank (posities-objecten-zonder-spelhoogte-en-breedte lijst-surfplank-level))
       (sleutel (posities-objecten-zonder-spelhoogte-en-breedte lijst-sleutels))
       (sleutels3 (posities-objecten-zonder-spelhoogte-en-breedte lijst-sleutels-level3)) 
       (voedsel-adt2-sleutels (adt-aanmaak sleutel maak-op-te-rapen-objecten-adt))
       (voedsel-adt2 (adt-aanmaak voedsel-level2 maak-op-te-rapen-objecten-adt))
       (voedsel-adt2-reserve (adt-aanmaak voedsel-level2 maak-op-te-rapen-objecten-adt))
       (voedsel-adt3 (adt-aanmaak voedsel-level3 maak-op-te-rapen-objecten-adt))
       (voedsel-adt3-reserve (adt-aanmaak voedsel-level3 maak-op-te-rapen-objecten-adt))
       (voedsel2-adt2 (adt-aanmaak voedsel2-level2 maak-op-te-rapen-objecten-adt))
       (voedsel2-adt2-reserve (adt-aanmaak voedsel2-level2 maak-op-te-rapen-objecten-adt))
       (voedsel2-adt3 (adt-aanmaak voedsel2-level3 maak-op-te-rapen-objecten-adt))
       (voedsel2-adt3-reserve (adt-aanmaak voedsel2-level3 maak-op-te-rapen-objecten-adt))
       (voedsel-adt3-sleutels (adt-aanmaak sleutels3 maak-op-te-rapen-objecten-adt))
       (voedsel-adt-reserve (adt-aanmaak voedsels maak-op-te-rapen-objecten-adt))
       (voedsel-adt (adt-aanmaak voedsels maak-op-te-rapen-objecten-adt))
       (voedsel2-adt (adt-aanmaak voedsels2 maak-op-te-rapen-objecten-adt))
         (voedsel2-adt-reserve (adt-aanmaak voedsels2 maak-op-te-rapen-objecten-adt))
       (voedsel-adt-surfplank  (adt-aanmaak surfplank maak-op-te-rapen-objecten-adt))
  
       (vuurmier-adt (maak-vuurmier-adt vuurmier-start-positie))
       (vuurmier-tijd 0)
       (schorpioen-tijd 0)
       (schorpioen2-tijd 0)
       (schorpioen-timer 0)
       (schorpioen2-timer 0)
       (bescherming-vuurmier #f)
       (bescherming-timer 0)
       (voedsel-tijd 0)
       (score 0)
       (hoogste-score 0)
       (indicator #f)
       (indicator2 #f)
       (levens 100))
       




    
   
       


    (define (vuurmier-eet-appel)
      (let ((vuurmier-positie (vuurmier-adt 'positie)))
        (set! voedsel-adt (map (lambda (xy-coordinaat) (if xy-coordinaat (if (not (and (= ((xy-coordinaat 'positie) 'x) (vuurmier-positie 'x))
                                                                                       (= ((xy-coordinaat 'positie) 'y) (vuurmier-positie 'y)))) xy-coordinaat
                                                                                                                                                 #f) #f)) voedsel-adt))
        voedsel-adt))
    
    (define (vuurmier-eet-gouden-appel)
      (let ((vuurmier-positie (vuurmier-adt 'positie)))
        (set! voedsel2-adt (map (lambda (xy-coordinaat) (if xy-coordinaat (if (not (and (= ((xy-coordinaat 'positie) 'x) (vuurmier-positie 'x))
                                                                                        (= ((xy-coordinaat 'positie) 'y) (vuurmier-positie 'y)))) xy-coordinaat
                                                                                                                                                  #f) #f)) voedsel2-adt))
        voedsel2-adt))

    (define (verander-score-op-scherm x voedsel-adt)
      
      (let  
          ((vuurmier-positie (vuurmier-adt 'positie)))
              
              
        (for-each (lambda (xy-coordinaat) (if xy-coordinaat (if  (and (= ((xy-coordinaat 'positie) 'x) (vuurmier-positie 'x)) (= ((xy-coordinaat 'positie) 'y) (vuurmier-positie 'y)))
                                                                 (set! score (+ score x))))) voedsel-adt)))

    (define (verander-levens-powerup x powerups)
      
      (let  
          ((vuurmier-positie (vuurmier-adt 'positie)))
              
              
        (for-each (lambda (xy-coordinaat) (if xy-coordinaat (if  (and (= ((xy-coordinaat 'positie) 'x) (vuurmier-positie 'x)) (= ((xy-coordinaat 'positie) 'y) (vuurmier-positie 'y)))
                                                                 (set! levens (+ levens x))))) powerups)))

    (define (verander-levens-schoprioen x schorpioen-adt)
      (let  
          ((vuurmier-positie (vuurmier-adt 'positie)))
        (cond
          ((and (and (= ((schorpioen-adt 'positie) 'x) (vuurmier-positie 'x)) (= ((schorpioen-adt 'positie) 'y) (vuurmier-positie 'y))) (equal? bescherming-vuurmier #f))
           (set! levens (- levens x))))))




    

    
    (define (verander-hoogste-score-op-scherm )

      (if
       (> score hoogste-score)
       (set! hoogste-score score)))
    
      
 


    
    (define (vuurmier-eet-appel-level2)
      (let ((vuurmier-positie (vuurmier-adt 'positie)))
        (set! voedsel-adt2 (map (lambda (xy-coordinaat) (if xy-coordinaat (if (not (and (= ((xy-coordinaat 'positie) 'x) (vuurmier-positie 'x))
                                                                                        (= ((xy-coordinaat 'positie) 'y) (vuurmier-positie 'y)))) xy-coordinaat
                                                                                                                                                  #f) #f)) voedsel-adt2))
        voedsel-adt2))
        
        
    (define (vuurmier-eet-gouden-appel-level2)
      (let ((vuurmier-positie (vuurmier-adt 'positie)))
        (set! voedsel2-adt2 (map (lambda (xy-coordinaat) (if xy-coordinaat (if (not (and (= ((xy-coordinaat 'positie) 'x) (vuurmier-positie 'x))
                                                                                         (= ((xy-coordinaat 'positie) 'y) (vuurmier-positie 'y)))) xy-coordinaat
                                                                                                                                                   #f) #f)) voedsel2-adt2))
        voedsel2-adt2))
    
    (define (vuurmier-eet-appel-level3)
      (let ((vuurmier-positie (vuurmier-adt 'positie)))
        (set! voedsel-adt3 (map (lambda (xy-coordinaat) (if xy-coordinaat (if (not (and (= ((xy-coordinaat 'positie) 'x) (vuurmier-positie 'x))
                                                                                        (= ((xy-coordinaat 'positie) 'y) (vuurmier-positie 'y)))) xy-coordinaat
                                                                                                                                                  #f) #f)) voedsel-adt3))
        voedsel-adt3))

        
    (define (vuurmier-eet-gouden-appel-level3)
      (let ((vuurmier-positie (vuurmier-adt 'positie)))
        (set! voedsel2-adt3 (map (lambda (xy-coordinaat) (if xy-coordinaat (if (not (and (= ((xy-coordinaat 'positie) 'x) (vuurmier-positie 'x))
                                                                                         (= ((xy-coordinaat 'positie) 'y) (vuurmier-positie 'y)))) xy-coordinaat
                                                                                                                                                   #f) #f)) voedsel2-adt3))
        voedsel2-adt3))
    
    (define (vuurmier-neemt-surfplank)
      (let ((vuurmier-positie (vuurmier-adt 'positie)))
        (set! voedsel-adt-surfplank (map (lambda (xy-coordinaat) (if xy-coordinaat (if (not (and (= ((xy-coordinaat 'positie) 'x) (vuurmier-positie 'x))
                                                                                                 (= ((xy-coordinaat 'positie) 'y) (vuurmier-positie 'y)))) xy-coordinaat
                                                                                                                                                           #f) #f)) voedsel-adt-surfplank))
        voedsel-adt-surfplank))
    (define (vuurmier-neemt-powerup1)
      (let ((vuurmier-positie (vuurmier-adt 'positie)))
        (set! powerups (map (lambda (xy-coordinaat) (if xy-coordinaat (if (not (and (= ((xy-coordinaat 'positie) 'x) (vuurmier-positie 'x))
                                                                                    (= ((xy-coordinaat 'positie) 'y) (vuurmier-positie 'y)))) xy-coordinaat
                                                                                                                                              #f) #f)) powerups))
        powerups))
(define (vuurmier-neemt-powerup2)
      (let ((vuurmier-positie (vuurmier-adt 'positie)))
        (set! powerups2 (map (lambda (xy-coordinaat) (if xy-coordinaat (if (not (and (= ((xy-coordinaat 'positie) 'x) (vuurmier-positie 'x))
                                                                                    (= ((xy-coordinaat 'positie) 'y) (vuurmier-positie 'y)))) xy-coordinaat
                                                                                                                                              #f) #f)) powerups2))
        powerups2))
    
    (define (vuurmier-neemt-sleutel2)
      (let ((vuurmier-positie (vuurmier-adt 'positie)))
        (set! voedsel-adt2-sleutels (map (lambda (xy-coordinaat) (if xy-coordinaat (if (not (and (= ((xy-coordinaat 'positie) 'x) (vuurmier-positie 'x))
                                                                                                 (= ((xy-coordinaat 'positie) 'y) (vuurmier-positie 'y)))) xy-coordinaat
                                                                                                                                                           #f) #f)) voedsel-adt2-sleutels))
        voedsel-adt2-sleutels))

    (define (vuurmier-neemt-sleutel3)
      (let ((vuurmier-positie (vuurmier-adt 'positie)))
        (set! voedsel-adt3-sleutels (map (lambda (xy-coordinaat) (if xy-coordinaat (if (not (and (= ((xy-coordinaat 'positie) 'x) (vuurmier-positie 'x))
                                                                                                 (= ((xy-coordinaat 'positie) 'y) (vuurmier-positie 'y)))) xy-coordinaat
                                                                                                                                                           #f) #f)) voedsel-adt3-sleutels))
        voedsel-adt3-sleutels))
  
    (define (neemt-vuurmier-surfplank! vuurmier-adt)
      (let ((vuurmier-positie (vuurmier-adt 'positie)))
        ((vuurmier-adt 'vuurmier-heeft-puzzel!) vuurmier-positie)))


    
    (define current-level huidig-level)          
                           

    (define (richting-verandering richting)
      (cond
        ((eq? richting 'links) 'rechts)
        ((eq? richting 'recht ) 'links)))

    (define (schorpioen-pad1 positie-schorpioen schorpioen-adt schorpioen-start-positie schorpioen-eind-positie)
      (cond 
        ((= (positie-schorpioen 'x)(schorpioen-start-positie 'x))((schorpioen-adt 'richting) 'rechts)((schorpioen-adt 'schorpioen-beweegt!) 'rechts))
        ((= (positie-schorpioen 'x)(schorpioen-eind-positie 'x))  ((schorpioen-adt 'richting) 'links)  ((schorpioen-adt 'schorpioen-beweegt!) 'links))
        (else ((schorpioen-adt 'schorpioen-beweegt!)((schorpioen-adt 'richting-geven))))))

    (define (schorpioen-random-pad schorpioen-adt2)
      ((schorpioen-adt2 'schorpioen-beweegt!)    ((schorpioen-adt2 'schorpioen-random-richting) (random 4))))

(define (schorpioen-beweging1  x y z h b a g )
(if (> schorpioen-timer x)
             (if (> schorpioen-tijd (- y z))
                 (begin
                   (schorpioen-pad1 h b a g)
                   (set! schorpioen-tijd 0)))
      
             (if (> schorpioen-tijd y)
                 (begin
                   (schorpioen-pad1 h b a g)
                   (set! schorpioen-tijd 0)))))


(define (verander-bescherming-vuurmier delta-tijd)
     (map (lambda (x)
               (if (equal? x #f)   (if (< bescherming-timer 17000)
                                       (begin
                                         (set! bescherming-timer (+ bescherming-timer delta-tijd))
                         (set! bescherming-vuurmier #t))
                         (set! bescherming-vuurmier #f)))) powerups2))
    
 



    

(define (schorpioen-beweging2  x y z b)
(if (> schorpioen2-timer x)
             (if (> schorpioen2-tijd (- y z))
                 (begin
                   (schorpioen-random-pad b)
                   (set! schorpioen2-tijd 0)))
      
             (if (> schorpioen2-tijd y)
                 (begin
                   (schorpioen-random-pad b)
                   (set! schorpioen2-tijd 0)))))
    
      
(define (indicator-kleur-schorpioen nu-schorpioen-sneller-level nu-schorpioen2-sneller-level)
  (cond
   ((> schorpioen-timer  nu-schorpioen-sneller-level)
   (set! indicator #t))
   (else
       (set! indicator #f)))
 (cond
   ((> schorpioen2-timer  nu-schorpioen2-sneller-level)
   (set! indicator2 #t))
   (else
       (set! indicator2 #f))))

  


  
   
    
    (define (beweeg-schorpioen!)
          
      (cond
        ((= huidig-level 1)
         (schorpioen-beweging1 nu-schorpioen-sneller-level1 schorpioen-snelheid-level1 sneller1 (schorpioen-adt 'positie) schorpioen-adt schorpioen-start-positie1 schorpioen-eind-positie1)

         (if (> schorpioen-timer (+ nu-schorpioen-sneller-level1 seconden-snel))
             (set! schorpioen-timer 0)))
        ((= huidig-level 2)
          
         (schorpioen-beweging1 nu-schorpioen-sneller-level2 schorpioen-snelheid-level2 sneller2 (schorpioen-adt-level2 'positie) schorpioen-adt-level2 schorpioen-start-positie1-level2 schorpioen-eind-positie1-level2)

         (if (> schorpioen-timer (+ nu-schorpioen-sneller-level2 seconden-snel))
             (set! schorpioen-timer 0)))
        ((= huidig-level 3)
         
         (schorpioen-beweging1 nu-schorpioen-sneller-level3 schorpioen-snelheid-level3 sneller3 (schorpioen-adt-level3 'positie) schorpioen-adt-level3 schorpioen-start-positie1-level3 schorpioen-eind-positie1-level3)

         (if (> schorpioen-timer (+ nu-schorpioen-sneller-level3 seconden-snel))
             (set! schorpioen-timer 0)
             ))))
 

    
            
    (define (beweeg-schorpioen2!)
      (cond
        ((= huidig-level 1)
          (schorpioen-beweging2 nu-schorpioen2-sneller-level1 schorpioen2-snelheid-level1 sneller1 schorpioen-adt2)
          (if (> schorpioen2-timer (+ nu-schorpioen2-sneller-level1 seconden-snel))
             (set! schorpioen2-timer 0)))
        ((= huidig-level 2)
         (schorpioen-beweging2 nu-schorpioen2-sneller-level2 schorpioen2-snelheid-level2 sneller2 schorpioen-adt2-level2)
         (if (> schorpioen2-timer (+ nu-schorpioen2-sneller-level2 seconden-snel))
             (set! schorpioen2-timer 0)))
        ((= huidig-level 3)
    (schorpioen-beweging2 nu-schorpioen2-sneller-level3 schorpioen2-snelheid-level3 sneller3 schorpioen-adt2-level3)
    (if (> schorpioen2-timer (+ nu-schorpioen2-sneller-level3 seconden-snel))
             (set! schorpioen2-timer 0)))))



              
            
  
      
        
    
    (define (draai-vuurmier! toets)
      (cond
        ((or (= current-level 1) (= current-level 2) (= current-level 3))
      (cond
        ((eq? toets 'right)
         ((vuurmier-adt 'vuurmier-beweegt!) 'rechts))
        ((eq? toets 'left)
         ((vuurmier-adt 'vuurmier-beweegt!) 'links))
        ((eq? toets 'up)
         ((vuurmier-adt 'vuurmier-beweegt!) 'omhoog))
        ((eq? toets 'down)
         ((vuurmier-adt 'vuurmier-beweegt!) 'omlaag))))))

    (define (update! delta-tijd)
      (cond
        ((= current-level 1)
         
         (neemt-vuurmier-surfplank! vuurmier-adt)
         (verander-score-op-scherm appel-score voedsel-adt)
         (verander-score-op-scherm goud-appel-score voedsel2-adt)
         (verander-hoogste-score-op-scherm )
         (verander-levens-schoprioen 10 schorpioen-adt)
         (verander-levens-schoprioen 10 schorpioen-adt2)
         (vuurmier-neemt-powerup2)
         (vuurmier-eet-appel)
         (vuurmier-eet-gouden-appel)
         (level-change)
         (vergelijk)
         (vuurmier-raakt-schorpioen)
         (vuurmier-neemt-surfplank)
         (set! schorpioen2-tijd (+ schorpioen2-tijd delta-tijd))
         (set! schorpioen-timer (+ schorpioen-timer delta-tijd))
         (set! schorpioen-tijd (+ schorpioen-tijd delta-tijd))
                  (set! schorpioen2-timer (+ schorpioen2-timer delta-tijd))
 (verander-bescherming-vuurmier delta-tijd)

         (beweeg-schorpioen2!)
         (beweeg-schorpioen!)
        (indicator-kleur-schorpioen nu-schorpioen-sneller-level1 nu-schorpioen2-sneller-level1))
         
        ((= current-level 2)
         (neemt-vuurmier-surfplank! vuurmier-adt)
 
         
         (verander-score-op-scherm appel-score voedsel-adt2)
         (verander-score-op-scherm goud-appel-score voedsel2-adt2)
         (verander-hoogste-score-op-scherm )
         (verander-levens-powerup levens-extra powerups)
         (verander-levens-schoprioen 10 schorpioen-adt-level2)
         (verander-levens-schoprioen 10 schorpioen-adt2-level2)
         (vuurmier-neemt-powerup1)
         (vuurmier-eet-appel-level2)
         (vuurmier-eet-gouden-appel-level2)
         (vuurmier-neemt-sleutel2)
         (level-change)
         (vergelijk)
         (vuurmier-raakt-schorpioen)
         (set! schorpioen-timer (+ schorpioen-timer delta-tijd))
          (set! schorpioen2-timer (+ schorpioen2-timer delta-tijd))

         (set! schorpioen2-tijd (+ schorpioen2-tijd delta-tijd))
         (set! schorpioen-tijd (+ schorpioen-tijd delta-tijd))
         (beweeg-schorpioen2!)
         
      
         (beweeg-schorpioen!)
          (indicator-kleur-schorpioen  nu-schorpioen-sneller-level2 nu-schorpioen2-sneller-level2)
          (set! bescherming-vuurmier #f))
        ((= current-level 3)
         (neemt-vuurmier-surfplank! vuurmier-adt)
         (verander-score-op-scherm appel-score voedsel-adt3)
         (verander-score-op-scherm goud-appel-score voedsel2-adt3)
         (verander-hoogste-score-op-scherm )
         (verander-levens-schoprioen 10 schorpioen-adt-level3)
         (verander-levens-schoprioen 10 schorpioen-adt2-level3)
         (vuurmier-neemt-sleutel3)
            
         (vuurmier-eet-appel-level3)
         (vuurmier-eet-gouden-appel-level3)
         (level-change)
         (vergelijk)
         (vuurmier-raakt-schorpioen)
      (set! schorpioen-timer (+ schorpioen-timer delta-tijd))
          (set! schorpioen2-timer (+ schorpioen2-timer delta-tijd))

         (set! schorpioen2-tijd (+ schorpioen2-tijd delta-tijd))
         (set! schorpioen-tijd (+ schorpioen-tijd delta-tijd))
         (set! bescherming-vuurmier #f)
         (beweeg-schorpioen2!)
         (beweeg-schorpioen!)
         (indicator-kleur-schorpioen  nu-schorpioen-sneller-level3 nu-schorpioen2-sneller-level3)
         )))
        
        
     
   
    (define (toets! toets)
      (draai-vuurmier!  toets))

    
    (define (vuurmier-raakt-schorpioen)
      (if (vergelijk)
          (cond
            ((= huidig-level 1)
         
          
          ((vuurmier-adt 'positie!) vuurmier-start-positie)
          (set! voedsel-adt voedsel-adt-reserve)
          (set! voedsel2-adt voedsel2-adt-reserve)
          )
           
             
         
            
           
             ((= huidig-level 2)
          
          ((vuurmier-adt 'positie!) vuurmier-start-positie)
          (set! voedsel-adt2 voedsel-adt2-reserve)
           (set! voedsel2-adt2 voedsel2-adt2-reserve)
          )
              ((= huidig-level 3)
         
          ((vuurmier-adt 'positie!) vuurmier-start-positie)
          (set! voedsel-adt3 voedsel-adt3-reserve)
           (set! voedsel2-adt3 voedsel2-adt3-reserve)))))
             
             


      
    (define (vergelijk)
      (let ((vuurmier-positie (vuurmier-adt 'positie))
            (schorpioen-positie (schorpioen-adt 'positie))
            (schorpioen-positie2 (schorpioen-adt2 'positie))
            (schorpioen-positie-level2 (schorpioen-adt-level2 'positie))
            (schorpioen-positie2-level2 (schorpioen-adt2-level2 'positie))
            (schorpioen-positie-level3 (schorpioen-adt-level3 'positie))
            (schorpioen-positie2-level3 (schorpioen-adt2-level3 'positie)))
          
          
        (cond
          ((= huidig-level 1)
          (or (and (= (vuurmier-positie 'x)(schorpioen-positie 'x)) (= (vuurmier-positie 'y)(schorpioen-positie 'y)))
               (and (= (vuurmier-positie 'x)(schorpioen-positie2 'x)) (= (vuurmier-positie 'y)(schorpioen-positie2 'y)))))

               
          ((= huidig-level 2)  
           (or  (and (= (vuurmier-positie 'x)(schorpioen-positie-level2 'x)) (= (vuurmier-positie 'y)(schorpioen-positie-level2 'y)))
                (and (= (vuurmier-positie 'x)(schorpioen-positie2-level2 'x)) (= (vuurmier-positie 'y)(schorpioen-positie2-level2 'y)))))
          ((= huidig-level 3)      
           (or  (and (= (vuurmier-positie 'x)(schorpioen-positie-level3 'x)) (= (vuurmier-positie 'y)(schorpioen-positie-level3 'y)))
                (and (= (vuurmier-positie 'x)(schorpioen-positie2-level3 'x)) (= (vuurmier-positie 'y)(schorpioen-positie2-level3 'y))))))))
            
            


  
   


    (define (level-change)
      (let ((vuurmier-positie (vuurmier-adt 'positie)))
        (if
         (and (or (= (vuurmier-positie 'x) 2)  (= (vuurmier-positie 'x) 1))   (= (vuurmier-positie 'y) 16))
         (cond ((= current-level 1)
                (set! current-level 2)
                ((vuurmier-adt 'positie!) vuurmier-start-positie)
                  (set! schorpioen-tijd 0)
       (set! schorpioen2-tijd 0)
       (set! schorpioen-timer 0)
       (set! schorpioen2-timer 0)
       
       )
               
               ((= current-level 2)
                (set! current-level 3)
                ((vuurmier-adt 'positie!) vuurmier-start-positie)
                 (set! schorpioen-tijd 0)
                 
       (set! schorpioen2-tijd 0)
       (set! schorpioen-timer 0)
       (set! schorpioen2-timer 0))
       
                
               ((= current-level 3)
                (set! current-level 4))))))
           
            
                                                     
                                                              
    (define (dispatch-level msg)
      (cond
        ((eq? msg 'update!) update!)
        ((eq? msg 'toets!) toets!)
        ((eq? msg 'vuurmier) vuurmier-adt)
        ((eq? msg 'schorpioen) schorpioen-adt)
        ((eq? msg 'schorpioen2) schorpioen-adt2)
        ((eq? msg 'schorpioen-level2) schorpioen-adt-level2)
        ((eq? msg 'schorpioen2-level2) schorpioen-adt2-level2)
        ((eq? msg 'schorpioen-level3) schorpioen-adt-level3)
        ((eq? msg 'schorpioen2-level3) schorpioen-adt2-level3)
        ((eq? msg 'vuurmier-raakt-schorpioen) vuurmier-raakt-schorpioen)
        ((eq? msg 'voedsel-adt) voedsel-adt)
        ((eq? msg 'voedsel-adt2) voedsel-adt2)
        ((eq? msg 'voedsel-adt3) voedsel-adt3)
        ((eq? msg 'voedsel2-adt) voedsel2-adt)
        ((eq? msg 'voedsel2-adt2) voedsel2-adt2)
        ((eq? msg 'voedsel2-adt3) voedsel2-adt3)
        ((eq? msg 'powerups) powerups)
        ((eq? msg 'powerups2) powerups2)
        ((eq? msg 'surfplank) voedsel-adt-surfplank)
        ((eq? msg 'sleutel) voedsel-adt2-sleutels)
        ((eq? msg 'sleutels-level3) voedsel-adt3-sleutels)

        ((eq? msg 'score) score)
        ((eq? msg 'hoogste-score) hoogste-score)
        ((eq? msg 'levens) levens)
        ((eq? msg 'current-level) current-level)
        ((eq? msg 'schorpioen-timer) schorpioen-timer)
        ((eq? msg 'bescherming-vuurmier) bescherming-vuurmier)
        ((eq? msg 'indicator) indicator)
        ((eq? msg 'schorpioen2-timer) schorpioen2-timer)
        ((eq? msg 'indicator2) indicator2)
        ((eq? msg 'schorpioen-tijd) schorpioen-tijd)

        ))
        
    dispatch-level))



   
         

