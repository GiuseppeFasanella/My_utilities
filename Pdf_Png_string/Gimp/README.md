gimp -i -b '(select "foo.png")' -b '(gimp-quit 0)'

Lo script va messo qui

/home/gfasanel/.gimp-2.6/scripts/select.scm

 (define (simple-unsharp-mask filename
                              radius
                                    amount
                                          threshold)
   (let* ((image (car (gimp-file-load RUN-NONINTERACTIVE filename filename)))
          (drawable (car (gimp-image-get-active-layer image))))
     (plug-in-unsharp-mask RUN-NONINTERACTIVE
                                              image drawable radius amount threshold)
     (gimp-file-save RUN-NONINTERACTIVE image drawable filename filename)
     (gimp-image-delete image)))

