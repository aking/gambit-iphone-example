;;; Hand edited versions for OpenGL ES 2.0 procedures that need a little extra help
;;; (mainly for memory/performace reasons)

(define glGetIntegerv (c-lambda (GLenum) GLint
#<<end-c-code
  GLint status = 0;
  glGetIntegerv(___arg1, &status);
  ___result = status;
end-c-code
))

(define glGetShaderiv (c-lambda (GLuint GLenum) GLint
#<<end-c-code
  GLint status = 0;
  glGetShaderiv(___arg1, ___arg2, &status);
  ___result = status;
end-c-code
))

(define glGetProgramiv (c-lambda (GLuint GLenum) GLint
#<<end-c-code
  GLint status = 0;
  glGetProgramiv(___arg1, ___arg2, &status);
  ___result = status;
end-c-code
))

(define glShaderSource (c-lambda (GLuint GLsizei char-string (pointer GLint)) void 
#<<end-c-code
  glShaderSource(___arg1, ___arg2, &___arg3, ___arg4);
end-c-code
))
