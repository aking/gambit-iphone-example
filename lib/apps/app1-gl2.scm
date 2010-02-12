;;;; "gl2-app1"
;;; load a vertex and fragment shader that displays a triagle
;;; 
;;; Author: Adam King

(include "../umbra/umbra.scm")

;;;; config
(define shader-reset #f)
(define shader-prg #f)

(define test-triangle
  (vector->float-array (vector  0.0  0.5  0.0
                               -0.5 -0.5  0.0
                                0.5 -0.5  0.0)))

;; ---------- Shaders -------------
(define fshader 
"precision mediump float;
void main() {
  gl_FragColor = vec4(0.0, 1.0, 0.0, 1.0);
}")

(define vshader 
"attribute vec4 vPosition;
void main() {
  gl_Position = vPosition;
}")


;; ---------- Main program -------------
(define (init)
  (load-test-shader))

(define (render)
  (if shader-prg
      (begin
        (gl-clear-color 0.0 1.0 1.0 1.0)
        (gl-clear color_buffer_bit:)
 
        (gl-use-program shader-prg)
        (gl-vertex-attrib-pointer 0 3 float: false: 0 test-triangle)
        (gl-enable-vertex-attrib-array 0)
        (gl-draw-arrays triangles: 0 3)))
      
  (if shader-reset
      (load-test-shader)))

(define (load-test-shader)
  (let [(prg-id (load-program vshader fshader))]
    (set! shader-reset #f)
    (if prog-id
        (set! shader-prg prg-id)
        (display "[load-test-shader] Failed to load shader programs"))))

(define (get-title)
  "Hello, GL ES2.0  - Gambit Scheme")
