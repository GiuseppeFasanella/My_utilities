	
Creates a 250x250 picture all blue and saves it under c:\temp\ex_01.jpg
ex_01.scm
(define (ex_01)

  (let* (
          (my_image (car (gimp-image-new 250 250 RGB      )))

          (my_layer (car (gimp-layer-new my_image 250 250 RGB-IMAGE "my layer" 0 NORMAL)))
        )

        (gimp-image-add-layer my_image my_layer 0)

        (gimp-context-set-background '(000 000 255))

        (gimp-drawable-fill my_layer BACKGROUND-FILL)

        (gimp-file-save RUN-NONINTERACTIVE my_image my_layer "c:\\temp\\ex_01.jpg" "c:\\temp\\ex_01.jpg")
  )
)
c:\> start gimp-2.2.exe -d -i -b  "(ex_01)" "(gimp-quit 0)"
