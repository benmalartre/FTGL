
XIncludeFile "FontAtlas.pbi"

;-------------------------------------------------------------------------------------
; Test
;-------------------------------------------------------------------------------------
glfwInit()
glfwWindowHint(#GLFW_OPENGL_FORWARD_COMPAT, #GL_TRUE);
glfwWindowHint(#GLFW_OPENGL_PROFILE, #GLFW_OPENGL_CORE_PROFILE);
glfwWindowHint(#GLFW_CONTEXT_VERSION_MAJOR, 3);
glfwWindowHint(#GLFW_CONTEXT_VERSION_MINOR, 3);
Define *window.GLFWwindow = glfwCreateWindow(800,600,"FreeType & GLFW",#Null,#Null)

glfwMakeContextCurrent(*window)
GLLoadExtensions()
glClearColor(0.5,0.5,0.5,1)
glViewport(0,0,800,600)

Define *drawer.FTGL_Drawer = newFTGLDrawer()

Define size_px.f = #FT_SIZE_PX *1/ (800* #FT_SIZE_PX)

If *drawer
  glEnable(#GL_BLEND)
  glBlendFunc(#GL_SRC_ALPHA,#GL_ONE_MINUS_SRC_ALPHA)
  
  While Not glfwWindowShouldClose(*window)
    glfwPollEvents()
    glClearColor(Random(100)*0.01,Random(100)*0.01,Random(100)*0.01,1.0)
    glClear (#GL_COLOR_BUFFER_BIT | #GL_DEPTH_BUFFER_BIT)
    FTGL_SetColor(*drawer,0,1,0,0.5)
    FTGL_DrawText(*drawer,"This is an OpenGL Window",-1,0.9,size_px,size_px)
   
    FTGL_SetColor(*drawer,1,1,0,1)
    FTGL_DrawText(*drawer,"We write text using",-1,-1,0.01,0.01)
    
    FTGL_SetColor(*drawer,1,0,0,1)
    FTGL_DrawText(*drawer,"FreeType and FTGL",-1,0,0.006,0.006)
   
   
  
    
    glfwSwapBuffers(*window)
   
  Wend
  deleteFTGLDrawer(*drawer)
EndIf
glfwDestroyWindow(*window)
; IDE Options = PureBasic 5.71 LTS (MacOS X - x64)
; CursorPosition = 22
; FirstLine = 15
; EnableXP