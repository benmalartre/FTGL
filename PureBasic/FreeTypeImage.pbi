

EnableExplicit

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
  img.i
EndStructure

Structure FTGL_Point
  x.f
  y.f
  s.f
  t.f
EndStructure

CompilerIf #PB_Compiler_OS =#PB_OS_Linux 
  ImportC "/home/benmalartre/RnD/FTGL/FontAtlas/ftgl.a" : EndImport
  ImportC "-lfreetype" : EndImport
  ImportC "/home/benmalartre/RnD/FTGL/FontAtlas/ftgl.a"
CompilerElseIf #PB_Compiler_OS  = #PB_OS_MacOS
  ImportC "freetype.a" : EndImport
  ImportC "ftgl.a"
CompilerEndIf
  
  FT_CreateFontAtlas(file_name.s,size_px.l)
  FT_DeleteFontAtlas(*atlas.FTGL_FontAtlas)
EndImport  


Procedure FTGL_SetPoint(*mem,id.i,x.f,y.f,s.f,t.f)
  ;   Protected *pnt.FTGL_Point = *mem + id*6*SizeOf(FTGL_Point)
  ;   *pnt\x = x
  ;   *pnt\y = y
  ;   *pnt\s = s
  ;   *pnt\t = t
  Protected base.i = *mem + id*6*SizeOf(FTGL_Point)
  PokeF(base,x)
  PokeF(base+4,y)
  PokeF(base+8,s)
  PokeF(base+12,t)
EndProcedure

Procedure FTGL_SetupTexture(*drawer.FTGL_Drawer)

  *drawer\img = CreateImage(#PB_Any,*drawer\atlas\width,*drawer\atlas\height)
  Define w = *drawer\atlas\width
  Define h = *drawer\atlas\height
  Define x,y
  StartDrawing(ImageOutput(*drawer\img))
  For y=0 To h-1
    For x=0 To w-1
      Plot(x,y,PeekA(*drawer\atlas\buffer + y * w + x))
    Next
  Next
  StopDrawing()

;   Protected img = LoadImage(#PB_Any,"/Users/benmalartre/Documents/RnD/FTGL/FontAtlas/kro.png")
;   Protected img = LoadImage(#PB_Any,"/Users/benmalartre/Documents/RnD/FTGL/FontAtlas/Nb_FixedLight.70.bmp")
  
  EndProcedure


Procedure newFTGLDrawer()
  Protected *drawer.FTGL_Drawer = AllocateMemory(SizeOf(FTGL_Drawer))
  *drawer\atlas = FT_CreateFontAtlas("Fonts/superchunk.ttf",64)
  ;*drawer\atlas = FT_CreateFontAtlas("/home/benmalartre/RnD/FTGL/FontAtlas/Fonts/FreeMonoBold.ttf",24)
  
  
  *drawer\color\r = 1
  *drawer\color\a = 1
  
  Protected i
  Debug *drawer\atlas\buffer
  Debug *drawer\atlas\width
  Debug *drawer\atlas\height
  
  FTGL_SetupTexture(*drawer)
  
  ProcedureReturn *drawer
EndProcedure

Procedure FTGL_Debug(*drawer.FTGL_Drawer)
  Protected *infos.FTGL_GlyphInfos
  Protected i
  For i=0 To 255
    *infos = *drawer\atlas\metadata[i]
    Debug Chr(i)
    Debug StrF(*infos\ax)
    Debug StrF(*infos\ay)
    Debug StrF(*infos\bw)
    Debug StrF(*infos\bh)
    Debug StrF(*infos\bt)
    Debug StrF(*infos\bl)
  Next i
  
  Define img = CreateImage(#PB_Any,*drawer\atlas\width,*drawer\atlas\height)
  Define w = *drawer\atlas\width
  Define h = *drawer\atlas\height
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
  
  CloseWindow(window)
  
EndProcedure

Define *drawer.FTGL_Drawer = newFTGLDrawer()


FTGL_Debug (*drawer)
; IDE Options = PureBasic 5.42 LTS (MacOS X - x64)
; CursorPosition = 97
; FirstLine = 79
; Folding = -
; EnableXP