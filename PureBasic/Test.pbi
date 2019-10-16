XIncludeFile "FontAtlas.pbi"


EnableExplicit

glfwInit()
glfwWindowHint(#GLFW_OPENGL_FORWARD_COMPAT, #GL_TRUE);
glfwWindowHint(#GLFW_OPENGL_PROFILE, #GLFW_OPENGL_CORE_PROFILE);
glfwWindowHint(#GLFW_CONTEXT_VERSION_MAJOR, 3);
glfwWindowHint(#GLFW_CONTEXT_VERSION_MINOR, 3);
Define *window.GLFWwindow = glfwCreateWindow(4000,100,"GLFW",#Null,#Null)
glfwMakeContextCurrent(*window)
GLLoadExtensions()
glClearColor(0.5,0.5,0.5,1)
glViewport(0,0,4000,100)

Define *drawer.FTGL_Drawer = newFTGLDrawer()

; FTGL_Debug (*drawer)

If *drawer
  glEnable(#GL_BLEND)
  glBlendFunc(#GL_SRC_ALPHA,#GL_ONE_MINUS_SRC_ALPHA)
  
  Define size_px.f = 0.0005
  Define size_py.f = size_px * 40
    
  While Not glfwWindowShouldClose(*window) 
    glfwPollEvents()
    
    glClear (#GL_COLOR_BUFFER_BIT | #GL_DEPTH_BUFFER_BIT)
    FTGL_SetColor(*drawer,0,1,0,0.5)
    FTGL_DrawText(*drawer,"Hello Ben How ARe U???",-1,-1,size_px,size_py)
    FTGL_DrawAtlas(*drawer)
    glfwSwapBuffers(*window)
 
  Wend
EndIf


glfwDestroyWindow(*window)

; IDE Options = PureBasic 5.71 LTS (MacOS X - x64)
; CursorPosition = 32
; FirstLine = 8
; EnableXP