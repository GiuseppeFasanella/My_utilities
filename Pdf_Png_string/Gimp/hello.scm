(define (hello)

  (let* (
          (my_image (car (gimp-image-new 250 250 RGB      )))

          (my_layer (car (gimp-layer-new my_image 250 250 RGB-IMAGE "my layer" 100 NORMAL)))
        )

        (gimp-image-add-layer my_image my_layer 0)

        (gimp-context-set-background '(000 063 127))
        (gimp-context-set-foreground '(063 127 000))

        (gimp-drawable-fill my_layer BACKGROUND-FILL)

        (gimp-floating-sel-anchor  (car (gimp-text-fontname my_image my_layer 10 10 "Hello World" 0 TRUE 30 PIXELS "Arial")))

;       (gimp-display-new my_image)                                                                                                                                             

        (gimp-file-save RUN-NONINTERACTIVE my_image my_layer "hello.jpg" "")
  )
)
