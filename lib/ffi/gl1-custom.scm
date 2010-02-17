;;; Hand edited versions for OpenGL ES 1.1 procedures that need a little extra help
;;; (mainly for memory/performance reasons)

(define glGetInteger* (c-lambda (GLenum) GLint
#<<end-c-code
  GLint status = 0;
  glGetIntegerv(___arg1, &status);
  ___result = status;
end-c-code
))



