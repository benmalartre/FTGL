XIncludeFile "GLFW3.pbi"
XIncludeFile "GL.pbi"
XIncludeFile "GLSL.pbi"
XIncludeFile "Utils.pbi"

EnableExplicit

#FT_SIZE_PX = 46

Structure FTGL_GlyphInfos
  ax.f  ;	// advance.x
	ay.f  ;	// advance.y

	bw.f  ;	// bitmap.width
	bh.f  ;	// bitmap.height

	bl.f  ;	// bitmap.left
	bt.f  ;	// bitmap.top
	tx.f  ;	// x offset of glyph in texture coordinates
EndStructure

Structure FTGL_FontAtlas
  metadata.FTGL_GlyphInfos[256]
  width.i
  height.i
  size_px.i
	*buffer
EndStructure

Structure FTGL_Face
  v.f[16]
EndStructure

Structure FTGL_Color
  r.f
  g.f
  b.f
  a.f
EndStructure

Structure FTGL_Drawer
  *atlas.FTGL_FontAtlas
  color.FTGL_Color
  vao.GLuint
  vbo.GLuint
  tex.GLuint
  shader.GLuint
EndStructure

Structure FTGL_Point
  x.f
  y.f
  s.f
  t.f
EndStructure

ImportC "/Users/benmalartre/Documents/RnD/FTGL/FontAtlas/freetype.a" : EndImport
ImportC "/Users/benmalartre/Documents/RnD/FTGL/FontAtlas/ftgl.a"
  FT_CreateFontAtlas(file_name.p-utf8,size_px.l)
  FT_DeleteFontAtlas(*atlas.FTGL_FontAtlas)
;   FT_GetAtlasWidth(*atlas.FTGL_FontAtlas)
;   FT_GetAtlasHeight(*atlas.FTGL_FontAtlas)
;   FT_GetAtlasBuffer(*atlas.FTGL_FontAtlas,*buffer)
;   FT_GetGlyphMetadatas(*atlas.FTGL_FontAtlas,ID.i)
EndImport  


Procedure FTGL_SetPoint(*mem,id.i,x.f,y.f,s.f,t.f)
  Protected *pnt.FTGL_Point = *mem + id*SizeOf(FTGL_Point)
  *pnt\x = x
  *pnt\y = y
  *pnt\s = s
  *pnt\t = t
EndProcedure

;-------------------------------------------------------------------------------------
; Set Color
;-------------------------------------------------------------------------------------
Procedure FTGL_SetColor(*drawer.FTGL_Drawer,r.f,g.f,b.f,a.f)
  If *drawer
    *drawer\color\r = r
    *drawer\color\g = g
    *drawer\color\b = b
    *drawer\color\a = a
  EndIf
EndProcedure


Procedure.s FTGL_GetVertexShader()
  Define vertex.s = "#version 330"+#CRLF$+
               "uniform mat4 view, projection, model;"+
               "in vec4 coord;"+
               "out vec2 texcoord;"+
               "void main(){"+
               "gl_Position = vec4(coord.xy,0,1);"+
               "texcoord = coord.zw;"+
               "}";
  vertex = GLSLDeCodeUnicodeShader(vertex)
	ProcedureReturn vertex
EndProcedure


; vertex + "uniform mat4 view, projection, model, offset;"
;   vertex + "in vec3 position;"
;   vertex + "void main(){"
;   vertex + "gl_Position = projection * view * model * offset *vec4(position,1.0);"
;   vertex + "};"


Procedure.s  FTGL_GetFragmentShader()
  Define fragment.s = "#version 330"+#CRLF$+
                      "in vec2 texcoord;"+
                      "uniform sampler2D tex;"+
                      "uniform vec4 color;"+
                      "out vec4 outColor;"+
                      "void main(){"+
                      "outColor = vec4(1,1,1,texture(tex,texcoord).a)*color;"+
                      "}"
  fragment = GLSLDeCodeUnicodeShader(fragment)
  ProcedureReturn fragment
EndProcedure

Procedure FTGL_DrawAtlas(*drawer.FTGL_Drawer)
  ;   Debug "Draw Atlas Called..."
  *drawer\color\r = Random(100)*0.01
  *drawer\color\g = Random(100)*0.01
  *drawer\color\b = Random(100)*0.01
  glUseProgram(*drawer\shader)
  glBindVertexArray(*drawer\vao)
  glBindBuffer(#GL_ARRAY_BUFFER,*drawer\vbo)
  glBufferData(#GL_ARRAY_BUFFER,64,?ssq_datas,#GL_STATIC_DRAW)
  glEnable(#GL_TEXTURE_2D)
;   glUniformMatrix4fv(glGetUniformLocation(*Me\shader,"model"),1,#GL_FALSE,@m)
;   glUniformMatrix4fv(glGetUniformLocation(*Me\shader,"view"),1,#GL_FALSE,@m)
;   glUniformMatrix4fv(glGetUniformLocation(*Me\shader,"projection"),1,#GL_FALSE,@m)
  glUniform4fv(glGetUniformLocation(*drawer\shader,"color"),1,*drawer\color)
  glActiveTexture(#GL_TEXTURE0)
  glBindTexture(#GL_TEXTURE_2D,*drawer\tex)
  glUniform1i(glGetUniformLocation(*drawer\shader,"tex"),0)
  
  glDisable(#GL_CULL_FACE)
  glDrawArrays(#GL_TRIANGLE_STRIP,0,4)
EndProcedure

Procedure FTGL_DrawText(*drawer.FTGL_Drawer,text.s,x.f,y.f,sx.f,sy.f)
  If Not *drawer Or Not *drawer\atlas 
    ProcedureReturn
  EndIf
  
  Protected n=0
  Protected a
  Protected c.s
  Define.f x2, y2, w, h
  Protected *infos.FTGL_GlyphInfos
  
  Protected size_t = (Len(text))*6*SizeOf(FTGL_Point)
  Define *mem = AllocateMemory(size_t)
  glBindVertexArray(*drawer\vao)
  glBindBuffer(#GL_ARRAY_BUFFER,*drawer\vbo)
  glUseProgram(*drawer\shader)
  glUniform4fv(glGetUniformLocation(*drawer\shader,"color"),1,*drawer\color)
  glActiveTexture(#GL_TEXTURE0)
  glBindTexture(#GL_TEXTURE_2D,*drawer\tex)
  glUniform1i(glGetUniformLocation(*drawer\shader,"tex"),0)
  glDisable(#GL_CULL_FACE)
  
  Protected atlas_width = *drawer\atlas\width
  Protected atlas_height = *drawer\atlas\height

  For a=1 To Len(text)
    c = Mid(text,a,1)
    *infos = *drawer\atlas\metadata[Asc(c)]
    
    x2 = x + *infos\bl * sx
    y2 = -y - *infos\bt * sy
    w = *infos\bw * sx
    h = *infos\bh * sy
    
    ; advance the cursor to the start of the next character
    x+*infos\ax*sx
    y+*infos\ay*sy
    
    ; skip glyphs that have no pixels
    If Not w Or Not h
      Continue
    EndIf

    FTGL_SetPoint(*mem,(a-1)*6  ,x2   ,-y2    ,*infos\tx                                    ,0)
    FTGL_SetPoint(*mem,(a-1)*6+1,x2+w ,-y2    ,*infos\tx     +*infos\bw/atlas_width         ,0)
    FTGL_SetPoint(*mem,(a-1)*6+2,x2   ,-y2-h  ,*infos\tx                                    ,*infos\bh/atlas_height)
    FTGL_SetPoint(*mem,(a-1)*6+3,x2   ,-y2-h  ,*infos\tx                                    ,*infos\bh/atlas_height)
    FTGL_SetPoint(*mem,(a-1)*6+4,x2+w ,-y2    ,*infos\tx     +*infos\bw/atlas_width         ,0)
    FTGL_SetPoint(*mem,(a-1)*6+5,x2+w ,-y2-h  ,*infos\tx     +*infos\bw/atlas_width         ,*infos\bh/atlas_height)
    
  Next a

  glBufferData(#GL_ARRAY_BUFFER,size_t,*mem,#GL_DYNAMIC_DRAW)
  glDrawArrays(#GL_TRIANGLES,0,Len(text)*6)
  glUseProgram(0)
  
  FreeMemory(*mem)
  
EndProcedure


Procedure FTGL_SetupTexture(*drawer.FTGL_Drawer)
  glEnable(#GL_TEXTURE_2D)
  glActiveTexture(#GL_TEXTURE0)
  
  Protected w = *drawer\atlas\width;FT_GetAtlasWidth(*drawer\atlas)
  Protected h = *drawer\atlas\height;FT_GetAtlasHeight(*drawer\atlas)
  
  Define img = CreateImage(#PB_Any,w,h,32)

  Define x,y
  StartDrawing(ImageOutput(img))
  DrawingMode(#PB_2DDrawing_AllChannels)
  For y=0 To h-1
    For x=0 To w-1
      Plot(x,y,RGBA(255,255,255,PeekA(*drawer\atlas\buffer + y * w + x)))
    Next
  Next
  StopDrawing()

  *drawer\tex = GL_LoadImage(img,#False)
  
;   Protected w = *drawer\atlas\width
;   Protected h = *drawer\atlas\height
;   
;   glEnable(#GL_TEXTURE_2D)
; 	glActiveTexture(#GL_TEXTURE0)
; 	glGenTextures(1,@*drawer\tex)
; 	glBindTexture(#GL_TEXTURE_2D,*drawer\tex)
; 
; 	;prevent artifacts on border
; 	glTexParameteri(#GL_TEXTURE_2D, #GL_TEXTURE_WRAP_S, #GL_CLAMP_TO_EDGE)
; 	glTexParameteri(#GL_TEXTURE_2D, #GL_TEXTURE_WRAP_T, #GL_CLAMP_TO_EDGE)
; 	glTexParameteri(#GL_TEXTURE_2D, #GL_TEXTURE_MIN_FILTER, #GL_LINEAR)
; 	glTexParameteri(#GL_TEXTURE_2D, #GL_TEXTURE_MAG_FILTER, #GL_LINEAR)
; 
; 	;disable Default 4-byte aligement
; 	glPixelStorei(#GL_UNPACK_ALIGNMENT,1)
; 	glTexImage2D(#GL_TEXTURE_2D,0,#GL_ALPHA,w,h,0,#GL_RGBA,#GL_UNSIGNED_BYTE,*drawer\atlas\buffer)
	
EndProcedure

;-------------------------------------------------------------------------------------
; Destructor
;-------------------------------------------------------------------------------------
Procedure deleteFTGLDrawer(*drawer.FTGL_Drawer)
  If *drawer\atlas
    FT_DeleteFontAtlas(*drawer\atlas)
  EndIf
  
  FreeMemory(*drawer)
EndProcedure


Procedure newFTGLDrawer()
  Protected *drawer.FTGL_Drawer = AllocateMemory(SizeOf(FTGL_Drawer))
  ;*drawer\atlas = FT_CreateFontAtlas("/Users/benmalartre/Documents/RnD/FTGL/FontAtlas/Fonts/superchunk.ttf",32)
  
  *drawer\atlas = FT_CreateFontAtlas("/Users/benmalartre/Documents/RnD/PureBasic/Noodle/fonts/Arial/arial.ttf",#FT_SIZE_PX)
  
  *drawer\color\r = 1
  *drawer\color\a = 1
  
  Protected i
  
  glGenVertexArrays(1,@*drawer\vao)
  glBindVertexArray(*drawer\vao)
  
  glGenBuffers(1,@*drawer\vbo)
  glBindBuffer(#GL_ARRAY_BUFFER,*drawer\vbo)
  

  *drawer\shader = GLSLCreateProgram(FTGL_GetVertexShader(), FTGL_GetFragmentShader(),#True)
  FTGL_SetupTexture(*drawer)
  
  Protected attr_coord.GLuint = glGetAttribLocation(*drawer\shader,"coord")
  glEnableVertexAttribArray(attr_coord)
  glBindBuffer(#GL_ARRAY_BUFFER,*drawer\vbo)
  glVertexAttribPointer(attr_coord,4,#GL_FLOAT,#GL_FALSE,0,#Null)
  glBindVertexArray(0)
  ProcedureReturn *drawer
EndProcedure

Procedure FTGL_Debug(*drawer.FTGL_Drawer)
  Protected *infos.FTGL_GlyphInfos
  Protected i
;   For i=0 To 255
;     *infos = *drawer\atlas\metadata[i]
;     Debug Chr(i)
;     Debug StrF(*infos\ax)
;     Debug StrF(*infos\ay)
;     Debug StrF(*infos\bw)
;     Debug StrF(*infos\bh)
;     Debug StrF(*infos\bt)
;     Debug StrF(*infos\bl)
;   Next i
  
  
  Define w = *drawer\atlas\width
  Define h = *drawer\atlas\height
  
  Define img = CreateImage(#PB_Any,w,h)
  Define x,y
  StartDrawing(ImageOutput(img))
  For y=0 To h-1
    For x=0 To w-1
      Plot(x,y,PeekA(*drawer\atlas\buffer + y * w + x))
    Next
  Next
  StopDrawing()
  Define window = OpenWindow(#PB_Any,0,0,w,h,"PB")
  Define gadget = ImageGadget(#PB_Any,0,0,w,h,ImageID(img))
  
  Repeat 
  Until WaitWindowEvent() = #PB_Event_CloseWindow
  
  FreeImage(img)
  CloseWindow(window)

EndProcedure

;---------------------------------------------------
; DataSection
;---------------------------------------------------
DataSection
  ssq_datas:
  Data.f -1,1,0,0
  Data.f  1,1,1,0
  Data.f -1,-1,0,1
  Data.f 1,-1,1,1
EndDataSection

; 
; glfwInit()
; glfwWindowHint(#GLFW_OPENGL_FORWARD_COMPAT, #GL_TRUE);
; glfwWindowHint(#GLFW_OPENGL_PROFILE, #GLFW_OPENGL_CORE_PROFILE);
; glfwWindowHint(#GLFW_CONTEXT_VERSION_MAJOR, 3);
; glfwWindowHint(#GLFW_CONTEXT_VERSION_MINOR, 3);
; Define *window.GLFWwindow = glfwCreateWindow(800,600,"GLFW",#Null,#Null)
; glfwMakeContextCurrent(*window)
; GLLoadExtensions()
; glClearColor(0.5,0.5,0.5,1)
; glViewport(0,0,800,600)
; 
; Define *drawer.FTGL_Drawer = newFTGLDrawer()
; 
; ;glfwSetWindowSize(*window,*drawer\atlas\width,*drawer\atlas\height)
; 
; FTGL_Debug (*drawer)
; 
; glDisable(#GL_DEPTH_TEST)
; glEnable(#GL_BLEND)
; glBlendFunc(#GL_SRC_ALPHA,#GL_ONE_MINUS_SRC_ALPHA)
; 
; While Not glfwWindowShouldClose(*window)
;   glClear (#GL_COLOR_BUFFER_BIT | #GL_DEPTH_BUFFER_BIT)
; 
;   ;FTGL_DrawText(*drawer,"Hello Ben How ARe UYou",-1,1,0,0)
;   FTGL_DrawAtlas(*drawer)
;   glfwPollEvents()
;   glfwSwapBuffers(*window)
;  
; Wend
; 
; glfwDestroyWindow(*window)
; IDE Options = PureBasic 5.71 LTS (MacOS X - x64)
; CursorPosition = 139
; FirstLine = 119
; Folding = --
; EnableXP