
(declare (block)
         (standard-bindings)
         (extended-bindings))

(define (make-vec2d x y) (f64vector x y))
(define (vec2d-x v) (f64vector-ref v 0))
(define (vec2d-y v) (f64vector-ref v 1))

(define (vec2d-add v1 v2)
  (make-vec2d (fl+ (vec2d-x v1) (vec2d-x v2))
              (fl+ (vec2d-y v1) (vec2d-y v2))))

(define (vec2d-sub v1 v2)
  (make-vec2d (fl- (vec2d-x v1) (vec2d-x v2))
              (fl- (vec2d-y v1) (vec2d-y v2))))

(define (vec2d-length v1)
  (flsqrt (fl+ (fl* (vec2d-x v1) (vec2d-x v1))
               (fl* (vec2d-y v1) (vec2d-y v1)))))

(define (vec2d-scalar-mul v1 f)
  (make-vec2d (fl* (vec2d-x v1) f)
              (fl* (vec2d-y v1) f)))

(define (make-vec3d x y z) (f64vector x y z))
(define (vec3d-x v) (f64vector-ref v 0))
(define (vec3d-y v) (f64vector-ref v 1))
(define (vec3d-z v) (f64vector-ref v 2))
(define (vec3d-x-set! v f) (f64vector-set! v 0 f))
(define (vec3d-y-set! v f) (f64vector-set! v 1 f))
(define (vec3d-z-set! v f) (f64vector-set! v 2 f))

(define (make-vec4d x y z w) (f64vector x y z w))
(define (vec4d-x v) (f64vector-ref v 0))
(define (vec4d-y v) (f64vector-ref v 1))
(define (vec4d-z v) (f64vector-ref v 2))
(define (vec4d-w v) (f64vector-ref v 3))

(define (vec3d-op v1 v2 op)
  (make-vec3d (op (vec3d-x v1) (vec3d-x v2))
              (op (vec3d-y v1) (vec3d-y v2))
              (op (vec3d-z v1) (vec3d-z v2))))

(define (vec3d-add v1 v2)
  (declare (inlining-limit 10000))
  (vec3d-op v1 v2 fl+))

(define (vec3d-sub v1 v2)
  (declare (inlining-limit 10000))
  (vec3d-op v1 v2 fl-))

(define (vec3d-component-mul v1 v2)
  (declare (inlining-limit 10000))
  (vec3d-op v1 v2 fl*))

(define (vec3d-scalar-mul v1 f)
  (make-vec3d (fl* (vec3d-x v1) f)
              (fl* (vec3d-y v1) f)
              (fl* (vec3d-z v1) f)))

(define (vec3d-length v1)
  (declare (inlining-limit 10000))
  (flsqrt (vec3d-dot v1 v1)))

(define (vec3d-unit v1)
  (declare (inlining-limit 10000))
  (vec3d-scalar-mul v1 (fl/ (vec3d-length v1))))

(define (vec3d-dot v1 v2)
  (fl+ (fl* (vec3d-x v1) (vec3d-x v2))
       (fl* (vec3d-y v1) (vec3d-y v2))
       (fl* (vec3d-z v1) (vec3d-z v2))))

(define (vec3d-cross v1 v2)
  (let ((v1-x (vec3d-x v1)) (v2-x (vec3d-x v2))
	(v1-y (vec3d-y v1)) (v2-y (vec3d-y v2))
	(v1-z (vec3d-z v1)) (v2-z (vec3d-z v2)))
    (make-vec3d (fl- (fl* v1-y v2-z(vec3d-z v2))
		     (fl* v1-z v2-y))
		(fl- (fl* v1-z v2-x)
		     (fl* v1-x v2-z))
		(fl- (fl* v1-x v2-y)
		     (fl* v1-y v2-x)))))

(define (vec4d-add v1 v2)
  (make-vec4d (+ (vec4d-x v1) (vec4d-x v2))
              (+ (vec4d-y v1) (vec4d-y v2))
              (+ (vec4d-z v1) (vec4d-z v2))
              (+ (vec4d-w v1) (vec4d-w v2))))
