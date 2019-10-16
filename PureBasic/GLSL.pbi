; ============================================================================
;  raafal.view.shaders.pbi
; ............................................................................
;  Viewport OpenGL shader functions
; ============================================================================
;  2013/04/12 | Ben Malartre
;  - creation
; ============================================================================

;-----------------------------------------------------------------------------
; Utilities
;-----------------------------------------------------------------------------
;-----------------------------------------
; Get GLFW String Output
;-----------------------------------------
CompilerIf #PB_Compiler_Unicode
  Macro GLGETSTRINGOUTPUT(str_ptr)
   PeekS(str_ptr,-1,#PB_Ascii)
  EndMacro
CompilerElse
  Macro GLGETSTRINGOUTPUT(str_ptr)
    PeekS(str_ptr)
  EndMacro
CompilerEndIf
;-------------------------------------------
; Translate Shader
;-------------------------------------------
Procedure.s GLSLDeCodeUnicodeShader(unicode.s)
  Protected l = StringByteLength(unicode,#PB_Unicode)
  Protected *mem = AllocateMemory(l)
  PokeS(*mem,unicode,-1,#PB_Ascii)
  Protected s.s = PeekS(*mem,l)
  FreeMemory(*mem)
  ProcedureReturn s
EndProcedure

;-------------------------------------
; Output Compile Log
;-------------------------------------
Procedure GLSLOutputCompileLog(shader)
  Protected buffer = AllocateMemory(512)
  glGetShaderInfoLog(shader,512,#Null,buffer)
  ;Debug "------------- Compile GLSL ----------------"
  CompilerIf #PB_Compiler_Unicode
    Debug PeekS(buffer,512,#PB_Ascii)
  CompilerElse
    Debug PeekS(buffer,512)
  CompilerEndIf
  
  FreeMemory(buffer)
EndProcedure


;-------------------------------------
; Create GLSL Shader
;-------------------------------------
Procedure GLSLCreateShader(*code,type.i)
  Protected shader.GLuint = glCreateShader(type)
  glShaderSource(shader,1,@*code,#Null)
  glCompileShader(shader)
  
;   Protected status.i
;   glGetShaderiv(shader,#GL_COMPILE_STATUS,@status)
;   If status = #True
;     Debug "[GLSLCreateShader] Success Compiling Shader"
;   Else
;     Debug "[GLSLCreateShader] Fail Compiling Shader"
;   EndIf
;   
;   ;Output Compile Log
;   GLSLOutputCompileLog(shader)
  
  ProcedureReturn shader
EndProcedure

;-------------------------------------
; Load GLSL Shader From File
;-------------------------------------
Procedure.s GLSLLoadShaderFile(filename.s)
  If ReadFile(0,filename)
    Protected length = FileSize(filename)
    Protected shader.s = ReadString(0,#PB_Ascii|#PB_File_IgnoreEOL,length)
    CloseFile(0) 
  EndIf
  
  CompilerIf #PB_Compiler_Unicode
    shader = GLSLDeCodeUnicodeShader(shader)
  CompilerEndIf
  
  ProcedureReturn shader
EndProcedure


Enumeration
  #GL_SHADER_PROGRAM_UNIQUEID
  #GL_SHADER_PROGRAM_WIREFRAME
  #GL_SHADER_PROGRAM_SIMPLE
  #GL_SHADER_PROGRAM_POLYMESH
  #GL_SHADER_PROGRAM_POINTCLOUD
  #GL_SHADER_PROGRAM_MULTI
  #GL_SHADER_PROGRAM_SCREENSPACEQUAD
  #GL_SHADER_PROGRAM_SHADOWMAP
  #GL_SHADER_PROGRAM_POSTPROCESS
  #GL_SHADER_PROGRAM_BLUR
  #GL_SHADER_PROGRAM_DESATURATE
EndEnumeration

;--------------------------------------
; Create Simple GLSL program
;--------------------------------------
Procedure GLSLCreateProgram(vertex.s, fragment.s, deb.b)
  Protected code.s
  Protected vert.GLuint, frag.GLuint

  vert = GLSLCreateShader(@vertex,#GL_VERTEX_SHADER)
  If deb : Debug "Create Vertex Shader : "+Str(glGetError()) : EndIf
  GLSLOutputCompileLog(vert)
  frag = GLSLCreateShader(@fragment,#GL_FRAGMENT_SHADER)
  If deb : Debug "Create Fragment Shader : "+Str(glGetError()) : EndIf
  GLSLOutputCompileLog(frag)
  If deb : Debug "Create Shaders : "+Str(glGetError()) : EndIf

  
  Protected program.GLuint = glCreateProgram()
  If deb : Debug "Create Program : "+Str(glGetError()) : EndIf
  glAttachShader(program,vert)
  If deb : Debug "Attach Vertex Shader "+Str(glGetError()) : EndIf
  
  glAttachShader(program,frag) 
  If deb : Debug "Attach Fragment Shader "+Str(glGetError()) : EndIf
  
  Protected paramName.s = "outColor"
  glBindFragDataLocation(program,0,@paramName)
  If deb : Debug "Bind Frag Data Location"+Str(glGetError()) : EndIf
;   glBindAttribLocation(program,0,"position")
  
  glLinkProgram(program)
  If deb : Debug "Link Program : "+Str(glGetError()) : EndIf
  
  glUseProgram(program)
  If deb : Debug "Use Program : "+Str(glGetError()) : EndIf
  
  Define *mem = AllocateMemory(1024)
  Define l.GLsizei
  glGetProgramInfoLog(program,1024,@l,*mem)
  Debug "Get Shader Info Log : "+GLGETSTRINGOUTPUT(*mem)
  FreeMemory(*mem)
      
  ProcedureReturn program
EndProcedure







    
; IDE Options = PureBasic 5.42 LTS (MacOS X - x64)
; CursorPosition = 134
; FirstLine = 123
; Folding = --
; EnableXP