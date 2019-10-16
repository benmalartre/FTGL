; ============================================================================
;  raafal.opengl.shapes.pbi
; ............................................................................
;  Basic Shapes used for Nulls and Particles
; ============================================================================
;  2008/06/22 | BenMalartre
;  - creation
; ============================================================================

Enumeration
  #RAA_SHAPE_NONE = 0
  #RAA_SHAPE_AXIS
  #RAA_SHAPE_SPHERE
  #RAA_SHAPE_GRID
  #RAA_SHAPE_CUBE
  #RAA_SHAPE_DISK
  #RAA_Shape_NULL
  #RAA_Shape_ARROW
EndEnumeration

;Define ShapeType Type
Macro raaShapeType : i
EndMacro

; ============================================================================
;  OpenGL Shapes
; ============================================================================
;{
Structure CShape_t
  *position
  *indices
  nbp.i
  nbi.i
EndStructure

;-----------------------------------------------------------------------------
; Axis
;-----------------------------------------------------------------------------
DataSection
  raa_shape_axis_positions:
  Data.GLfloat 0,0,0
  Data.GLfloat 1,0,0

  raa_shape_axis_indices:
  Data.GLint 0,1
  
EndDataSection
;-----------------------------------------------------------------------------
; Box
;-----------------------------------------------------------------------------
DataSection
  raa_shape_box_positions:
  Data.GLfloat 1,1,1
  Data.GLfloat 1,1,-1
  Data.GLfloat -1,1,-1
  Data.GLfloat 1,1,1
  Data.GLfloat 1,-1,1
  Data.GLfloat 1,-1,-1
  Data.GLfloat -1,-1,-1
  Data.GLfloat 1,-1,1

  raa_shape_box_indices:
  Data.GLint 0,1,1,3,3,2,2,0
  Data.GLint 4,5,5,7,7,6,6,4
  Data.GLint 0,4,1,5,2,6,3,7
  
EndDataSection

;-----------------------------------------------------------------------------
; Cube
;-----------------------------------------------------------------------------
DataSection
  raa_shape_cube_positions:
  Data.GLfloat 1,1,1
  Data.GLfloat 1,1,-1
  Data.GLfloat -1,1,-1
  Data.GLfloat -1,1,1
  Data.GLfloat 1,-1,1
  Data.GLfloat 1,-1,-1
  Data.GLfloat -1,-1,-1
  Data.GLfloat -1,-1,1

  raa_shape_cube_indices:
  Data.GLint 0,1,2,2,3,0
  Data.GLint 1,5,6,6,2,1
  Data.GLint 5,4,7,7,6,5
  Data.GLint 4,0,3,3,7,4
  Data.GLint 0,4,5,5,1,0
  Data.GLint 3,2,6,6,7,3
  
EndDataSection

;-----------------------------------------------------------------------------
; Cylinder
;-----------------------------------------------------------------------------
DataSection
  raa_shape_cylinder_positions:
  Data.GLfloat 1     ,0   ,0
  Data.GLfloat 0.866 ,0   ,0.5
  Data.GLfloat 0.5   ,0   ,0.866
  Data.GLfloat 0     ,0   ,1
  Data.GLfloat -0.5  ,0   ,0.866
  Data.GLfloat -0.866,0   ,0.5
  Data.GLfloat -1    ,0   ,0
  Data.GLfloat -0.866,0   ,-0.5
  Data.GLfloat -0.5  ,0   ,-0.866
  Data.GLfloat 0     ,0   ,1
  Data.GLfloat 0.5   ,0   ,-0.866
  Data.GLfloat 0.866 ,0   ,-0.5
  Data.GLfloat 1     ,1   ,0
  Data.GLfloat 0.866 ,1   ,0.5
  Data.GLfloat 0.5   ,1   ,0.866
  Data.GLfloat 0     ,1   ,1
  Data.GLfloat -0.5  ,1   ,0.866
  Data.GLfloat -0.866,1   ,0.5
  Data.GLfloat -1    ,1   ,0
  Data.GLfloat -0.866,1   ,-0.5
  Data.GLfloat -0.5  ,1   ,-0.866
  Data.GLfloat 0     ,1   ,1
  Data.GLfloat 0.5   ,1   ,-0.866
  Data.GLfloat 0.866 ,1   ,-0.5
  Data.GLfloat 0     ,0   ,0
  Data.GLfloat 0     ,1   ,0

  raa_shape_cylinder_indices:
  Data.GLint 0,1,12,12,1,13
  Data.GLint 1,2,13,13,2,14
  Data.GLint 2,3,14,14,3,15
  Data.GLint 3,4,15,15,4,16
  Data.GLint 4,5,16,16,5,17
  Data.GLint 5,6,17,17,6,18
  Data.GLint 6,7,18,18,7,19
  Data.GLint 7,8,19,19,8,20
  Data.GLint 8,9,20,20,9,21
  Data.GLint 9,10,21,21,10,22
  Data.GLint 10,11,22,22,11,23
  Data.GLint 11,0,12,12,0,23
  Data.GLint 0,1,24,1,2,24,2,3,24,3,4,24
  Data.GLint 4,5,24,5,6,24,6,7,24,7,8,24
  Data.GLint 8,9,24,9,10,24,10,11,24,11,0,24
  Data.GLint 12,13,25,13,14,25,14,15,25,15,16,25
  Data.GLint 16,17,25,17,18,25,18,19,25,19,20,25
  Data.GLint 20,21,25,21,22,25,22,23,25,23,12,25
  
EndDataSection
;}


Procedure newCShape(type.raaShapeType)

  
  Protected *Me.CShape_t = AllocateMemory(SizeOf(CShape_t))
  InitializeStructure(*Me,CShape_t)
  *Me\position = #Null
  *Me\indices = #Null
  Protected GLint_s.GLint
  Protected size_t
  Select type
    Case #RAA_Shape_Axis
      *Me\nbp = 2
      *Me\nbi = 2
      *Me\position = ?raa_shape_axis_positions
      *Me\indices = ?raa_shape_axis_indices
;       size_t = *Me\nbi  *SizeOf(GLint_s)
;       *Me\indices = AllocateMemory(size_t)
;       CopyMemory(?raa_shape_axis_indices,*Me\indices,size_t)
      
      Case #RAA_Shape_Cube
      *Me\nbp = 8
      *Me\nbi =  36
      *Me\position = ?raa_shape_cube_positions
      *Me\indices = ?raa_shape_cube_indices
;        size_t = *Me\nbi  *SizeOf(GLint_s)
;       *Me\indices = AllocateMemory(size_t)
;       CopyMemory(?raa_shape_cube_indices,*Me\indices,size_t)
      

  EndSelect
  
  
  ProcedureReturn *Me
EndProcedure

; ============================================================================
;  EOF
; ============================================================================

; IDE Options = PureBasic 5.20 beta 15 LTS (Windows - x64)
; CursorPosition = 176
; FirstLine = 115
; Folding = -
; EnableXP