; ============================================================================
;
;  Copyright (c) 2012, Guy Rabiller, RADFAC.
;  Copyright (c) 2013, Ben Malartre, Gitans Productions
;  All rights reserved, worldwide.
;
;  Redistribution  and  use  in  source  and  binary  forms,  with or  without
;  modification, are permitted provided that the following conditions are met:
;
;  - Redistributions of  source code  must retain  the above copyright notice,
;    this list of conditions and the following disclaimer.
;  - Redistributions in binary form must reproduce the above copyright notice,
;    this list of conditions and the following disclaimer in the documentation
;    and/or other materials provided with the distribution.
;  - Neither the name of  RADFAC nor the names of its contributors may be used
;    to  endorse  or  promote  products  derived  from  this  software without
;    specific prior written permission.
;
;  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;  AND ANY EXPRESS OR IMPLIED WARRANTIES,  INCLUDING,  BUT NOT LIMITED TO, THE
;  IMPLIED WARRANTIES OF  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;  ARE DISCLAIMED.  IN NO EVENT SHALL THE  COPYRIGHT HOLDER OR CONTRIBUTORS BE
;  LIABLE  FOR  ANY  DIRECT,  INDIRECT,  INCIDENTAL,  SPECIAL,  EXEMPLARY,  OR
;  CONSEQUENTIAL  DAMAGES  (INCLUDING,  BUT  NOT  LIMITED  TO,  PROCUREMENT OF
;  SUBSTITUTE GOODS OR SERVICES;  LOSS OF USE,  DATA,  OR PROFITS; OR BUSINESS
;  INTERRUPTION) HOWEVER CAUSED  AND ON ANY  THEORY OF  LIABILITY,  WHETHER IN
;  CONTRACT,  STRICT LIABILITY,  OR TORT  (INCLUDING  NEGLIGENCE OR OTHERWISE)
;  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,  EVEN IF ADVISED OF THE
;  POSSIBILITY OF SUCH DAMAGE.
;
;  For permission, contact copy@radfac.com.
;
; ============================================================================
;  raafal.view.helpers.pbi
; ............................................................................
;  Viewport OpenGL helpers functions
; ============================================================================
;  2013/04/12 | Ben Malartre
;  - creation
; ============================================================================

;-------------------------------------------
; Encode a unique ID into a color with components in range 0.0 to 1.0
;-------------------------------------------
UsePNGImageDecoder()
UseTGAImageDecoder()
UseJPEGImageDecoder()
UseTIFFImageDecoder()
UseJPEG2000ImageDecoder()

Procedure GLDecodeID(x.GLubyte,y.GLubyte,z.GLubyte)
  ProcedureReturn RGB(x,y,z)
EndProcedure

;---------------------------------------------------------
; Draw Arrow
;---------------------------------------------------------
Procedure GL_DrawAxis(axis.i=0)
  glPushMatrix()
  glDisable(#GL_LIGHTING)
  Protected *quad
  Select axis
    Case 0 ; X axis
      glColor3f(1,0,0)
      glBegin(#GL_LINES)
      glVertex3f(0,0,0)
      glVertex3f(1,0,0)
      glEnd()
      glTranslatef(1,0,0)
      glRotatef(90,0,1,0)
;       *quad = gluNewQuadric()
;       gluCylinder(*quad,0.1,0,0.25,12,6)
      
    Case 1 ; Y Axis
      glColor3f(0,1,0)
      glBegin(#GL_LINES)
      glVertex3f(0,0,0)
      glVertex3f(0,1,0)
      glEnd()
      glTranslatef(0,1,0)
      glRotatef(-90,1,0,0)
;       *quad = gluNewQuadric()
;       gluCylinder(*quad,0.1,0,0.25,12,6)
      
    Case 2 ; Z Axis
      glColor3f(0,0,1)
      glBegin(#GL_LINES)
      glVertex3f(0,0,0)
      glVertex3f(0,0,1)
      glEnd()
      glTranslatef(0,0,1)
;       *quad = gluNewQuadric()
;       gluCylinder(*quad,0.1,0,0.25,12,6)
      
  EndSelect
  glPopMatrix()
EndProcedure

;---------------------------------------------------------
; Build OpenGL Font from image
;---------------------------------------------------------
Procedure GL_BuildFont(GLTextureID)
  Protected base = glGenLists(95)
  Protected loop
  glBindTexture(#GL_TEXTURE_2D, GLTextureID)
  For loop=0 To 94
    
    Protected cx.f = Mod(loop,16)/16.0
    Protected cy.f = Mod((loop/16),8.0)
    
;     glNewList(base+loop,#GL_COMPILE)
;     glBegin(#GL_QUADS)
;     ;Bottom Left
;     glTexCoord2f(cx         ,1.0-cy-0.120)
;     glVertex2i(0,0)
;     ;Bottom Right
;     glTexCoord2f(cx+0.0625 ,1.0-cy-0.120)
;     glVertex2i(16,0)
;     ;Top Right
;     glTexCoord2f(cx+0.0625 ,1.0-cy)
;     glVertex2i(16,16)
;     ;Top Left
;     glTexCoord2f(cx        ,1.0-cy)
;     glVertex2i(0,16)
;     glEnd()
;     
;     glTranslated(10,0,0)
;     glEndList()
  Next loop
     
EndProcedure

;------------------------------------------------------------
; Load Image
;------------------------------------------------------------
Procedure GL_LoadImage(imageID,flipY.b=#True)
  If imageID <> #Null
    Protected out.GLint
    glGenTextures(1,@out)
        
    glBindTexture(#GL_TEXTURE_2D,out)
    glTexParameteri( #GL_TEXTURE_2D, #GL_TEXTURE_WRAP_S, #GL_CLAMP );
    glTexParameteri( #GL_TEXTURE_2D, #GL_TEXTURE_WRAP_T, #GL_CLAMP );
    glTexParameteri( #GL_TEXTURE_2D, #GL_TEXTURE_MIN_FILTER, #GL_NEAREST ); // No pixel averaging
    glTexParameteri( #GL_TEXTURE_2D, #GL_TEXTURE_MAG_FILTER, #GL_NEAREST ); // No pixel averaging
    
    Protected w.i = ImageWidth(imageID) 
    Protected h.i = ImageHeight(imageID)

    Protected d.i = ImageDepth(imageID)
    Protected numPixels.l = w * h
    Protected size.i = numPixels*4
    Protected *bits = AllocateMemory(size) ; GLubyte
    
    Protected x, y, color, base
    
    ;Read pixels
    StartDrawing(ImageOutput(imageID))
    DrawingMode(#PB_2DDrawing_AllChannels)
  
    For x=0 To w - 1
      For y = 0 To h - 1
        color = Point(x,y)
        If flipY
          base = (x*4 + w * 4*(h-y-1))
        Else
          base = (x*4 + w * 4*y)
        EndIf
        PokeA(*bits + base,Red(color))
        PokeA(*bits + base + 1,Green(color))
        PokeA(*bits + base + 2,Blue(color))
        PokeA(*bits + base + 3,Alpha(color))
          
      Next y
    Next x
    StopDrawing()
    
    ;convert image To premultiplied alpha
   ;Protected i
    ;For i = 0 To  numPixels - 1
    ; 	PremultiplyAlpha( *bits + 4*i )
    ;Next i
  
    glTexImage2D( #GL_TEXTURE_2D, 0, #GL_RGBA, w, h, 0, #GL_RGBA, #GL_UNSIGNED_BYTE, *bits )
    FreeMemory(*bits)
    
    ProcedureReturn out
  EndIf
  
EndProcedure

;------------------------------------------------------------
; Write Image
;------------------------------------------------------------
Procedure GL_WriteImage(path.s,width.i,height.i)
   ;Read Frame Buffer
  Protected GLubyte_s.GLubyte
  Define *datas = AllocateMemory(width * height * SizeOf(GLubyte_s)*4)
  glReadPixels(0,0,width,height,#GL_RGBA,#GL_UNSIGNED_BYTE,*datas)
  Protected img = CreateImage(#PB_Any,width,height)
  StartDrawing(ImageOutput(img))
  Protected x,y,offset
  Define.a r,g,b
  For y=0 To height-1
    For x=0 To width-1
      r = PeekA(*datas+offset)
      g = PeekA(*datas+SizeOf(GLubyte_s)+offset)
      b = PeekA(*datas+2*SizeOf(GLubyte_s)+offset)
      Plot(x,height-y-1,RGB(r,g,b))
      offset + 4*SizeOf(GLubyte_s)
    Next x
  Next y
  StopDrawing()
  
  UsePNGImageEncoder()
  Protected result = SaveImage(img,path,#PB_ImagePlugin_PNG)
  If result = 0
    Debug "[GL_WriteImage] Fail to write image to disk!!"
  EndIf
  
  FreeImage(img)
  FreeMemory(*datas)
EndProcedure

; IDE Options = PureBasic 5.42 LTS (MacOS X - x64)
; CursorPosition = 49
; FirstLine = 42
; Folding = -
; EnableXP