; ============================================================================
;
;  Copyright (c) 2012, Guy Rabiller, RADFAC.
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
;  raafal.libs.opengl.pbi
; ............................................................................
;  Import OpenGL 3+
; ============================================================================
;  2012/10/24 | Guy Rabiller
;  - creation
; ============================================================================
;  2013/06/18 | BenMalartre
;  - modifications
; ============================================================================

#GLFW_GETPROCADDRESS_DEBUG = 0

; ============================================================================
;  TYPES
; ============================================================================
;{
; ---[ GL_VERSION_1_1 ]-------------------------------------------------------
Macro GLenum
  l
EndMacro
Macro GLboolean
  a
EndMacro
Macro GLbitfield
  l
EndMacro
Macro GLbyte
  b
EndMacro
Macro GLshort
  w
EndMacro
Macro GLint
  l
EndMacro
Macro GLsizei
  l
EndMacro
Macro GLubyte
  a
EndMacro
Macro GLushort
  u
EndMacro
Macro GLuint
  l
EndMacro
Macro GLfloat
  f
EndMacro
Macro GLclampf
  f
EndMacro
Macro GLdouble
  d
EndMacro
Macro GLclampd
  d
EndMacro
Macro GLvoid
  
EndMacro
; ---[ GL_VERSION_1_5 ]-------------------------------------------------------
Macro GLintptr
  i
EndMacro
Macro GLsizeiptr
  i
EndMacro
; ---[ GL_VERSION_2_0 ]-------------------------------------------------------
Macro GLchar
  a
EndMacro
; ---[ GL_ARB_vertex_buffer_object ]------------------------------------------
Macro GLintptrARB
  i
EndMacro
Macro GLsizeiptrARB
  i
EndMacro
; ---[ GL_ARB_shader_objects ]------------------------------------------------
Macro GLcharARB
  a
EndMacro
Macro GLhandleARB
  l
EndMacro
; ---[ GL_ARB_half_float_pixel ]----------------------------------------------
Macro GLhalfARB
  u
EndMacro
; ---[ GL_NV_half_float ]-----------------------------------------------------
Macro GLhalfNV
  u
EndMacro
; ---[ GLEXT_64_TYPES ]-------------------------------------------------------
Macro int32_t
  l
EndMacro
Macro int64_t
  q
EndMacro
Macro uint64_t
  q
EndMacro
; ---[ GL_EXT_timer_query ]---------------------------------------------------
Macro GLint64EXT
  q
EndMacro
Macro GLuint64EXT
  q
EndMacro
; ---[ GL_ARB_sync ]----------------------------------------------------------
Macro GLint64
  q
EndMacro
Macro GLuint64
  q
EndMacro
Macro GLsync
  i
EndMacro
; ---[ GL_ARB_cl_event ]------------------------------------------------------
;Macro struct _cl_context;
;Macro struct _cl_event;
; ---[ GL_ARB_debug_output ]--------------------------------------------------
PrototypeC GLDEBUGPROCARB( source.GLenum, type.GLenum, id.GLuint, severity.GLenum, length.GLsizei, *message, *userParam )
; ---[ GL_NV_vdpau_interop ]--------------------------------------------------
Macro GLvdpauSurfaceNV
  i
EndMacro
;}


; ============================================================================
;  CONSTANTS
; ============================================================================
;{
; ---[ GL_VERSION_1_1 ]-------------------------------------------------------
;{
; AttribMask
#GL_DEPTH_BUFFER_BIT                                   = $00000100
#GL_STENCIL_BUFFER_BIT                                 = $00000400
#GL_COLOR_BUFFER_BIT                                   = $00004000
; Boolean
#GL_FALSE                                              = 0
#GL_TRUE                                               = 1

; BeginMode
#GL_POINTS                                             = $0000
#GL_LINES                                              = $0001
#GL_LINE_LOOP                                          = $0002
#GL_LINE_STRIP                                         = $0003
#GL_TRIANGLES                                          = $0004
#GL_TRIANGLE_STRIP                                     = $0005
#GL_TRIANGLE_FAN                                       = $0006
#GL_QUADS                                              = $0007
#GL_QUAD_STRIP                                         = $0008
#GL_POLYGON                                            = $0009


; AlphaFunction
#GL_NEVER                                              = $0200
#GL_LESS                                               = $0201
#GL_EQUAL                                              = $0202
#GL_LEQUAL                                             = $0203
#GL_GREATER                                            = $0204
#GL_NOTEQUAL                                           = $0205
#GL_GEQUAL                                             = $0206
#GL_ALWAYS                                             = $0207
; BlendingFactorDest
#GL_ZERO                                               = 0
#GL_ONE                                                = 1
#GL_SRC_COLOR                                          = $0300
#GL_ONE_MINUS_SRC_COLOR                                = $0301
#GL_SRC_ALPHA                                          = $0302
#GL_ONE_MINUS_SRC_ALPHA                                = $0303
#GL_DST_ALPHA                                          = $0304
#GL_ONE_MINUS_DST_ALPHA                                = $0305
; BlendingFactorSrc
#GL_DST_COLOR                                          = $0306
#GL_ONE_MINUS_DST_COLOR                                = $0307
#GL_SRC_ALPHA_SATURATE                                 = $0308
; DrawBufferMode
#GL_NONE                                               = 0
#GL_FRONT_LEFT                                         = $0400
#GL_FRONT_RIGHT                                        = $0401
#GL_BACK_LEFT                                          = $0402
#GL_BACK_RIGHT                                         = $0403
#GL_FRONT                                              = $0404
#GL_BACK                                               = $0405
#GL_LEFT                                               = $0406
#GL_RIGHT                                              = $0407
#GL_FRONT_AND_BACK                                     = $0408
; ErrorCode
#GL_NO_ERROR                                           = 0
#GL_INVALID_ENUM                                       = $0500
#GL_INVALID_VALUE                                      = $0501
#GL_INVALID_OPERATION                                  = $0502
#GL_OUT_OF_MEMORY                                      = $0505
; FrontFaceDirection
#GL_CW                                                 = $0900
#GL_CCW                                                = $0901
; GetPName
#GL_POINT_SMOOTH                                       = $0B10
#GL_POINT_SIZE                                         = $0B11
#GL_POINT_SIZE_RANGE                                   = $0B12
#GL_POINT_SIZE_GRANULARITY                             = $0B13
#GL_LINE_SMOOTH                                        = $0B20
#GL_LINE_WIDTH                                         = $0B21
#GL_LINE_WIDTH_RANGE                                   = $0B22
#GL_LINE_WIDTH_GRANULARITY                             = $0B23
#GL_POLYGON_SMOOTH                                     = $0B41
#GL_CULL_FACE                                          = $0B44
#GL_CULL_FACE_MODE                                     = $0B45
#GL_FRONT_FACE                                         = $0B46
#GL_DEPTH_RANGE                                        = $0B70
#GL_DEPTH_TEST                                         = $0B71
#GL_DEPTH_WRITEMASK                                    = $0B72
#GL_DEPTH_CLEAR_VALUE                                  = $0B73
#GL_DEPTH_FUNC                                         = $0B74
#GL_STENCIL_TEST                                       = $0B90
#GL_STENCIL_CLEAR_VALUE                                = $0B91
#GL_STENCIL_FUNC                                       = $0B92
#GL_STENCIL_VALUE_MASK                                 = $0B93
#GL_STENCIL_FAIL                                       = $0B94
#GL_STENCIL_PASS_DEPTH_FAIL                            = $0B95
#GL_STENCIL_PASS_DEPTH_PASS                            = $0B96
#GL_STENCIL_REF                                        = $0B97
#GL_STENCIL_WRITEMASK                                  = $0B98
#GL_VIEWPORT                                           = $0BA2
#GL_MODELVIEW_STACK_DEPTH                              = $0BA3
#GL_PROJECTION_STACK_DEPTH                             = $0BA4
#GL_TEXTURE_STACK_DEPTH                                = $0BA5
#GL_MODELVIEW_MATRIX                                   = $0BA6
#GL_PROJECTION_MATRIX                                  = $0BA7
#GL_TEXTURE_MATRIX                                     = $0BA8
#GL_DITHER                                             = $0BD0
#GL_BLEND_DST                                          = $0BE0
#GL_BLEND_SRC                                          = $0BE1
#GL_BLEND                                              = $0BE2
#GL_LOGIC_OP_MODE                                      = $0BF0
#GL_COLOR_LOGIC_OP                                     = $0BF2
#GL_DRAW_BUFFER                                        = $0C01
#GL_READ_BUFFER                                        = $0C02
#GL_SCISSOR_BOX                                        = $0C10
#GL_SCISSOR_TEST                                       = $0C11
#GL_COLOR_CLEAR_VALUE                                  = $0C22
#GL_COLOR_WRITEMASK                                    = $0C23
#GL_DOUBLEBUFFER                                       = $0C32
#GL_STEREO                                             = $0C33
#GL_LINE_SMOOTH_HINT                                   = $0C52
#GL_POLYGON_SMOOTH_HINT                                = $0C53
#GL_UNPACK_SWAP_BYTES                                  = $0CF0
#GL_UNPACK_LSB_FIRST                                   = $0CF1
#GL_UNPACK_ROW_LENGTH                                  = $0CF2
#GL_UNPACK_SKIP_ROWS                                   = $0CF3
#GL_UNPACK_SKIP_PIXELS                                 = $0CF4
#GL_UNPACK_ALIGNMENT                                   = $0CF5
#GL_PACK_SWAP_BYTES                                    = $0D00
#GL_PACK_LSB_FIRST                                     = $0D01
#GL_PACK_ROW_LENGTH                                    = $0D02
#GL_PACK_SKIP_ROWS                                     = $0D03
#GL_PACK_SKIP_PIXELS                                   = $0D04
#GL_PACK_ALIGNMENT                                     = $0D05
#GL_MAX_TEXTURE_SIZE                                   = $0D33
#GL_MAX_VIEWPORT_DIMS                                  = $0D3A
#GL_SUBPIXEL_BITS                                      = $0D50
#GL_TEXTURE_1D                                         = $0DE0
#GL_TEXTURE_2D                                         = $0DE1
#GL_POLYGON_OFFSET_UNITS                               = $2A00
#GL_POLYGON_OFFSET_POINT                               = $2A01
#GL_POLYGON_OFFSET_LINE                                = $2A02
#GL_POLYGON_OFFSET_FILL                                = $8037
#GL_POLYGON_OFFSET_FACTOR                              = $8038
#GL_TEXTURE_BINDING_1D                                 = $8068
#GL_TEXTURE_BINDING_2D                                 = $8069
; GetTextureParameter
#GL_TEXTURE_WIDTH                                      = $1000
#GL_TEXTURE_HEIGHT                                     = $1001
#GL_TEXTURE_INTERNAL_FORMAT                            = $1003
#GL_TEXTURE_BORDER_COLOR                               = $1004
#GL_TEXTURE_RED_SIZE                                   = $805C
#GL_TEXTURE_GREEN_SIZE                                 = $805D
#GL_TEXTURE_BLUE_SIZE                                  = $805E
#GL_TEXTURE_ALPHA_SIZE                                 = $805F
; HintMode
#GL_DONT_CARE                                          = $1100
#GL_FASTEST                                            = $1101
#GL_NICEST                                             = $1102
; DataType
#GL_BYTE                                               = $1400
#GL_UNSIGNED_BYTE                                      = $1401
#GL_SHORT                                              = $1402
#GL_UNSIGNED_SHORT                                     = $1403
#GL_INT                                                = $1404
#GL_UNSIGNED_INT                                       = $1405
#GL_FLOAT                                              = $1406
#GL_DOUBLE                                             = $140A

;  ListMode 
#GL_COMPILE                                            = $1300
#GL_COMPILE_AND_EXECUTE                                = $1301

; LogicOp
#GL_CLEAR                                              = $1500
#GL_AND                                                = $1501
#GL_AND_REVERSE                                        = $1502
#GL_COPY                                               = $1503
#GL_AND_INVERTED                                       = $1504
#GL_NOOP                                               = $1505
#GL_XOR                                                = $1506
#GL_OR                                                 = $1507
#GL_NOR                                                = $1508
#GL_EQUIV                                              = $1509
#GL_INVERT                                             = $150A
#GL_OR_REVERSE                                         = $150B
#GL_COPY_INVERTED                                      = $150C
#GL_OR_INVERTED                                        = $150D
#GL_NAND                                               = $150E
#GL_SET                                                = $150F
; MatrixMode (for gl3.h, FBO attachment type)
#GL_MODELVIEW                                          = $1700
#GL_PROJECTION                                         = $1701
#GL_TEXTURE                                            = $1702
; PixelCopyType
#GL_COLOR                                              = $1800
#GL_DEPTH                                              = $1801
#GL_STENCIL                                            = $1802
; PixelFormat
#GL_STENCIL_INDEX                                      = $1901
#GL_DEPTH_COMPONENT                                    = $1902
#GL_RED                                                = $1903
#GL_GREEN                                              = $1904
#GL_BLUE                                               = $1905
#GL_ALPHA                                              = $1906
#GL_RGB                                                = $1907
#GL_RGBA                                               = $1908
; PolygonMode
#GL_POINT                                              = $1B00
#GL_LINE                                               = $1B01
#GL_FILL                                               = $1B02
; StencilOp
#GL_KEEP                                               = $1E00
#GL_REPLACE                                            = $1E01
#GL_INCR                                               = $1E02
#GL_DECR                                               = $1E03
; StringName
#GL_VENDOR                                             = $1F00
#GL_RENDERER                                           = $1F01
#GL_VERSION                                            = $1F02
#GL_EXTENSIONS                                         = $1F03
; TextureMagFilter
#GL_NEAREST                                            = $2600
#GL_LINEAR                                             = $2601
; TextureMinFilter
#GL_NEAREST_MIPMAP_NEAREST                             = $2700
#GL_LINEAR_MIPMAP_NEAREST                              = $2701
#GL_NEAREST_MIPMAP_LINEAR                              = $2702
#GL_LINEAR_MIPMAP_LINEAR                               = $2703
; TextureParameterName
#GL_TEXTURE_MAG_FILTER                                 = $2800
#GL_TEXTURE_MIN_FILTER                                 = $2801
#GL_TEXTURE_WRAP_S                                     = $2802
#GL_TEXTURE_WRAP_T                                     = $2803
; TextureTarget
#GL_PROXY_TEXTURE_1D                                   = $8063
#GL_PROXY_TEXTURE_2D                                   = $8064
; TextureWrapMode
#GL_CLAMP                                              = $2900
#GL_REPEAT                                             = $2901

;  TextureEnvParameter 
#GL_TEXTURE_ENV_MODE                                   = $2200
#GL_TEXTURE_ENV_COLOR                                  = $2201

;  TextureEnvTarget 
#GL_TEXTURE_ENV                                        = $2300

;  TextureGenMode 
#GL_EYE_LINEAR                                         = $2400
#GL_OBJECT_LINEAR                                      = $2401
#GL_SPHERE_MAP                                         = $2402

;  TextureGenParameter 
#GL_TEXTURE_GEN_MODE                                   = $2500
#GL_OBJECT_PLANE                                       = $2501
#GL_EYE_PLANE                                          = $2502

; PixelInternalFormat
#GL_R3_G3_B2                                           = $2A10
#GL_RGB4                                               = $804F
#GL_RGB5                                               = $8050
#GL_RGB8                                               = $8051
#GL_RGB10                                              = $8052
#GL_RGB12                                              = $8053
#GL_RGB16                                              = $8054
#GL_RGBA2                                              = $8055
#GL_RGBA4                                              = $8056
#GL_RGB5_A1                                            = $8057
#GL_RGBA8                                              = $8058
#GL_RGB10_A2                                           = $8059
#GL_RGBA12                                             = $805A
#GL_RGBA16                                             = $805B
; Lighting
#GL_LIGHTING                                           = $0B50
#GL_LIGHTING_BIT                                       = $00000040
;  LightName 
#GL_LIGHT0                                             = $4000
#GL_LIGHT1                                             = $4001
#GL_LIGHT2                                             = $4002
#GL_LIGHT3                                             = $4003
#GL_LIGHT4                                             = $4004
#GL_LIGHT5                                             = $4005
#GL_LIGHT6                                             = $4006
#GL_LIGHT7                                             = $4007

;  LightParameter 
#GL_AMBIENT                                            = $1200
#GL_DIFFUSE                                            = $1201
#GL_SPECULAR                                           = $1202
#GL_POSITION                                           = $1203
#GL_SPOT_DIRECTION                                     = $1204
#GL_SPOT_EXPONENT                                      = $1205
#GL_SPOT_CUTOFF                                        = $1206
#GL_CONSTANT_ATTENUATION                               = $1207
#GL_LINEAR_ATTENUATION                                 = $1208
#GL_QUADRATIC_ATTENUATION                              = $1209

; RenderingMode 
#GL_RENDER                                             = $1C00
#GL_FEEDBACK                                           = $1C01
#GL_SELECT                                             = $1C02

;  ShadingModel 
#GL_FLAT                                               = $1D00
#GL_SMOOTH                                             = $1D01


#GL_BGR_EXT                                            = $80E0
#GL_BGRA_EXT                                           = $80E1

;}
; ---[ GL_VERSION_1_2 ]-------------------------------------------------------
;{
#GL_UNSIGNED_BYTE_3_3_2                                = $8032
#GL_UNSIGNED_SHORT_4_4_4_4                             = $8033
#GL_UNSIGNED_SHORT_5_5_5_1                             = $8034
#GL_UNSIGNED_INT_8_8_8_8                               = $8035
#GL_UNSIGNED_INT_10_10_10_2                            = $8036
#GL_TEXTURE_BINDING_3D                                 = $806A
#GL_PACK_SKIP_IMAGES                                   = $806B
#GL_PACK_IMAGE_HEIGHT                                  = $806C
#GL_UNPACK_SKIP_IMAGES                                 = $806D
#GL_UNPACK_IMAGE_HEIGHT                                = $806E
#GL_TEXTURE_3D                                         = $806F
#GL_PROXY_TEXTURE_3D                                   = $8070
#GL_TEXTURE_DEPTH                                      = $8071
#GL_TEXTURE_WRAP_R                                     = $8072
#GL_MAX_3D_TEXTURE_SIZE                                = $8073
#GL_UNSIGNED_BYTE_2_3_3_REV                            = $8362
#GL_UNSIGNED_SHORT_5_6_5                               = $8363
#GL_UNSIGNED_SHORT_5_6_5_REV                           = $8364
#GL_UNSIGNED_SHORT_4_4_4_4_REV                         = $8365
#GL_UNSIGNED_SHORT_1_5_5_5_REV                         = $8366
#GL_UNSIGNED_INT_8_8_8_8_REV                           = $8367
#GL_UNSIGNED_INT_2_10_10_10_REV                        = $8368
#GL_BGR                                                = $80E0
#GL_BGRA                                               = $80E1
#GL_MAX_ELEMENTS_VERTICES                              = $80E8
#GL_MAX_ELEMENTS_INDICES                               = $80E9
#GL_CLAMP_TO_EDGE                                      = $812F
#GL_TEXTURE_MIN_LOD                                    = $813A
#GL_TEXTURE_MAX_LOD                                    = $813B
#GL_TEXTURE_BASE_LEVEL                                 = $813C
#GL_TEXTURE_MAX_LEVEL                                  = $813D
#GL_SMOOTH_POINT_SIZE_RANGE                            = $0B12
#GL_SMOOTH_POINT_SIZE_GRANULARITY                      = $0B13
#GL_SMOOTH_LINE_WIDTH_RANGE                            = $0B22
#GL_SMOOTH_LINE_WIDTH_GRANULARITY                      = $0B23
#GL_ALIASED_LINE_WIDTH_RANGE                           = $846E
; ...[ GL_ARB_imaging ].......................................................
#GL_CONSTANT_COLOR                                     = $8001
#GL_ONE_MINUS_CONSTANT_COLOR                           = $8002
#GL_CONSTANT_ALPHA                                     = $8003
#GL_ONE_MINUS_CONSTANT_ALPHA                           = $8004
#GL_BLEND_COLOR                                        = $8005
#GL_FUNC_ADD                                           = $8006
#GL_MIN                                                = $8007
#GL_MAX                                                = $8008
#GL_BLEND_EQUATION                                     = $8009
#GL_FUNC_SUBTRACT                                      = $800A
#GL_FUNC_REVERSE_SUBTRACT                              = $800B
;}
; ---[ GL_VERSION_1_3 ]-------------------------------------------------------
;{
#GL_TEXTURE0                                           = $84C0
#GL_TEXTURE1                                           = $84C1
#GL_TEXTURE2                                           = $84C2
#GL_TEXTURE3                                           = $84C3
#GL_TEXTURE4                                           = $84C4
#GL_TEXTURE5                                           = $84C5
#GL_TEXTURE6                                           = $84C6
#GL_TEXTURE7                                           = $84C7
#GL_TEXTURE8                                           = $84C8
#GL_TEXTURE9                                           = $84C9
#GL_TEXTURE10                                          = $84CA
#GL_TEXTURE11                                          = $84CB
#GL_TEXTURE12                                          = $84CC
#GL_TEXTURE13                                          = $84CD
#GL_TEXTURE14                                          = $84CE
#GL_TEXTURE15                                          = $84CF
#GL_TEXTURE16                                          = $84D0
#GL_TEXTURE17                                          = $84D1
#GL_TEXTURE18                                          = $84D2
#GL_TEXTURE19                                          = $84D3
#GL_TEXTURE20                                          = $84D4
#GL_TEXTURE21                                          = $84D5
#GL_TEXTURE22                                          = $84D6
#GL_TEXTURE23                                          = $84D7
#GL_TEXTURE24                                          = $84D8
#GL_TEXTURE25                                          = $84D9
#GL_TEXTURE26                                          = $84DA
#GL_TEXTURE27                                          = $84DB
#GL_TEXTURE28                                          = $84DC
#GL_TEXTURE29                                          = $84DD
#GL_TEXTURE30                                          = $84DE
#GL_TEXTURE31                                          = $84DF
#GL_ACTIVE_TEXTURE                                     = $84E0
#GL_MULTISAMPLE                                        = $809D
#GL_SAMPLE_ALPHA_TO_COVERAGE                           = $809E
#GL_SAMPLE_ALPHA_TO_ONE                                = $809F
#GL_SAMPLE_COVERAGE                                    = $80A0
#GL_SAMPLE_BUFFERS                                     = $80A8
#GL_SAMPLES                                            = $80A9
#GL_SAMPLE_COVERAGE_VALUE                              = $80AA
#GL_SAMPLE_COVERAGE_INVERT                             = $80AB
#GL_TEXTURE_CUBE_MAP                                   = $8513
#GL_TEXTURE_BINDING_CUBE_MAP                           = $8514
#GL_TEXTURE_CUBE_MAP_POSITIVE_X                        = $8515
#GL_TEXTURE_CUBE_MAP_NEGATIVE_X                        = $8516
#GL_TEXTURE_CUBE_MAP_POSITIVE_Y                        = $8517
#GL_TEXTURE_CUBE_MAP_NEGATIVE_Y                        = $8518
#GL_TEXTURE_CUBE_MAP_POSITIVE_Z                        = $8519
#GL_TEXTURE_CUBE_MAP_NEGATIVE_Z                        = $851A
#GL_PROXY_TEXTURE_CUBE_MAP                             = $851B
#GL_MAX_CUBE_MAP_TEXTURE_SIZE                          = $851C
#GL_COMPRESSED_RGB                                     = $84ED
#GL_COMPRESSED_RGBA                                    = $84EE
#GL_TEXTURE_COMPRESSION_HINT                           = $84EF
#GL_TEXTURE_COMPRESSED_IMAGE_SIZE                      = $86A0
#GL_TEXTURE_COMPRESSED                                 = $86A1
#GL_NUM_COMPRESSED_TEXTURE_FORMATS                     = $86A2
#GL_COMPRESSED_TEXTURE_FORMATS                         = $86A3
#GL_CLAMP_TO_BORDER                                    = $812D
;}
; ---[ GL_VERSION_1_4 ]-------------------------------------------------------
;{
#GL_BLEND_DST_RGB                                      = $80C8
#GL_BLEND_SRC_RGB                                      = $80C9
#GL_BLEND_DST_ALPHA                                    = $80CA
#GL_BLEND_SRC_ALPHA                                    = $80CB
#GL_POINT_FADE_THRESHOLD_SIZE                          = $8128
#GL_DEPTH_COMPONENT16                                  = $81A5
#GL_DEPTH_COMPONENT24                                  = $81A6
#GL_DEPTH_COMPONENT32                                  = $81A7
#GL_MIRRORED_REPEAT                                    = $8370
#GL_MAX_TEXTURE_LOD_BIAS                               = $84FD
#GL_TEXTURE_LOD_BIAS                                   = $8501
#GL_INCR_WRAP                                          = $8507
#GL_DECR_WRAP                                          = $8508
#GL_TEXTURE_DEPTH_SIZE                                 = $884A
#GL_TEXTURE_COMPARE_MODE                               = $884C
#GL_TEXTURE_COMPARE_FUNC                               = $884D
;}
; ---[ GL_VERSION_1_5 ]-------------------------------------------------------
;{
#GL_BUFFER_SIZE                                        = $8764
#GL_BUFFER_USAGE                                       = $8765
#GL_QUERY_COUNTER_BITS                                 = $8864
#GL_CURRENT_QUERY                                      = $8865
#GL_QUERY_RESULT                                       = $8866
#GL_QUERY_RESULT_AVAILABLE                             = $8867
#GL_ARRAY_BUFFER                                       = $8892
#GL_ELEMENT_ARRAY_BUFFER                               = $8893
#GL_ARRAY_BUFFER_BINDING                               = $8894
#GL_ELEMENT_ARRAY_BUFFER_BINDING                       = $8895
#GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING                 = $889F
#GL_READ_ONLY                                          = $88B8
#GL_WRITE_ONLY                                         = $88B9
#GL_READ_WRITE                                         = $88BA
#GL_BUFFER_ACCESS                                      = $88BB
#GL_BUFFER_MAPPED                                      = $88BC
#GL_BUFFER_MAP_POINTER                                 = $88BD
#GL_STREAM_DRAW                                        = $88E0
#GL_STREAM_READ                                        = $88E1
#GL_STREAM_COPY                                        = $88E2
#GL_STATIC_DRAW                                        = $88E4
#GL_STATIC_READ                                        = $88E5
#GL_STATIC_COPY                                        = $88E6
#GL_DYNAMIC_DRAW                                       = $88E8
#GL_DYNAMIC_READ                                       = $88E9
#GL_DYNAMIC_COPY                                       = $88EA
#GL_SAMPLES_PASSED                                     = $8914
;}
; ---[ GL_VERSION_2_0 ]-------------------------------------------------------
;{
#GL_BLEND_EQUATION_RGB                                 = $8009
#GL_VERTEX_ATTRIB_ARRAY_ENABLED                        = $8622
#GL_VERTEX_ATTRIB_ARRAY_SIZE                           = $8623
#GL_VERTEX_ATTRIB_ARRAY_STRIDE                         = $8624
#GL_VERTEX_ATTRIB_ARRAY_TYPE                           = $8625
#GL_CURRENT_VERTEX_ATTRIB                              = $8626
#GL_VERTEX_PROGRAM_POINT_SIZE                          = $8642
#GL_VERTEX_ATTRIB_ARRAY_POINTER                        = $8645
#GL_STENCIL_BACK_FUNC                                  = $8800
#GL_STENCIL_BACK_FAIL                                  = $8801
#GL_STENCIL_BACK_PASS_DEPTH_FAIL                       = $8802
#GL_STENCIL_BACK_PASS_DEPTH_PASS                       = $8803
#GL_MAX_DRAW_BUFFERS                                   = $8824
#GL_DRAW_BUFFER0                                       = $8825
#GL_DRAW_BUFFER1                                       = $8826
#GL_DRAW_BUFFER2                                       = $8827
#GL_DRAW_BUFFER3                                       = $8828
#GL_DRAW_BUFFER4                                       = $8829
#GL_DRAW_BUFFER5                                       = $882A
#GL_DRAW_BUFFER6                                       = $882B
#GL_DRAW_BUFFER7                                       = $882C
#GL_DRAW_BUFFER8                                       = $882D
#GL_DRAW_BUFFER9                                       = $882E
#GL_DRAW_BUFFER10                                      = $882F
#GL_DRAW_BUFFER11                                      = $8830
#GL_DRAW_BUFFER12                                      = $8831
#GL_DRAW_BUFFER13                                      = $8832
#GL_DRAW_BUFFER14                                      = $8833
#GL_DRAW_BUFFER15                                      = $8834
#GL_BLEND_EQUATION_ALPHA                               = $883D
#GL_MAX_VERTEX_ATTRIBS                                 = $8869
#GL_VERTEX_ATTRIB_ARRAY_NORMALIZED                     = $886A
#GL_MAX_TEXTURE_IMAGE_UNITS                            = $8872
#GL_FRAGMENT_SHADER                                    = $8B30
#GL_VERTEX_SHADER                                      = $8B31
#GL_MAX_FRAGMENT_UNIFORM_COMPONENTS                    = $8B49
#GL_MAX_VERTEX_UNIFORM_COMPONENTS                      = $8B4A
#GL_MAX_VARYING_FLOATS                                 = $8B4B
#GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS                     = $8B4C
#GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS                   = $8B4D
#GL_SHADER_TYPE                                        = $8B4F
#GL_FLOAT_VEC2                                         = $8B50
#GL_FLOAT_VEC3                                         = $8B51
#GL_FLOAT_VEC4                                         = $8B52
#GL_INT_VEC2                                           = $8B53
#GL_INT_VEC3                                           = $8B54
#GL_INT_VEC4                                           = $8B55
#GL_BOOL                                               = $8B56
#GL_BOOL_VEC2                                          = $8B57
#GL_BOOL_VEC3                                          = $8B58
#GL_BOOL_VEC4                                          = $8B59
#GL_FLOAT_MAT2                                         = $8B5A
#GL_FLOAT_MAT3                                         = $8B5B
#GL_FLOAT_MAT4                                         = $8B5C
#GL_SAMPLER_1D                                         = $8B5D
#GL_SAMPLER_2D                                         = $8B5E
#GL_SAMPLER_3D                                         = $8B5F
#GL_SAMPLER_CUBE                                       = $8B60
#GL_SAMPLER_1D_SHADOW                                  = $8B61
#GL_SAMPLER_2D_SHADOW                                  = $8B62
#GL_DELETE_STATUS                                      = $8B80
#GL_COMPILE_STATUS                                     = $8B81
#GL_LINK_STATUS                                        = $8B82
#GL_VALIDATE_STATUS                                    = $8B83
#GL_INFO_LOG_LENGTH                                    = $8B84
#GL_ATTACHED_SHADERS                                   = $8B85
#GL_ACTIVE_UNIFORMS                                    = $8B86
#GL_ACTIVE_UNIFORM_MAX_LENGTH                          = $8B87
#GL_SHADER_SOURCE_LENGTH                               = $8B88
#GL_ACTIVE_ATTRIBUTES                                  = $8B89
#GL_ACTIVE_ATTRIBUTE_MAX_LENGTH                        = $8B8A
#GL_FRAGMENT_SHADER_DERIVATIVE_HINT                    = $8B8B
#GL_SHADING_LANGUAGE_VERSION                           = $8B8C
#GL_CURRENT_PROGRAM                                    = $8B8D
#GL_POINT_SPRITE_COORD_ORIGIN                          = $8CA0
#GL_LOWER_LEFT                                         = $8CA1
#GL_UPPER_LEFT                                         = $8CA2
#GL_STENCIL_BACK_REF                                   = $8CA3
#GL_STENCIL_BACK_VALUE_MASK                            = $8CA4
#GL_STENCIL_BACK_WRITEMASK                             = $8CA5
;}
; ---[ GL_VERSION_2_1 ]-------------------------------------------------------
;{
#GL_PIXEL_PACK_BUFFER                                  = $88EB
#GL_PIXEL_UNPACK_BUFFER                                = $88EC
#GL_PIXEL_PACK_BUFFER_BINDING                          = $88ED
#GL_PIXEL_UNPACK_BUFFER_BINDING                        = $88EF
#GL_FLOAT_MAT2x3                                       = $8B65
#GL_FLOAT_MAT2x4                                       = $8B66
#GL_FLOAT_MAT3x2                                       = $8B67
#GL_FLOAT_MAT3x4                                       = $8B68
#GL_FLOAT_MAT4x2                                       = $8B69
#GL_FLOAT_MAT4x3                                       = $8B6A
#GL_SRGB                                               = $8C40
#GL_SRGB8                                              = $8C41
#GL_SRGB_ALPHA                                         = $8C42
#GL_SRGB8_ALPHA8                                       = $8C43
#GL_COMPRESSED_SRGB                                    = $8C48
#GL_COMPRESSED_SRGB_ALPHA                              = $8C49
;}
; ---[ GL_VERSION_3_0 ]-------------------------------------------------------
;{
#GL_COMPARE_REF_TO_TEXTURE                             = $884E
#GL_CLIP_DISTANCE0                                     = $3000
#GL_CLIP_DISTANCE1                                     = $3001
#GL_CLIP_DISTANCE2                                     = $3002
#GL_CLIP_DISTANCE3                                     = $3003
#GL_CLIP_DISTANCE4                                     = $3004
#GL_CLIP_DISTANCE5                                     = $3005
#GL_CLIP_DISTANCE6                                     = $3006
#GL_CLIP_DISTANCE7                                     = $3007
#GL_MAX_CLIP_DISTANCES                                 = $0D32
#GL_MAJOR_VERSION                                      = $821B
#GL_MINOR_VERSION                                      = $821C
#GL_NUM_EXTENSIONS                                     = $821D
#GL_CONTEXT_FLAGS                                      = $821E
#GL_DEPTH_BUFFER                                       = $8223
#GL_STENCIL_BUFFER                                     = $8224
#GL_COMPRESSED_RED                                     = $8225
#GL_COMPRESSED_RG                                      = $8226
#GL_CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT                = $0001
#GL_RGBA32F                                            = $8814
#GL_RGB32F                                             = $8815
#GL_RGBA16F                                            = $881A
#GL_RGB16F                                             = $881B
#GL_VERTEX_ATTRIB_ARRAY_INTEGER                        = $88FD
#GL_MAX_ARRAY_TEXTURE_LAYERS                           = $88FF
#GL_MIN_PROGRAM_TEXEL_OFFSET                           = $8904
#GL_MAX_PROGRAM_TEXEL_OFFSET                           = $8905
#GL_CLAMP_READ_COLOR                                   = $891C
#GL_FIXED_ONLY                                         = $891D
#GL_MAX_VARYING_COMPONENTS                             = $8B4B
#GL_TEXTURE_1D_ARRAY                                   = $8C18
#GL_PROXY_TEXTURE_1D_ARRAY                             = $8C19
#GL_TEXTURE_2D_ARRAY                                   = $8C1A
#GL_PROXY_TEXTURE_2D_ARRAY                             = $8C1B
#GL_TEXTURE_BINDING_1D_ARRAY                           = $8C1C
#GL_TEXTURE_BINDING_2D_ARRAY                           = $8C1D
#GL_R11F_G11F_B10F                                     = $8C3A
#GL_UNSIGNED_INT_10F_11F_11F_REV                       = $8C3B
#GL_RGB9_E5                                            = $8C3D
#GL_UNSIGNED_INT_5_9_9_9_REV                           = $8C3E
#GL_TEXTURE_SHARED_SIZE                                = $8C3F
#GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH              = $8C76
#GL_TRANSFORM_FEEDBACK_BUFFER_MODE                     = $8C7F
#GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS         = $8C80
#GL_TRANSFORM_FEEDBACK_VARYINGS                        = $8C83
#GL_TRANSFORM_FEEDBACK_BUFFER_START                    = $8C84
#GL_TRANSFORM_FEEDBACK_BUFFER_SIZE                     = $8C85
#GL_PRIMITIVES_GENERATED                               = $8C87
#GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN              = $8C88
#GL_RASTERIZER_DISCARD                                 = $8C89
#GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS      = $8C8A
#GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS            = $8C8B
#GL_INTERLEAVED_ATTRIBS                                = $8C8C
#GL_SEPARATE_ATTRIBS                                   = $8C8D
#GL_TRANSFORM_FEEDBACK_BUFFER                          = $8C8E
#GL_TRANSFORM_FEEDBACK_BUFFER_BINDING                  = $8C8F
#GL_RGBA32UI                                           = $8D70
#GL_RGB32UI                                            = $8D71
#GL_RGBA16UI                                           = $8D76
#GL_RGB16UI                                            = $8D77
#GL_RGBA8UI                                            = $8D7C
#GL_RGB8UI                                             = $8D7D
#GL_RGBA32I                                            = $8D82
#GL_RGB32I                                             = $8D83
#GL_RGBA16I                                            = $8D88
#GL_RGB16I                                             = $8D89
#GL_RGBA8I                                             = $8D8E
#GL_RGB8I                                              = $8D8F
#GL_RED_INTEGER                                        = $8D94
#GL_GREEN_INTEGER                                      = $8D95
#GL_BLUE_INTEGER                                       = $8D96
#GL_RGB_INTEGER                                        = $8D98
#GL_RGBA_INTEGER                                       = $8D99
#GL_BGR_INTEGER                                        = $8D9A
#GL_BGRA_INTEGER                                       = $8D9B
#GL_SAMPLER_1D_ARRAY                                   = $8DC0
#GL_SAMPLER_2D_ARRAY                                   = $8DC1
#GL_SAMPLER_1D_ARRAY_SHADOW                            = $8DC3
#GL_SAMPLER_2D_ARRAY_SHADOW                            = $8DC4
#GL_SAMPLER_CUBE_SHADOW                                = $8DC5
#GL_UNSIGNED_INT_VEC2                                  = $8DC6
#GL_UNSIGNED_INT_VEC3                                  = $8DC7
#GL_UNSIGNED_INT_VEC4                                  = $8DC8
#GL_INT_SAMPLER_1D                                     = $8DC9
#GL_INT_SAMPLER_2D                                     = $8DCA
#GL_INT_SAMPLER_3D                                     = $8DCB
#GL_INT_SAMPLER_CUBE                                   = $8DCC
#GL_INT_SAMPLER_1D_ARRAY                               = $8DCE
#GL_INT_SAMPLER_2D_ARRAY                               = $8DCF
#GL_UNSIGNED_INT_SAMPLER_1D                            = $8DD1
#GL_UNSIGNED_INT_SAMPLER_2D                            = $8DD2
#GL_UNSIGNED_INT_SAMPLER_3D                            = $8DD3
#GL_UNSIGNED_INT_SAMPLER_CUBE                          = $8DD4
#GL_UNSIGNED_INT_SAMPLER_1D_ARRAY                      = $8DD6
#GL_UNSIGNED_INT_SAMPLER_2D_ARRAY                      = $8DD7
#GL_QUERY_WAIT                                         = $8E13
#GL_QUERY_NO_WAIT                                      = $8E14
#GL_QUERY_BY_REGION_WAIT                               = $8E15
#GL_QUERY_BY_REGION_NO_WAIT                            = $8E16
#GL_BUFFER_ACCESS_FLAGS                                = $911F
#GL_BUFFER_MAP_LENGTH                                  = $9120
#GL_BUFFER_MAP_OFFSET                                  = $9121
;}
; ---[ GL_VERSION_3_1 ]-------------------------------------------------------
;{
#GL_SAMPLER_2D_RECT                                    = $8B63
#GL_SAMPLER_2D_RECT_SHADOW                             = $8B64
#GL_SAMPLER_BUFFER                                     = $8DC2
#GL_INT_SAMPLER_2D_RECT                                = $8DCD
#GL_INT_SAMPLER_BUFFER                                 = $8DD0
#GL_UNSIGNED_INT_SAMPLER_2D_RECT                       = $8DD5
#GL_UNSIGNED_INT_SAMPLER_BUFFER                        = $8DD8
#GL_TEXTURE_BUFFER                                     = $8C2A
#GL_MAX_TEXTURE_BUFFER_SIZE                            = $8C2B
#GL_TEXTURE_BINDING_BUFFER                             = $8C2C
#GL_TEXTURE_BUFFER_DATA_STORE_BINDING                  = $8C2D
#GL_TEXTURE_BUFFER_FORMAT                              = $8C2E
#GL_TEXTURE_RECTANGLE                                  = $84F5
#GL_TEXTURE_BINDING_RECTANGLE                          = $84F6
#GL_PROXY_TEXTURE_RECTANGLE                            = $84F7
#GL_MAX_RECTANGLE_TEXTURE_SIZE                         = $84F8
#GL_RED_SNORM                                          = $8F90
#GL_RG_SNORM                                           = $8F91
#GL_RGB_SNORM                                          = $8F92
#GL_RGBA_SNORM                                         = $8F93
#GL_R8_SNORM                                           = $8F94
#GL_RG8_SNORM                                          = $8F95
#GL_RGB8_SNORM                                         = $8F96
#GL_RGBA8_SNORM                                        = $8F97
#GL_R16_SNORM                                          = $8F98
#GL_RG16_SNORM                                         = $8F99
#GL_RGB16_SNORM                                        = $8F9A
#GL_RGBA16_SNORM                                       = $8F9B
#GL_SIGNED_NORMALIZED                                  = $8F9C
#GL_PRIMITIVE_RESTART                                  = $8F9D
#GL_PRIMITIVE_RESTART_INDEX                            = $8F9E
;}
; ---[ GL_VERSION_3_2 ]-------------------------------------------------------
;{
#GL_CONTEXT_CORE_PROFILE_BIT                           = $00000001
#GL_CONTEXT_COMPATIBILITY_PROFILE_BIT                  = $00000002
#GL_LINES_ADJACENCY                                    = $000A
#GL_LINE_STRIP_ADJACENCY                               = $000B
#GL_TRIANGLES_ADJACENCY                                = $000C
#GL_TRIANGLE_STRIP_ADJACENCY                           = $000D
#GL_PROGRAM_POINT_SIZE                                 = $8642
#GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS                   = $8C29
#GL_FRAMEBUFFER_ATTACHMENT_LAYERED                     = $8DA7
#GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS               = $8DA8
#GL_GEOMETRY_SHADER                                    = $8DD9
#GL_GEOMETRY_VERTICES_OUT                              = $8916
#GL_GEOMETRY_INPUT_TYPE                                = $8917
#GL_GEOMETRY_OUTPUT_TYPE                               = $8918
#GL_MAX_GEOMETRY_UNIFORM_COMPONENTS                    = $8DDF
#GL_MAX_GEOMETRY_OUTPUT_VERTICES                       = $8DE0
#GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS               = $8DE1
#GL_MAX_VERTEX_OUTPUT_COMPONENTS                       = $9122
#GL_MAX_GEOMETRY_INPUT_COMPONENTS                      = $9123
#GL_MAX_GEOMETRY_OUTPUT_COMPONENTS                     = $9124
#GL_MAX_FRAGMENT_INPUT_COMPONENTS                      = $9125
#GL_CONTEXT_PROFILE_MASK                               = $9126
;}
; ---[ GL_VERSION_3_3 ]-------------------------------------------------------
;{
#GL_VERTEX_ATTRIB_ARRAY_DIVISOR                        = $88FE
;}
; ---[ GL_VERSION_4_0 ]-------------------------------------------------------
;{
#GL_SAMPLE_SHADING                                     = $8C36
#GL_MIN_SAMPLE_SHADING_VALUE                           = $8C37
#GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET                  = $8E5E
#GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET                  = $8E5F
#GL_TEXTURE_CUBE_MAP_ARRAY                             = $9009
#GL_TEXTURE_BINDING_CUBE_MAP_ARRAY                     = $900A
#GL_PROXY_TEXTURE_CUBE_MAP_ARRAY                       = $900B
#GL_SAMPLER_CUBE_MAP_ARRAY                             = $900C
#GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW                      = $900D
#GL_INT_SAMPLER_CUBE_MAP_ARRAY                         = $900E
#GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY                = $900F
;}
; ---[ GL_ARB_depth_buffer_float ]--------------------------------------------
;{
#GL_DEPTH_COMPONENT32F                                 = $8CAC
#GL_DEPTH32F_STENCIL8                                  = $8CAD
#GL_FLOAT_32_UNSIGNED_INT_24_8_REV                     = $8DAD
;}
; ---[ GL_ARB_framebuffer_object ]--------------------------------------------
;{
#GL_INVALID_FRAMEBUFFER_OPERATION                      = $0506
#GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING              = $8210
#GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE              = $8211
#GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE                    = $8212
#GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE                  = $8213
#GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE                   = $8214
#GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE                  = $8215
#GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE                  = $8216
#GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE                = $8217
#GL_FRAMEBUFFER_DEFAULT                                = $8218
#GL_FRAMEBUFFER_UNDEFINED                              = $8219
#GL_DEPTH_STENCIL_ATTACHMENT                           = $821A
#GL_MAX_RENDERBUFFER_SIZE                              = $84E8
#GL_DEPTH_STENCIL                                      = $84F9
#GL_UNSIGNED_INT_24_8                                  = $84FA
#GL_DEPTH24_STENCIL8                                   = $88F0
#GL_TEXTURE_STENCIL_SIZE                               = $88F1
#GL_TEXTURE_RED_TYPE                                   = $8C10
#GL_TEXTURE_GREEN_TYPE                                 = $8C11
#GL_TEXTURE_BLUE_TYPE                                  = $8C12
#GL_TEXTURE_ALPHA_TYPE                                 = $8C13
#GL_TEXTURE_DEPTH_TYPE                                 = $8C16
#GL_UNSIGNED_NORMALIZED                                = $8C17
#GL_FRAMEBUFFER_BINDING                                = $8CA6
#GL_DRAW_FRAMEBUFFER_BINDING                           = $8CA6 ; GL_FRAMEBUFFER_BINDING
#GL_RENDERBUFFER_BINDING                               = $8CA7
#GL_READ_FRAMEBUFFER                                   = $8CA8
#GL_DRAW_FRAMEBUFFER                                   = $8CA9
#GL_READ_FRAMEBUFFER_BINDING                           = $8CAA
#GL_RENDERBUFFER_SAMPLES                               = $8CAB
#GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE                 = $8CD0
#GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME                 = $8CD1
#GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL               = $8CD2
#GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE       = $8CD3
#GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER               = $8CD4
#GL_FRAMEBUFFER_COMPLETE                               = $8CD5
#GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT                  = $8CD6
#GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT          = $8CD7
#GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER                 = $8CDB
#GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER                 = $8CDC
#GL_FRAMEBUFFER_UNSUPPORTED                            = $8CDD
#GL_MAX_COLOR_ATTACHMENTS                              = $8CDF
#GL_COLOR_ATTACHMENT0                                  = $8CE0
#GL_COLOR_ATTACHMENT1                                  = $8CE1
#GL_COLOR_ATTACHMENT2                                  = $8CE2
#GL_COLOR_ATTACHMENT3                                  = $8CE3
#GL_COLOR_ATTACHMENT4                                  = $8CE4
#GL_COLOR_ATTACHMENT5                                  = $8CE5
#GL_COLOR_ATTACHMENT6                                  = $8CE6
#GL_COLOR_ATTACHMENT7                                  = $8CE7
#GL_COLOR_ATTACHMENT8                                  = $8CE8
#GL_COLOR_ATTACHMENT9                                  = $8CE9
#GL_COLOR_ATTACHMENT10                                 = $8CEA
#GL_COLOR_ATTACHMENT11                                 = $8CEB
#GL_COLOR_ATTACHMENT12                                 = $8CEC
#GL_COLOR_ATTACHMENT13                                 = $8CED
#GL_COLOR_ATTACHMENT14                                 = $8CEE
#GL_COLOR_ATTACHMENT15                                 = $8CEF
#GL_DEPTH_ATTACHMENT                                   = $8D00
#GL_STENCIL_ATTACHMENT                                 = $8D20
#GL_FRAMEBUFFER                                        = $8D40
#GL_RENDERBUFFER                                       = $8D41
#GL_RENDERBUFFER_WIDTH                                 = $8D42
#GL_RENDERBUFFER_HEIGHT                                = $8D43
#GL_RENDERBUFFER_INTERNAL_FORMAT                       = $8D44
#GL_STENCIL_INDEX1                                     = $8D46
#GL_STENCIL_INDEX4                                     = $8D47
#GL_STENCIL_INDEX8                                     = $8D48
#GL_STENCIL_INDEX16                                    = $8D49
#GL_RENDERBUFFER_RED_SIZE                              = $8D50
#GL_RENDERBUFFER_GREEN_SIZE                            = $8D51
#GL_RENDERBUFFER_BLUE_SIZE                             = $8D52
#GL_RENDERBUFFER_ALPHA_SIZE                            = $8D53
#GL_RENDERBUFFER_DEPTH_SIZE                            = $8D54
#GL_RENDERBUFFER_STENCIL_SIZE                          = $8D55
#GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE                 = $8D56
#GL_MAX_SAMPLES                                        = $8D57
;}
; ---[ GL_ARB_framebuffer_sRGB ]----------------------------------------------
;{
#GL_FRAMEBUFFER_SRGB                                   = $8DB9
;}
; ---[ GL_ARB_half_float_vertex ]---------------------------------------------
;{
#GL_HALF_FLOAT                                         = $140B
;}
; ---[ GL_ARB_map_buffer_range ]----------------------------------------------
;{
#GL_MAP_READ_BIT                                       = $0001
#GL_MAP_WRITE_BIT                                      = $0002
#GL_MAP_INVALIDATE_RANGE_BIT                           = $0004
#GL_MAP_INVALIDATE_BUFFER_BIT                          = $0008
#GL_MAP_FLUSH_EXPLICIT_BIT                             = $0010
#GL_MAP_UNSYNCHRONIZED_BIT                             = $0020
;}
; ---[ GL_ARB_texture_compression_rgtc ]--------------------------------------
;{
#GL_COMPRESSED_RED_RGTC1                               = $8DBB
#GL_COMPRESSED_SIGNED_RED_RGTC1                        = $8DBC
#GL_COMPRESSED_RG_RGTC2                                = $8DBD
#GL_COMPRESSED_SIGNED_RG_RGTC2                         = $8DBE
;}
; ---[ GL_ARB_texture_rg ]----------------------------------------------------
;{
#GL_RG                                                 = $8227
#GL_RG_INTEGER                                         = $8228
#GL_R8                                                 = $8229
#GL_R16                                                = $822A
#GL_RG8                                                = $822B
#GL_RG16                                               = $822C
#GL_R16F                                               = $822D
#GL_R32F                                               = $822E
#GL_RG16F                                              = $822F
#GL_RG32F                                              = $8230
#GL_R8I                                                = $8231
#GL_R8UI                                               = $8232
#GL_R16I                                               = $8233
#GL_R16UI                                              = $8234
#GL_R32I                                               = $8235
#GL_R32UI                                              = $8236
#GL_RG8I                                               = $8237
#GL_RG8UI                                              = $8238
#GL_RG16I                                              = $8239
#GL_RG16UI                                             = $823A
#GL_RG32I                                              = $823B
#GL_RG32UI                                             = $823C
;}
; ---[ GL_ARB_vertex_array_object ]-------------------------------------------
;{
#GL_VERTEX_ARRAY_BINDING                               = $85B5
;}
; ---[ GL_ARB_uniform_buffer_object ]-----------------------------------------
;{
#GL_UNIFORM_BUFFER                                     = $8A11
#GL_UNIFORM_BUFFER_BINDING                             = $8A28
#GL_UNIFORM_BUFFER_START                               = $8A29
#GL_UNIFORM_BUFFER_SIZE                                = $8A2A
#GL_MAX_VERTEX_UNIFORM_BLOCKS                          = $8A2B
#GL_MAX_GEOMETRY_UNIFORM_BLOCKS                        = $8A2C
#GL_MAX_FRAGMENT_UNIFORM_BLOCKS                        = $8A2D
#GL_MAX_COMBINED_UNIFORM_BLOCKS                        = $8A2E
#GL_MAX_UNIFORM_BUFFER_BINDINGS                        = $8A2F
#GL_MAX_UNIFORM_BLOCK_SIZE                             = $8A30
#GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS             = $8A31
#GL_MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS           = $8A32
#GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS           = $8A33
#GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT                    = $8A34
#GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH               = $8A35
#GL_ACTIVE_UNIFORM_BLOCKS                              = $8A36
#GL_UNIFORM_TYPE                                       = $8A37
#GL_UNIFORM_SIZE                                       = $8A38
#GL_UNIFORM_NAME_LENGTH                                = $8A39
#GL_UNIFORM_BLOCK_INDEX                                = $8A3A
#GL_UNIFORM_OFFSET                                     = $8A3B
#GL_UNIFORM_ARRAY_STRIDE                               = $8A3C
#GL_UNIFORM_MATRIX_STRIDE                              = $8A3D
#GL_UNIFORM_IS_ROW_MAJOR                               = $8A3E
#GL_UNIFORM_BLOCK_BINDING                              = $8A3F
#GL_UNIFORM_BLOCK_DATA_SIZE                            = $8A40
#GL_UNIFORM_BLOCK_NAME_LENGTH                          = $8A41
#GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS                      = $8A42
#GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES               = $8A43
#GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER          = $8A44
#GL_UNIFORM_BLOCK_REFERENCED_BY_GEOMETRY_SHADER        = $8A45
#GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER        = $8A46
#GL_INVALID_INDEX                                      = $FFFFFFFF
;}
; ---[ GL_ARB_copy_buffer ]---------------------------------------------------
;{
#GL_COPY_READ_BUFFER                                   = $8F36
#GL_COPY_WRITE_BUFFER                                  = $8F37
;}
; ---[ GL_ARB_depth_clamp ]---------------------------------------------------
;{
#GL_DEPTH_CLAMP                                        = $864F
;}
; ---[ GL_ARB_provoking_vertex ]----------------------------------------------
;{
#GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION           = $8E4C
#GL_FIRST_VERTEX_CONVENTION                            = $8E4D
#GL_LAST_VERTEX_CONVENTION                             = $8E4E
#GL_PROVOKING_VERTEX                                   = $8E4F
;}
; ---[ GL_ARB_seamless_cube_map ]---------------------------------------------
;{
#GL_TEXTURE_CUBE_MAP_SEAMLESS                          = $884F
;}
; ---[ GL_ARB_sync ]----------------------------------------------------------
;{
#GL_MAX_SERVER_WAIT_TIMEOUT                            = $9111
#GL_OBJECT_TYPE                                        = $9112
#GL_SYNC_CONDITION                                     = $9113
#GL_SYNC_STATUS                                        = $9114
#GL_SYNC_FLAGS                                         = $9115
#GL_SYNC_FENCE                                         = $9116
#GL_SYNC_GPU_COMMANDS_COMPLETE                         = $9117
#GL_UNSIGNALED                                         = $9118
#GL_SIGNALED                                           = $9119
#GL_ALREADY_SIGNALED                                   = $911A
#GL_TIMEOUT_EXPIRED                                    = $911B
#GL_CONDITION_SATISFIED                                = $911C
#GL_WAIT_FAILED                                        = $911D
#GL_SYNC_FLUSH_COMMANDS_BIT                            = $00000001
#GL_TIMEOUT_IGNORED                                    = $FFFFFFFFFFFFFFFF
;}
; ---[ GL_ARB_texture_multisample ]-------------------------------------------
;{
#GL_SAMPLE_POSITION                                    = $8E50
#GL_SAMPLE_MASK                                        = $8E51
#GL_SAMPLE_MASK_VALUE                                  = $8E52
#GL_MAX_SAMPLE_MASK_WORDS                              = $8E59
#GL_TEXTURE_2D_MULTISAMPLE                             = $9100
#GL_PROXY_TEXTURE_2D_MULTISAMPLE                       = $9101
#GL_TEXTURE_2D_MULTISAMPLE_ARRAY                       = $9102
#GL_PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY                 = $9103
#GL_TEXTURE_BINDING_2D_MULTISAMPLE                     = $9104
#GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY               = $9105
#GL_TEXTURE_SAMPLES                                    = $9106
#GL_TEXTURE_FIXED_SAMPLE_LOCATIONS                     = $9107
#GL_SAMPLER_2D_MULTISAMPLE                             = $9108
#GL_INT_SAMPLER_2D_MULTISAMPLE                         = $9109
#GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE                = $910A
#GL_SAMPLER_2D_MULTISAMPLE_ARRAY                       = $910B
#GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY                   = $910C
#GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY          = $910D
#GL_MAX_COLOR_TEXTURE_SAMPLES                          = $910E
#GL_MAX_DEPTH_TEXTURE_SAMPLES                          = $910F
#GL_MAX_INTEGER_SAMPLES                                = $9110
;}
; ---[ GL_ARB_sample_shading ]------------------------------------------------
;{
; in OpenGL 4.0
#GL_SAMPLE_SHADING_ARB                                 = $8C36
#GL_MIN_SAMPLE_SHADING_VALUE_ARB                       = $8C37
;}
; ---[ GL_ARB_texture_cube_map_array ]----------------------------------------
;{
; in OpenGL 4.0
#GL_TEXTURE_CUBE_MAP_ARRAY_ARB                         = $9009
#GL_TEXTURE_BINDING_CUBE_MAP_ARRAY_ARB                 = $900A
#GL_PROXY_TEXTURE_CUBE_MAP_ARRAY_ARB                   = $900B
#GL_SAMPLER_CUBE_MAP_ARRAY_ARB                         = $900C
#GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW_ARB                  = $900D
#GL_INT_SAMPLER_CUBE_MAP_ARRAY_ARB                     = $900E
#GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY_ARB            = $900F
;}
; ---[ GL_ARB_texture_gather ]------------------------------------------------
;{
; in OpenGL 4.0
#GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET_ARB              = $8E5E
#GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET_ARB              = $8E5F
;}
; ---[ GL_ARB_shading_language_include ]--------------------------------------
;{
#GL_SHADER_INCLUDE_ARB                                 = $8DAE
#GL_NAMED_STRING_LENGTH_ARB                            = $8DE9
#GL_NAMED_STRING_TYPE_ARB                              = $8DEA
;}
; ---[ GL_ARB_texture_compression_bptc ]--------------------------------------
;{
#GL_COMPRESSED_RGBA_BPTC_UNORM_ARB                     = $8E8C
#GL_COMPRESSED_SRGB_ALPHA_BPTC_UNORM_ARB               = $8E8D
#GL_COMPRESSED_RGB_BPTC_SIGNED_FLOAT_ARB               = $8E8E
#GL_COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT_ARB             = $8E8F
;}
; ---[ GL_ARB_blend_func_extended ]-------------------------------------------
;{
#GL_SRC1_COLOR                                         = $88F9
#GL_ONE_MINUS_SRC1_COLOR                               = $88FA
#GL_ONE_MINUS_SRC1_ALPHA                               = $88FB
#GL_MAX_DUAL_SOURCE_DRAW_BUFFERS                       = $88FC
;}
; ---[ GL_ARB_occlusion_query2 ]----------------------------------------------
;{
#GL_ANY_SAMPLES_PASSED                                 = $8C2F
;}
; ---[ GL_ARB_sampler_objects ]-----------------------------------------------
;{
#GL_SAMPLER_BINDING                                    = $8919
;}
; ---[ GL_ARB_texture_rgb10_a2ui ]--------------------------------------------
;{
#GL_RGB10_A2UI                                         = $906F
;}
; ---[ GL_ARB_texture_swizzle ]-----------------------------------------------
;{
#GL_TEXTURE_SWIZZLE_R                                  = $8E42
#GL_TEXTURE_SWIZZLE_G                                  = $8E43
#GL_TEXTURE_SWIZZLE_B                                  = $8E44
#GL_TEXTURE_SWIZZLE_A                                  = $8E45
#GL_TEXTURE_SWIZZLE_RGBA                               = $8E46
;}
; ---[ GL_ARB_timer_query ]---------------------------------------------------
;{
#GL_TIME_ELAPSED                                       = $88BF
#GL_TIMESTAMP                                          = $8E28
;}
; ---[ GL_ARB_vertex_type_2_10_10_10_rev ]------------------------------------
;{
#GL_INT_2_10_10_10_REV                                 = $8D9F
;}
; ---[ GL_ARB_draw_indirect ]-------------------------------------------------
;{
#GL_DRAW_INDIRECT_BUFFER                               = $8F3F
#GL_DRAW_INDIRECT_BUFFER_BINDING                       = $8F43
;}
; ---[ GL_ARB_gpu_shader5 ]---------------------------------------------------
;{
#GL_GEOMETRY_SHADER_INVOCATIONS                        = $887F
#GL_MAX_GEOMETRY_SHADER_INVOCATIONS                    = $8E5A
#GL_MIN_FRAGMENT_INTERPOLATION_OFFSET                  = $8E5B
#GL_MAX_FRAGMENT_INTERPOLATION_OFFSET                  = $8E5C
#GL_FRAGMENT_INTERPOLATION_OFFSET_BITS                 = $8E5D
;}
; ---[ GL_ARB_gpu_shader_fp64 ]-----------------------------------------------
;{
#GL_DOUBLE_VEC2                                        = $8FFC
#GL_DOUBLE_VEC3                                        = $8FFD
#GL_DOUBLE_VEC4                                        = $8FFE
#GL_DOUBLE_MAT2                                        = $8F46
#GL_DOUBLE_MAT3                                        = $8F47
#GL_DOUBLE_MAT4                                        = $8F48
#GL_DOUBLE_MAT2x3                                      = $8F49
#GL_DOUBLE_MAT2x4                                      = $8F4A
#GL_DOUBLE_MAT3x2                                      = $8F4B
#GL_DOUBLE_MAT3x4                                      = $8F4C
#GL_DOUBLE_MAT4x2                                      = $8F4D
#GL_DOUBLE_MAT4x3                                      = $8F4E
;}
; ---[ GL_ARB_shader_subroutine ]---------------------------------------------
;{
#GL_ACTIVE_SUBROUTINES                                 = $8DE5
#GL_ACTIVE_SUBROUTINE_UNIFORMS                         = $8DE6
#GL_ACTIVE_SUBROUTINE_UNIFORM_LOCATIONS                = $8E47
#GL_ACTIVE_SUBROUTINE_MAX_LENGTH                       = $8E48
#GL_ACTIVE_SUBROUTINE_UNIFORM_MAX_LENGTH               = $8E49
#GL_MAX_SUBROUTINES                                    = $8DE7
#GL_MAX_SUBROUTINE_UNIFORM_LOCATIONS                   = $8DE8
#GL_NUM_COMPATIBLE_SUBROUTINES                         = $8E4A
#GL_COMPATIBLE_SUBROUTINES                             = $8E4B
;}
; ---[ GL_ARB_tessellation_shader ]-------------------------------------------
;{
#GL_PATCHES                                            = $000E
#GL_PATCH_VERTICES                                     = $8E72
#GL_PATCH_DEFAULT_INNER_LEVEL                          = $8E73
#GL_PATCH_DEFAULT_OUTER_LEVEL                          = $8E74
#GL_TESS_CONTROL_OUTPUT_VERTICES                       = $8E75
#GL_TESS_GEN_MODE                                      = $8E76
#GL_TESS_GEN_SPACING                                   = $8E77
#GL_TESS_GEN_VERTEX_ORDER                              = $8E78
#GL_TESS_GEN_POINT_MODE                                = $8E79
#GL_ISOLINES                                           = $8E7A
#GL_FRACTIONAL_ODD                                     = $8E7B
#GL_FRACTIONAL_EVEN                                    = $8E7C
#GL_MAX_PATCH_VERTICES                                 = $8E7D
#GL_MAX_TESS_GEN_LEVEL                                 = $8E7E
#GL_MAX_TESS_CONTROL_UNIFORM_COMPONENTS                = $8E7F
#GL_MAX_TESS_EVALUATION_UNIFORM_COMPONENTS             = $8E80
#GL_MAX_TESS_CONTROL_TEXTURE_IMAGE_UNITS               = $8E81
#GL_MAX_TESS_EVALUATION_TEXTURE_IMAGE_UNITS            = $8E82
#GL_MAX_TESS_CONTROL_OUTPUT_COMPONENTS                 = $8E83
#GL_MAX_TESS_PATCH_COMPONENTS                          = $8E84
#GL_MAX_TESS_CONTROL_TOTAL_OUTPUT_COMPONENTS           = $8E85
#GL_MAX_TESS_EVALUATION_OUTPUT_COMPONENTS              = $8E86
#GL_MAX_TESS_CONTROL_UNIFORM_BLOCKS                    = $8E89
#GL_MAX_TESS_EVALUATION_UNIFORM_BLOCKS                 = $8E8A
#GL_MAX_TESS_CONTROL_INPUT_COMPONENTS                  = $886C
#GL_MAX_TESS_EVALUATION_INPUT_COMPONENTS               = $886D
#GL_MAX_COMBINED_TESS_CONTROL_UNIFORM_COMPONENTS       = $8E1E
#GL_MAX_COMBINED_TESS_EVALUATION_UNIFORM_COMPONENTS    = $8E1F
#GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_CONTROL_SHADER    = $84F0
#GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_EVALUATION_SHADER = $84F1
#GL_TESS_EVALUATION_SHADER                             = $8E87
#GL_TESS_CONTROL_SHADER                                = $8E88
;}
; ---[ GL_ARB_transform_feedback2 ]-------------------------------------------
;{
#GL_TRANSFORM_FEEDBACK                                 = $8E22
#GL_TRANSFORM_FEEDBACK_BUFFER_PAUSED                   = $8E23
#GL_TRANSFORM_FEEDBACK_BUFFER_ACTIVE                   = $8E24
#GL_TRANSFORM_FEEDBACK_BINDING                         = $8E25
;}
; ---[ GL_ARB_transform_feedback3 ]-------------------------------------------
;{
#GL_MAX_TRANSFORM_FEEDBACK_BUFFERS                     = $8E70
#GL_MAX_VERTEX_STREAMS                                 = $8E71
;}
; ---[ GL_ARB_ES2_compatibility ]---------------------------------------------
;{
#GL_FIXED                                              = $140C
#GL_IMPLEMENTATION_COLOR_READ_TYPE                     = $8B9A
#GL_IMPLEMENTATION_COLOR_READ_FORMAT                   = $8B9B
#GL_LOW_FLOAT                                          = $8DF0
#GL_MEDIUM_FLOAT                                       = $8DF1
#GL_HIGH_FLOAT                                         = $8DF2
#GL_LOW_INT                                            = $8DF3
#GL_MEDIUM_INT                                         = $8DF4
#GL_HIGH_INT                                           = $8DF5
#GL_SHADER_COMPILER                                    = $8DFA
#GL_NUM_SHADER_BINARY_FORMATS                          = $8DF9
#GL_MAX_VERTEX_UNIFORM_VECTORS                         = $8DFB
#GL_MAX_VARYING_VECTORS                                = $8DFC
#GL_MAX_FRAGMENT_UNIFORM_VECTORS                       = $8DFD
;}
; ---[ GL_ARB_get_program_binary ]--------------------------------------------
;{
#GL_PROGRAM_BINARY_RETRIEVABLE_HINT                    = $8257
#GL_PROGRAM_BINARY_LENGTH                              = $8741
#GL_NUM_PROGRAM_BINARY_FORMATS                         = $87FE
#GL_PROGRAM_BINARY_FORMATS                             = $87FF
;}
; ---[ GL_ARB_separate_shader_objects ]---------------------------------------
;{
#GL_VERTEX_SHADER_BIT                                  = $00000001
#GL_FRAGMENT_SHADER_BIT                                = $00000002
#GL_GEOMETRY_SHADER_BIT                                = $00000004
#GL_TESS_CONTROL_SHADER_BIT                            = $00000008
#GL_TESS_EVALUATION_SHADER_BIT                         = $00000010
#GL_ALL_SHADER_BITS                                    = $FFFFFFFF
#GL_PROGRAM_SEPARABLE                                  = $8258
#GL_ACTIVE_PROGRAM                                     = $8259
#GL_PROGRAM_PIPELINE_BINDING                           = $825A
;}
; ---[ GL_ARB_viewport_array ]------------------------------------------------
;{
#GL_MAX_VIEWPORTS                                      = $825B
#GL_VIEWPORT_SUBPIXEL_BITS                             = $825C
#GL_VIEWPORT_BOUNDS_RANGE                              = $825D
#GL_LAYER_PROVOKING_VERTEX                             = $825E
#GL_VIEWPORT_INDEX_PROVOKING_VERTEX                    = $825F
#GL_UNDEFINED_VERTEX                                   = $8260
;}
; ---[ GL_ARB_cl_event ]------------------------------------------------------
;{
#GL_SYNC_CL_EVENT_ARB                                  = $8240
#GL_SYNC_CL_EVENT_COMPLETE_ARB                         = $8241
;}
; ---[ GL_ARB_debug_output ]--------------------------------------------------
;{
#GL_DEBUG_OUTPUT_SYNCHRONOUS_ARB                       = $8242
#GL_DEBUG_NEXT_LOGGED_MESSAGE_LENGTH_ARB               = $8243
#GL_DEBUG_CALLBACK_FUNCTION_ARB                        = $8244
#GL_DEBUG_CALLBACK_USER_PARAM_ARB                      = $8245
#GL_DEBUG_SOURCE_API_ARB                               = $8246
#GL_DEBUG_SOURCE_WINDOW_SYSTEM_ARB                     = $8247
#GL_DEBUG_SOURCE_SHADER_COMPILER_ARB                   = $8248
#GL_DEBUG_SOURCE_THIRD_PARTY_ARB                       = $8249
#GL_DEBUG_SOURCE_APPLICATION_ARB                       = $824A
#GL_DEBUG_SOURCE_OTHER_ARB                             = $824B
#GL_DEBUG_TYPE_ERROR_ARB                               = $824C
#GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR_ARB                 = $824D
#GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR_ARB                  = $824E
#GL_DEBUG_TYPE_PORTABILITY_ARB                         = $824F
#GL_DEBUG_TYPE_PERFORMANCE_ARB                         = $8250
#GL_DEBUG_TYPE_OTHER_ARB                               = $8251
#GL_MAX_DEBUG_MESSAGE_LENGTH_ARB                       = $9143
#GL_MAX_DEBUG_LOGGED_MESSAGES_ARB                      = $9144
#GL_DEBUG_LOGGED_MESSAGES_ARB                          = $9145
#GL_DEBUG_SEVERITY_HIGH_ARB                            = $9146
#GL_DEBUG_SEVERITY_MEDIUM_ARB                          = $9147
#GL_DEBUG_SEVERITY_LOW_ARB                             = $9148
;}
; ---[ GL_ARB_robustness ]----------------------------------------------------
;{
#GL_CONTEXT_FLAG_ROBUST_ACCESS_BIT_ARB                 = $00000004
#GL_LOSE_CONTEXT_ON_RESET_ARB                          = $8252
#GL_GUILTY_CONTEXT_RESET_ARB                           = $8253
#GL_INNOCENT_CONTEXT_RESET_ARB                         = $8254
#GL_UNKNOWN_CONTEXT_RESET_ARB                          = $8255
#GL_RESET_NOTIFICATION_STRATEGY_ARB                    = $8256
#GL_NO_RESET_NOTIFICATION_ARB                          = $8261
;}
;}


; ============================================================================
;  IMPORT OpenGL API
; ============================================================================
;{
CompilerSelect #PB_Compiler_OS
  ;___________________________________________________________________________
  ;  Windows
  ;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
  CompilerCase #PB_OS_Windows
    ; ---[ x64 ]--------------------------------------------------------------
    CompilerIf #PB_Compiler_Processor = #PB_Processor_x64
      ImportC "opengl32.lib"
    ; ---[ x32 ]--------------------------------------------------------------
    CompilerElse
      ImportC "opengl32.lib"
    CompilerEndIf
  ;___________________________________________________________________________
  ;  Linux
  ;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
  CompilerCase #PB_OS_Linux
    ; ---[ x64 ]--------------------------------------------------------------
    CompilerIf #PB_Compiler_Processor = #PB_Processor_x64
      ImportC ""
    ; ---[ x32 ]--------------------------------------------------------------
    CompilerElse
      CompilerError "*> raafal x32 on Linux is not supported at this time."
      ImportC ""
    CompilerEndIf
  ;___________________________________________________________________________
  ;  Mac OS/X
  ;¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
  CompilerCase #PB_OS_MacOS
    ; ---[ x64 ]--------------------------------------------------------------
    CompilerIf #PB_Compiler_Processor = #PB_Processor_x64
      ImportC "/System/Library/Frameworks/OpenGL.framework/OpenGL"
    ; ---[ x32 ]--------------------------------------------------------------
    CompilerElse
      CompilerError "*> raafal x32 on Mac OS/X is not supported at this time."
      ImportC ""
    CompilerEndIf
CompilerEndSelect
glMatrixMode                        ( mode.GLenum )
glOrtho                             (left.GLdouble,right.GLdouble,bottom.GLdouble,top.GLdouble,near.GLdouble,far.GLdouble)
glLoadIdentity                      ()
glRotatef                           (angle.GLfloat,x.GLfloat,y.GLfloat,z.GLfloat)
glTranslatef                        (x.GLfloat,y.GLfloat,z.GLfloat)
glColor3f                           (r.GLfloat,g.GLfloat,b.GLfloat)
glDrawPixels                        ( width.GLsizei, height.GLsizei, format.GLenum, type.GLenum, *data_ )
glCullFace                          ( mode.GLenum )
glFrontFace                         ( mode.GLenum )
glHint                              ( target.GLenum, mode.GLenum )
glLineWidth                         ( width.GLfloat )
glPointSize                         ( size.GLfloat )
glPolygonMode                       ( face.GLenum, mode.GLenum )
glScissor                           ( x.GLint, y.GLint, width.GLsizei, height.GLsizei )
glTexParameterf                     ( target.GLenum, pname.GLenum, param.GLfloat )
glTexParameterfv                    ( target.GLenum, pname.GLenum, params.GLfloat )
glTexParameteri                     ( target.GLenum, pname.GLenum, param.GLint )
glTexParameteriv                    ( target.GLenum, pname.GLenum, params.GLint )
glTexImage1D                        ( target.GLenum, level.GLint, internalformat.GLint, width.GLsizei, border.GLint, format.GLenum, type.GLenum, *pixels )
glTexImage2D                        ( target.GLenum, level.GLint, internalformat.GLint, width.GLsizei, height.GLsizei, border.GLint, format.GLenum, type.GLenum, *pixels )
glDrawBuffer                        ( mode.GLenum )
glClear                             ( mask.GLbitfield )
glClearColor                        ( red.GLclampf, green.GLclampf, blue.GLclampf, alpha.GLclampf )
glClearStencil                      ( s.GLint )
glClearDepth                        ( depth.GLclampd )
glStencilMask                       ( mask.GLuint )
glColorMask                         ( red.GLboolean, green.GLboolean, blue.GLboolean, alpha.GLboolean )
glDepthMask                         ( flag.GLboolean )
glDisable                           ( cap.GLenum )
glEnable                            ( cap.GLenum )
glBegin                             ( cap.GLenum )
glEnd                               ()
glFinish                            ( void )
glFlush                             ( void )
glBlendFunc                         ( sfactor.GLenum, dfactor.GLenum )
glLogicOp                           ( opcode.GLenum )
glStencilFunc                       ( func.GLenum, ref.GLint, mask.GLuint )
glStencilOp                         ( fail.GLenum, zfail.GLenum, zpass.GLenum )
glDepthFunc                         ( func.GLenum )
glPixelStoref                       ( pname.GLenum, param.GLfloat )
glPixelStorei                       ( pname.GLenum, param.GLint )
glReadBuffer                        ( mode.GLenum )
glReadPixels                        ( x.GLint, y.GLint, width.GLsizei, height.GLsizei, format.GLenum, type.GLenum, *pixels )
glGetBooleanv                       ( pname.GLenum, *params )
glGetDoublev                        ( pname.GLenum, *params )
glGetError               .GLenum    (  )
glGetFloatv                         ( pname.GLenum, *params )
glGetIntegerv                       ( pname.GLenum, *params )
glGetString              .i         ( name.GLenum ) ; return const GLubyte*
glGetTexImage                       ( target.GLenum, level.GLint, format.GLenum, type.GLenum, *pixels )
glGetTexParameterfv                 ( target.GLenum, pname.GLenum, params.GLfloat )
glGetTexParameteriv                 ( target.GLenum, pname.GLenum, params.GLint )
glGetTexLevelParameterfv            ( target.GLenum, level.GLint, pname.GLenum, params.GLfloat )
glGetTexLevelParameteriv            ( target.GLenum, level.GLint, pname.GLenum, params.GLint )
glIsEnabled              .GLboolean ( cap.GLenum )
glDepthRange                        ( near.GLclampd, far.GLclampd )
glViewport                          ( x.GLint, y.GLint, width.GLsizei, height.GLsizei )
glNormal3f                          ( x.GLfloat, y.GLfloat, z.GLfloat )
glVertex3f                          ( x.GLfloat, y.GLfloat, z.GLfloat )
glGenTextures                       ( s.GLsizei, *textures  )
glDeleteTextures                    ( n.GLsizei, *textures )
glGenLists                          ( s.GLsizei )
glDeleteLists                       ( l.GLuint,s.GLsizei)

; Shade
glShadeModel                        ( mode.GLenum )
glDrawElements                      ( mode.GLenum, count.GLsizei,type.GLenum, *indices )

;-----------[ Deprecated !!]---------------------------
; Matrix
glPushMatrix                        ()
glPopMatrix                         ()
glMultMatrixf                      ( *matrix )

glBindTexture                       ( mode.GLenum, id.GLint )

; ---[Selection (deprecated in GL3.++) ]----------------------
glSelectBuffer                      ( s.GLsizei, *buffer )
glRenderMode             .GLint     ( mode.GLenum )
glInitNames                         ()
glPushName                          ( name.GLuint )
glLoadName                          ( name.GLuint ) 
glPopName                 .GLuint    ()


EndImport
;}

; glu import
; Import "glu32.lib"
;   gluPickMatrix(x.GLdouble,y.GLdouble,delX.GLdouble,delY.GLdouble,*viewport)
;   gluPerspective(fovy.GLdouble,aspect.GLdouble,zNear.GLdouble,zFar.GLdouble)
;   gluLookAt(eyeX.GLdouble,eyeY.GLdouble,eyeZ.GLdouble,centerX.GLdouble,centerY.GLdouble,centerZ.GLdouble,upX.GLdouble,upY.GLdouble,upZ.GLdouble)
;   gluUnProject(winX.GLdouble,winY.GLdouble,winZ.GLdouble,*model,*proj,*view,*objX,*objY,*objZ)
; EndImport

; 
; ; ============================================================================
; ;  OpenGL Extensions Prototypes
; ; ============================================================================
; ;{
;   Extension Loading is done via GLFW library

; Use these for enable/disable loading of extensions
#ENABLEGL1_0 = #True
#ENABLEGL1_1 = #True
#ENABLEGL1_2 = #True
#ENABLEGL1_3 = #True
#ENABLEGL1_4 = #True
#ENABLEGL1_5 = #True
#ENABLEGL2_0 = #True
#ENABLEGL2_1 = #True
#ENABLEGL3_0 = #True
#ENABLEGL3_1 = #True
#ENABLEGL3_2 = #True
#ENABLEGL3_3 = #True
#ENABLEGLMISC = #True

; Load GL Extensions
CompilerIf #GLFW_GETPROCADDRESS_DEBUG
  Macro  setGLEXT(var, extname)
  var = glfwGetProcAddress(extname)
    If Not var
      Debug(extname+": Not found !!!")
    Else
      Debug(extname+": 0x"+Hex(var))
    EndIf
EndMacro
CompilerElse
  Macro  setGLEXT(var, extname)
    var = glfwGetProcAddress(extname)
  EndMacro
CompilerEndIf
  
  
;- OpenGL 1.2
CompilerIf #ENABLEGL1_2
  Prototype PFNGLBLENDCOLORPROC ( red.f, green.f, blue.f, alpha.f)
  Prototype PFNGLBLENDEQUATIONPROC ( mode.l )
  Prototype PFNGLDRAWRANGEELEMENTSPROC ( mode.l, start.i, End_.i, count.i, type.l, indices.l)
  Prototype PFNGLTEXIMAGE3DPROC ( target.l, level.i, internalformat.i, width.i, height.i, depth.i, border.i, format.l, type.l, pixels.l)
  Prototype PFNGLTEXSUBIMAGE3DPROC ( target.l, level.i, xoffset.i, yoffset.i, zoffset.i, width.i, height.i, depth.i, format.l, type.l, pixels.l)
  Prototype PFNGLCOPYTEXSUBIMAGE3DPROC ( target.l, level.i, xoffset.i, yoffset.i, zoffset.i, x.i, y.i, width.i, height.i )
CompilerEndIf
  
;- OpenGL 1.3
CompilerIf #ENABLEGL1_3
  Prototype PFNGLACTIVETEXTUREPROC ( texture.l )
  Prototype PFNGLSAMPLECOVERAGEPROC ( value.f, invert.b )
  Prototype PFNGLCOMPRESSEDTEXIMAGE3DPROC ( target.l, level.i, internalformat.l, width.i, height.i, depth.i, border.i, imageSize.i, Data_.l )
  Prototype PFNGLCOMPRESSEDTEXIMAGE2DPROC ( target.l, level.i, internalformat.l, width.i, height.i, border.i, imageSize.i, Data_.l )
  Prototype PFNGLCOMPRESSEDTEXIMAGE1DPROC ( target.l, level.i, internalformat.l, width.i, border.i, imageSize.i, Data_.l )
  Prototype PFNGLCOMPRESSEDTEXSUBIMAGE3DPROC ( target.l, level.i, xoffset.i, yoffset.i, zoffset.i, width.i, height.i, depth.i, format.l, imageSize.i, Data_.l )
  Prototype PFNGLCOMPRESSEDTEXSUBIMAGE2DPROC ( target.l, level.i, xoffset.i, yoffset.i, width.i, height.i, format.l, imageSize.i, Data_.l )
  Prototype PFNGLCOMPRESSEDTEXSUBIMAGE1DPROC ( target.l, level.i, xoffset.i, width.i, format.l, imageSize.i, Data_.l )
  Prototype PFNGLGETCOMPRESSEDTEXIMAGEPROC ( target.l, level.i, img.l)
 
CompilerEndIf
  
;- OpenGL 1.4
CompilerIf #ENABLEGL1_4
  Prototype PFNGLBLENDFUNCSEPARATEPROC ( sfactorRGB.l, dfactorRGB.l, sfactorAlpha.l, dfactorAlpha.l)
  Prototype PFNGLMULTIDRAWARRAYSPROC ( mode.l, *first, *count, primcount.i)
  Prototype PFNGLMULTIDRAWELEMENTSPROC ( mode.l, *count, type.l, *indices, primcount )
  Prototype PFNGLPOINTPARAMETERFPROC ( pname.l, param.f )
  Prototype PFNGLPOINTPARAMETERFVPROC ( pname.l, *param )
  Prototype PFNGLPOINTPARAMETERIPROC ( pname.l, param.i )
  Prototype PFNGLPOINTPARAMETERIVPROC ( pname.l, *param )
CompilerEndIf

;- OpenGL 1.5
CompilerIf #ENABLEGL1_5
  Prototype PFNGLGENQUERIESPROC (n.i, *ids)
  Prototype PFNGLDELETEQUERIESPROC (n.i,*ids)
  Prototype.b PFNGLISQUERYPROC (id.i)
  Prototype PFNGLBEGINQUERYPROC (target.l, id.i)
  Prototype PFNGLENDQUERYPROC (target.l)
  Prototype PFNGLGETQUERYIVPROC (target.l, pname.l, *params)
  Prototype PFNGLGETQUERYOBJECTIVPROC (id.i, pname.l, *params)
  Prototype PFNGLGETQUERYOBJECTUIVPROC (id.i, pname.l, *params)
  Prototype PFNGLBINDBUFFERPROC (target.l, buffer.i)
  Prototype PFNGLDELETEBUFFERSPROC (n.i, *buffers)
  Prototype PFNGLGENBUFFERSPROC (n.i, *buffers)
  Prototype.b PFNGLISBUFFERPROC (buffer.i)
  Prototype PFNGLBUFFERDATAPROC (target.l, size.i, *Data_, usage.l)
  Prototype PFNGLBUFFERSUBDATAPROC (target.l, offset.i, size.i, *Data_)
  Prototype PFNGLGETBUFFERSUBDATAPROC (target.l, offset.i, size.i, *Data_)
  Prototype PFNGLMAPBUFFERPROC (target.l, access.l)
  Prototype.b PFNGLUNMAPBUFFERPROC (target.l)
  Prototype PFNGLGETBUFFERPARAMETERIVPROC (target.l, pname.l, *params)
  Prototype PFNGLGETBUFFERPOINTERVPROC (target.l, pname.l, *params)
CompilerEndIf
  
;- OpenGL 2.0
  CompilerIf #ENABLEGL2_0
  Prototype PFNGLBLENDEQUATIONSEPARATEPROC ( modeRGB.l, modeAlpha.l )
  Prototype PFNGLDRAWBUFFERSPROC ( n.i, *bufs )
  Prototype PFNGLSTENCILOPSEPARATEPROC ( face.l, sfail.l, dpfail.l, dppass.l )
  Prototype PFNGLSTENCILFUNCSEPARATEPROC ( face.l, func.l, ref.i, mask.i )
  Prototype PFNGLSTENCILMASKSEPARATEPROC ( face.l, mask.i )
  Prototype PFNGLATTACHSHADERPROC ( program.i, shader.i )
  Prototype PFNGLBINDATTRIBLOCATIONPROC ( program.i, index.i, name.p-utf8 )
  Prototype PFNGLCOMPILESHADERPROC ( shader.i )
  Prototype.i PFNGLCREATEPROGRAMPROC ( )
  Prototype.i PFNGLCREATESHADERPROC ( type.l )
  Prototype PFNGLDELETEPROGRAMPROC ( program.i )
  Prototype PFNGLDELETESHADERPROC ( shader.i )
  Prototype PFNGLDETACHSHADERPROC ( program.i, shader.i )
  Prototype PFNGLDISABLEVERTEXATTRIBARRAYPROC ( index.i )
  Prototype PFNGLENABLEVERTEXATTRIBARRAYPROC ( index.i )
  Prototype PFNGLGETACTIVEATTRIBPROC ( program.i, index.i, bufSize.i, *length, *size, *type, *name )
  Prototype PFNGLGETACTIVEUNIFORMPROC ( program.i, index.i, bufSize.i, *length, *size, *type, *name )
  Prototype PFNGLGETATTACHEDSHADERSPROC ( program.i, maxCount.i, *count, *obj )
  Prototype PFNGLGETATTRIBLOCATIONPROC ( program.i, name.p-utf8 )
  Prototype PFNGLGETPROGRAMIVPROC ( program.i, pname.l, *params )
  Prototype PFNGLGETPROGRAMINFOLOGPROC ( program.i, bufSize.i, *length, *infoLog )
  Prototype PFNGLGETSHADERIVPROC ( shader.i, pname.l, *params )
  Prototype PFNGLGETSHADERINFOLOGPROC ( shader.i, bufSize.i, *length, *infoLog )
  Prototype PFNGLGETSHADERSOURCEPROC ( shader.i, bufSize.i, *length, *source )
  Prototype PFNGLGETUNIFORMLOCATIONPROC ( program.i, name.p-utf8 )
  Prototype PFNGLGETUNIFORMFVPROC ( program.i, location.i, *params )
  Prototype PFNGLGETUNIFORMIVPROC ( program.i, location.i, *params )
  Prototype PFNGLGETVERTEXATTRIBDVPROC ( index.i, pname.l, *params )
  Prototype PFNGLGETVERTEXATTRIBFVPROC ( index.i, pname.l, *params )
  Prototype PFNGLGETVERTEXATTRIBIVPROC ( index.i, pname.l, *params )
  Prototype PFNGLGETVERTEXATTRIBPOINTERVPROC ( index.i, pname.l, *pointer )
  Prototype.b PFNGLISPROGRAMPROC ( program.i )
  Prototype.b PFNGLISSHADERPROC ( shader.i )
  Prototype PFNGLLINKPROGRAMPROC ( program.i )
  Prototype PFNGLSHADERSOURCEPROC ( shader.i, count.i, *string, *length )
  Prototype PFNGLUSEPROGRAMPROC ( program.i )
  Prototype PFNGLUNIFORM1FPROC ( location.i, v0.f )
  Prototype PFNGLUNIFORM2FPROC ( location.i, v0.f, v1.f )
  Prototype PFNGLUNIFORM3FPROC ( location.i, v0.f, v1.f, v2.f )
  Prototype PFNGLUNIFORM4FPROC ( location.i, v0.f, v1.f, v2.f, v3.f )
  Prototype PFNGLUNIFORM1IPROC ( location.i, v0.i )
  Prototype PFNGLUNIFORM2IPROC ( location.i, v0.i, v1.i )
  Prototype PFNGLUNIFORM3IPROC ( location.i, v0.i, v1.i, v2.i )
  Prototype PFNGLUNIFORM4IPROC ( location.i, v0.i, v1.i, v2.i, v3.i )
  Prototype PFNGLUNIFORM1FVPROC ( location.i, count.i, *value )
  Prototype PFNGLUNIFORM2FVPROC ( location.i, count.i, *value )
  Prototype PFNGLUNIFORM3FVPROC ( location.i, count.i, *value )
  Prototype PFNGLUNIFORM4FVPROC ( location.i, count.i, *value )
  Prototype PFNGLUNIFORM1IVPROC ( location.i, count.i, *value )
  Prototype PFNGLUNIFORM2IVPROC ( location.i, count.i, *value )
  Prototype PFNGLUNIFORM3IVPROC ( location.i, count.i, *value )
  Prototype PFNGLUNIFORM4IVPROC ( location.i, count.i, *value )
  Prototype PFNGLUNIFORMMATRIX2FVPROC ( location.i, count.i, transpose.b, *value )
  Prototype PFNGLUNIFORMMATRIX3FVPROC ( location.i, count.i, transpose.b, *value )
  Prototype PFNGLUNIFORMMATRIX4FVPROC ( location.i, count.i, transpose.b, *value )
  Prototype PFNGLVALIDATEPROGRAMPROC ( program.i )
  Prototype PFNGLVERTEXATTRIB1DPROC ( index.i, x.d )
  Prototype PFNGLVERTEXATTRIB1DVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIB1FPROC ( index.i, x.f )
  Prototype PFNGLVERTEXATTRIB1FVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIB1SPROC ( index.i, x.w )
  Prototype PFNGLVERTEXATTRIB1SVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIB2DPROC ( index.i, x.d, y.d )
  Prototype PFNGLVERTEXATTRIB2DVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIB2FPROC ( index.i, x.f, y.f )
  Prototype PFNGLVERTEXATTRIB2FVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIB2SPROC ( index.i, x.w, y.w )
  Prototype PFNGLVERTEXATTRIB2SVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIB3DPROC ( index.i, x.d, y.d, z.d )
  Prototype PFNGLVERTEXATTRIB3DVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIB3FPROC ( index.i, x.f, y.f, z.f )
  Prototype PFNGLVERTEXATTRIB3FVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIB3SPROC ( index.i, x.w, y.w, z.w )
  Prototype PFNGLVERTEXATTRIB3SVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIB4NBVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIB4NIVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIB4NSVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIB4NUBPROC ( index.i, x.b, y.b, z.b, w.b )
  Prototype PFNGLVERTEXATTRIB4NUBVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIB4NUIVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIB4NUSVPROC ( index.i, *v)
  Prototype PFNGLVERTEXATTRIB4BVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIB4DPROC ( index.i, x.d, y.d, z.d, w.d )
  Prototype PFNGLVERTEXATTRIB4DVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIB4FPROC ( index.i, x.f, y.f, z.f, w.f )
  Prototype PFNGLVERTEXATTRIB4FVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIB4IVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIB4SPROC ( index.i, x.w, y.w, z.w, w.w )
  Prototype PFNGLVERTEXATTRIB4SVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIB4UBVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIB4UIVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIB4USVPROC ( index.i, *v)
  Prototype PFNGLVERTEXATTRIBPOINTERPROC ( index.i, size.i, type.l, normalized.b, stride.i, *pointer )
  Prototype PFNGLBINDVERTEXARRAYSPROC(array_.GLuint)
  Prototype PFNGLDELETEVERTEXARRAYSPROC( n.GLsizei, *arrays )
  Prototype PFNGLGENVERTEXARRAYSPROC( n.GLsizei,Array_.GLuint)             
  Prototype PFNGLISVERTEXARRAYPROC( array_.GLuint )
  Prototype PFNGLDRAWARRAYSPROC(mode.GLenum,firts.GLint,count.GLsizei)
    
  
CompilerEndIf

;- OpenGL 2.1
CompilerIf #ENABLEGL2_1
  Prototype PFNGLUNIFORMMATRIX2X3FVPROC ( location.i, count.i, transpose.b, *value )
  Prototype PFNGLUNIFORMMATRIX3X2FVPROC ( location.i, count.i, transpose.b, *value )
  Prototype PFNGLUNIFORMMATRIX2X4FVPROC ( location.i, count.i, transpose.b, *value )
  Prototype PFNGLUNIFORMMATRIX4X2FVPROC ( location.i, count.i, transpose.b, *value )
  Prototype PFNGLUNIFORMMATRIX3X4FVPROC ( location.i, count.i, transpose.b, *value )
  Prototype PFNGLUNIFORMMATRIX4X3FVPROC ( location.i, count.i, transpose.b, *value )
CompilerEndIf
  
;- OpenGL 3.0
CompilerIf #ENABLEGL3_0
  Prototype PFNGLCOLORMASKIPROC ( index.i, r.b, g.b, b.b, a.b )
  Prototype PFNGLGETBOOLEANI_VPROC ( target.i, index.i, *data_ )
  Prototype PFNGLGETINTEGERI_VPROC ( target.i, index.i, *data_ )
  Prototype PFNGLENABLEIPROC ( target.i, index.i )
  Prototype PFNGLDISABLEIPROC ( target.i, index.i )
  Prototype.b PFNGLISENABLEDIPROC ( target.i, index.i )
  Prototype PFNGLBEGINTRANSFORMFEEDBACKPROC ( primitiveMode.l )
  Prototype PFNGLENDTRANSFORMFEEDBACKPROC (  )
  Prototype PFNGLBINDBUFFERRANGEPROC ( target.i, index.i, buffer.i, offset.i, size.i )
  Prototype PFNGLBINDBUFFERBASEPROC ( target.i, index.i, buffer.i )
  Prototype PFNGLTRANSFORMFEEDBACKVARYINGSPROC ( program.i, count.i, *varyings, bufferMode.l )
  Prototype PFNGLGETTRANSFORMFEEDBACKVARYINGPROC ( program.i, index.i, bufSize.i, *length, *size, *type, *name )
  Prototype PFNGLCLAMPCOLORPROC ( target.i, clamp.l )
  Prototype PFNGLBEGINCONDITIONALRENDERPROC ( id.i, mode.l )
  Prototype PFNGLENDCONDITIONALRENDERPROC (  )
  Prototype PFNGLVERTEXATTRIBIPOINTERPROC ( index.i, size.i, type.i, stride.i, *pointer )
  Prototype PFNGLGETVERTEXATTRIBIIVPROC ( index.i, pname.l, *params )
  Prototype PFNGLGETVERTEXATTRIBIUIVPROC ( index.i, pname.l, *params )
  Prototype PFNGLVERTEXATTRIBI1IPROC ( index.i, x.i )
  Prototype PFNGLVERTEXATTRIBI2IPROC ( index.i, x.i, y.i )
  Prototype PFNGLVERTEXATTRIBI3IPROC ( index.i, x.i, y.i, z.i )
  Prototype PFNGLVERTEXATTRIBI4IPROC ( index.i, x.i, y.i, z.i, w.i )
  Prototype PFNGLVERTEXATTRIBI1UIPROC ( index.i, x.i )
  Prototype PFNGLVERTEXATTRIBI2UIPROC ( index.i, x.i, y.i )
  Prototype PFNGLVERTEXATTRIBI3UIPROC ( index.i, x.i, y.i, z.i )
  Prototype PFNGLVERTEXATTRIBI4UIPROC ( index.i, x.i, y.i, z.i, w.i )
  Prototype PFNGLVERTEXATTRIBI1IVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIBI2IVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIBI3IVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIBI4IVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIBI1UIVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIBI2UIVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIBI3UIVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIBI4UIVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIBI4BVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIBI4SVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIBI4UBVPROC ( index.i, *v )
  Prototype PFNGLVERTEXATTRIBI4USVPROC ( index.i, *v )
  Prototype PFNGLGETUNIFORMUIVPROC ( program.i, location.i, *params )
  Prototype PFNGLBINDFRAGDATALOCATIONPROC ( program.i, color.i, *name )
  Prototype.i PFNGLGETFRAGDATALOCATIONPROC ( program.i, *name )
;     Prototype PFNGLUNIFORM1FPROC(location.GLint,v0.GLfloat)
;     Prototype PFNGLUNIFORM2FPROC(location.GLint,v0.GLfloat,v1.GLfloat)
;     Prototype PFNGLUNIFORM3FPROC(location.GLint,v0.GLfloat,v1.GLfloat,v2.GLfloat)
  Prototype PFNGLUNIFORM1UIPROC ( location.i, v0.i )
  Prototype PFNGLUNIFORM2UIPROC ( location.i, v0.i, v1.i )
  Prototype PFNGLUNIFORM3UIPROC ( location.i, v0.i, v1.i, v2.i )
  Prototype PFNGLUNIFORM4UIPROC ( location.i, v0.i, v1.i, v2.i, v3.i )
  Prototype PFNGLUNIFORM1UIVPROC ( location.i, count.i, *value )
  Prototype PFNGLUNIFORM2UIVPROC ( location.i, count.i, *value )
  Prototype PFNGLUNIFORM3UIVPROC ( location.i, count.i, *value )
  Prototype PFNGLUNIFORM4UIVPROC ( location.i, count.i, *value )
  Prototype PFNGLTEXPARAMETERIIVPROC ( target.i, pname.l, *params )
  Prototype PFNGLTEXPARAMETERIUIVPROC ( target.i, pname.l, *params )
  Prototype PFNGLGETTEXPARAMETERIIVPROC ( target.i, pname.l, *params )
  Prototype PFNGLGETTEXPARAMETERIUIVPROC ( target.i, pname.l, *params )
  Prototype PFNGLCLEARBUFFERIVPROC ( buffer.l, drawbuffer.i, *value )
  Prototype PFNGLCLEARBUFFERUIVPROC ( buffer.l, drawbuffer.i, *value )
  Prototype PFNGLCLEARBUFFERFVPROC ( buffer.l, drawbuffer.i, *value )
  Prototype PFNGLCLEARBUFFERFIPROC ( buffer.l, drawbuffer.i, depth.f, stencil.i )
  Prototype.l PFNGLGETSTRINGIPROC ( name.l, index.i )
CompilerEndIf
  
;- OpenGL 3.1
CompilerIf #ENABLEGL3_1
  Prototype PFNGLDRAWARRAYSINSTANCEDPROC ( mode.l, first.i, count.i, primcount.i )
  Prototype PFNGLDRAWELEMENTSINSTANCEDPROC ( mode.l, count.i, type.l, *indices, primcount.i )
  Prototype PFNGLTEXBUFFERPROC ( target.l, internalformat.l, buffer.i )
  Prototype PFNGLPRIMITIVERESTARTINDEXPROC ( index.i )
CompilerEndIf
  
;- OpenGL 3.2
CompilerIf #ENABLEGL3_2
  Prototype PFNGLGETINTEGER64I_VPROC ( target.l, index.i, *data_ )
  Prototype PFNGLGETBUFFERPARAMETERI64VPROC ( target.l, pname.l, *params )
  Prototype PFNGLFRAMEBUFFERTEXTUREPROC ( target.l, attachment.l, texture.i, level.i )
CompilerEndIf
  
;- OpenGL 3.3
CompilerIf #ENABLEGL3_2
  Prototype PFNGLVERTEXATTRIBDIVISORPROC (index.i, divisor.i)
CompilerEndIf

;- OpenGL Misc
CompilerIf #ENABLEGLMISC
  Prototype.b PFNGLISRENDERBUFFERPROC ( renderbuffer.i )
  Prototype PFNGLBINDRENDERBUFFERPROC ( target.l, renderbuffer.i )
  Prototype PFNGLDELETERENDERBUFFERSPROC ( n.i, *renderbuffers )
  Prototype PFNGLGENRENDERBUFFERSPROC ( n.i, *renderbuffers )
  Prototype PFNGLRENDERBUFFERSTORAGEPROC ( target.l, internalformat.l, width.i, height.i )
  Prototype PFNGLGETRENDERBUFFERPARAMETERIVPROC ( target.l, pname.l, *params )
  Prototype.b PFNGLISFRAMEBUFFERPROC ( framebuffer.i )
  Prototype PFNGLBINDFRAMEBUFFERPROC ( target.l, framebuffer.i )
  Prototype PFNGLDELETEFRAMEBUFFERSPROC ( n.i, *framebuffers )
  Prototype PFNGLGENFRAMEBUFFERSPROC ( n.i, *framebuffers )
  Prototype.l PFNGLCHECKFRAMEBUFFERSTATUSPROC ( target.l )
  Prototype PFNGLFRAMEBUFFERTEXTURE1DPROC ( target.l, attachment.l, textarget.l, texture.i, level.i )
  Prototype PFNGLFRAMEBUFFERTEXTURE2DPROC ( target.l, attachment.l, textarget.l, texture.i, level.i )
  Prototype PFNGLFRAMEBUFFERTEXTURE3DPROC ( target.l, attachment.l, textarget.l, texture.i, level.i, zoffset.i )
  Prototype PFNGLFRAMEBUFFERRENDERBUFFERPROC ( target.l, attachment.l, renderbuffertarget.l, renderbuffer.i )
  Prototype PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVPROC ( target.l, attachment.l, pname.l, *params )
  Prototype PFNGLGENERATEMIPMAPPROC ( target.l )
  Prototype PFNGLBLITFRAMEBUFFERPROC ( srcX0.i, srcY0.i, srcX1.i, srcY1.i, dstX0.i, dstY0.i, dstX1.i, dstY1.i, mask.i, filter.l )
  Prototype PFNGLRENDERBUFFERSTORAGEMULTISAMPLEPROC ( target.l, samples.i, internalformat.l, width.i, height.i )
  Prototype PFNGLFRAMEBUFFERTEXTURELAYERPROC ( target.l, attachment.l, texture.i, level.i, layer.i )
CompilerEndIf

; ============================================================================
;  Load OpenGL Extensions
; ============================================================================
Procedure GLLoadExtensions()

  
  ;- OpenGL 1.2
  CompilerIf #ENABLEGL1_2
    Global glBlendColor.PFNGLBLENDCOLORPROC 
    Global glBlendEquation.PFNGLBLENDEQUATIONPROC
    Global glDrawRangeElements.PFNGLDRAWRANGEELEMENTSPROC
    Global glTexImage3D.PFNGLTEXIMAGE3DPROC
    Global glTexSubImage3D.PFNGLTEXSUBIMAGE3DPROC
    Global glCopyTexSubImage3D.PFNGLCOPYTEXSUBIMAGE3DPROC
    
    setGLEXT( glBlendColor,           "glBlendColor" )
    setGLEXT( glBlendEquation,        "glBlendEquation" )
    setGLEXT( glDrawRangeElements,    "glDrawRangeElements" )
    setGLEXT( glTexImage3D,           "glTexImage3D" )
    setGLEXT( glTexSubImage3D,        "glTexSubImage3D" )
    setGLEXT( glCopyTexSubImage3D,    "glCopyTexSubImage3D" )
  CompilerEndIf
  
  ;- OpenGL 1.3
  CompilerIf #ENABLEGL1_3
    Global glActiveTexture.PFNGLACTIVETEXTUREPROC
    Global glSampleCoverage.PFNGLSAMPLECOVERAGEPROC
    Global glCompressedTexImage3D.PFNGLCOMPRESSEDTEXIMAGE3DPROC
    Global glCompressedTexImage2D.PFNGLCOMPRESSEDTEXIMAGE2DPROC
    Global glCompressedTexImage1D.PFNGLCOMPRESSEDTEXIMAGE1DPROC
    Global glCompressedTexSubImage3D.PFNGLCOMPRESSEDTEXSUBIMAGE3DPROC
    Global glCompressedTexSubImage2D.PFNGLCOMPRESSEDTEXSUBIMAGE2DPROC
    Global glCompressedTexSubImage1D.PFNGLCOMPRESSEDTEXSUBIMAGE1DPROC
    Global glGetCompressedTexImage.PFNGLGETCOMPRESSEDTEXIMAGEPROC
    
    setGLEXT( glActiveTexture,            "glActiveTexture" )
    setGLEXT( glSampleCoverage,           "glSampleCoverage" )
    setGLEXT( glCompressedTexImage3D,     "glCompressedTexImage3D" )
    setGLEXT( glCompressedTexImage2D,     "glCompressedTexImage2D" )
    setGLEXT( glCompressedTexImage1D,     "glCompressedTexImage1D" )
    setGLEXT( glCompressedTexSubImage3D,  "glCompressedTexSubImage3D" )
    setGLEXT( glCompressedTexSubImage2D,  "glCompressedTexSubImage2D" )
    setGLEXT( glCompressedTexSubImage1D,  "glCompressedTexSubImage1D" )
    setGLEXT( glGetCompressedTexImage,    "glGetCompressedTexImage" )
  CompilerEndIf
  
  ;- OpenGL 1.4
  CompilerIf #ENABLEGL1_4  
    Global glBlendFuncSeparate.PFNGLBLENDFUNCSEPARATEPROC
    Global glMultiDrawArrays.PFNGLMULTIDRAWARRAYSPROC
    Global glMultiDrawElements.PFNGLMULTIDRAWELEMENTSPROC
    Global glPointParameterf.PFNGLPOINTPARAMETERFPROC
    Global glPointParameterfv.PFNGLPOINTPARAMETERFVPROC
    Global glPointParameteri.PFNGLPOINTPARAMETERIPROC
    Global glPointParameteriv.PFNGLPOINTPARAMETERIVPROC
    
    setGLEXT( glBlendFuncSeparate,  "glBlendFuncSeparate" )
    setGLEXT( glMultiDrawArrays,    "glMultiDrawArrays" )
    setGLEXT( glMultiDrawElements,  "glMultiDrawElements" )
    setGLEXT( glPointParameterf,    "glPointParameterf" )
    setGLEXT( glPointParameterfv,   "glPointParameterfv" )
    setGLEXT( glPointParameteri,    "glPointParameteri" )
    setGLEXT( glPointParameteriv,   "glPointParameteriv" )
  CompilerEndIf
  
  ;- OpenGL 1.5
  CompilerIf #ENABLEGL1_5    
    Global glGenQueries.PFNGLGENQUERIESPROC
    Global glDeleteQueries.PFNGLDELETEQUERIESPROC
    Global glIsQuery.PFNGLISQUERYPROC
    Global glBeginQuery.PFNGLBEGINQUERYPROC
    Global glEndQuery.PFNGLENDQUERYPROC
    Global glGetQueryiv.PFNGLGETQUERYIVPROC
    Global glGetQueryObjectiv.PFNGLGETQUERYOBJECTIVPROC
    Global glGetQueryObjectuiv.PFNGLGETQUERYOBJECTUIVPROC
    Global glBindBuffer.PFNGLBINDBUFFERPROC
    Global glDeleteBuffers.PFNGLDELETEBUFFERSPROC
    Global glGenBuffers.PFNGLGENBUFFERSPROC
    Global glIsBuffer.PFNGLISBUFFERPROC
    Global glBufferData.PFNGLBUFFERDATAPROC
    Global glBufferSubData.PFNGLBUFFERSUBDATAPROC
    Global glGetBufferSubData.PFNGLGETBUFFERSUBDATAPROC
    Global glMapBuffer.PFNGLMAPBUFFERPROC
    Global glUnmapBuffer.PFNGLUNMAPBUFFERPROC
    Global glGetBufferParameteriv.PFNGLGETBUFFERPARAMETERIVPROC
    Global glGetBufferPointerv.PFNGLGETBUFFERPOINTERVPROC
    
    setGLEXT( glGenQueries,           "glGenQueries" )
    setGLEXT( glDeleteQueries,        "glDeleteQueries" )
    setGLEXT( glIsQuery,              "glIsQuery" )
    setGLEXT( glBeginQuery,           "glBeginQuery" )
    setGLEXT( glEndQuery,             "glEndQuery" )
    setGLEXT( glGetQueryiv,           "glGetQueryiv" )
    setGLEXT( glGetQueryObjectiv,     "glGetQueryObjectiv" )
    setGLEXT( glGetQueryObjectuiv,    "glGetQueryObjectuiv" )
    setGLEXT( glBindBuffer,           "glBindBuffer" )
    setGLEXT( glDeleteBuffers,        "glDeleteBuffers" )
    setGLEXT( glGenBuffers,           "glGenBuffers" )
    setGLEXT( glIsBuffer,             "glIsBuffer" )
    setGLEXT( glBufferData,           "glBufferData" )
    setGLEXT( glBufferSubData,        "glBufferSubData" )
    setGLEXT( glMapBuffer,            "glMapBuffer" )
    setGLEXT( glUnmapBuffer,          "glUnmapBuffer" )
    setGLEXT( glGetBufferParameteriv, "glGetBufferParameteriv" )
    setGLEXT( glGetBufferPointerv,    "glGetBufferPointerv" )
  CompilerEndIf
  
  ;- OpenGL 2.0
    CompilerIf #ENABLEGL2_0
    Global glBlendEquationSeparate.PFNGLBLENDEQUATIONSEPARATEPROC
    Global glDrawBuffers.PFNGLDRAWBUFFERSPROC
    Global glStencilOpSeparate.PFNGLSTENCILOPSEPARATEPROC
    Global glStencilFuncSeparate.PFNGLSTENCILFUNCSEPARATEPROC
    Global glStencilMaskSeparate.PFNGLSTENCILMASKSEPARATEPROC
    Global glAttachShader.PFNGLATTACHSHADERPROC
    Global glBindAttribLocation.PFNGLBINDATTRIBLOCATIONPROC
    Global glCompileShader.PFNGLCOMPILESHADERPROC
    Global glCreateProgram.PFNGLCREATEPROGRAMPROC
    Global glCreateShader.PFNGLCREATESHADERPROC
    Global glDeleteProgram.PFNGLDELETEPROGRAMPROC
    Global glDeleteShader.PFNGLDELETESHADERPROC
    Global glDetachShader.PFNGLDETACHSHADERPROC
    Global glDisableVertexAttribArray.PFNGLDISABLEVERTEXATTRIBARRAYPROC
    Global glEnableVertexAttribArray.PFNGLENABLEVERTEXATTRIBARRAYPROC
    Global glGetActiveAttrib.PFNGLGETACTIVEATTRIBPROC
    Global glGetActiveUniform.PFNGLGETACTIVEUNIFORMPROC
    Global glGetAttachedShaders.PFNGLGETATTACHEDSHADERSPROC
    Global glGetAttribLocation.PFNGLGETATTRIBLOCATIONPROC
    Global glGetProgramiv.PFNGLGETPROGRAMIVPROC
    Global glGetProgramInfoLog.PFNGLGETPROGRAMINFOLOGPROC
    Global glGetShaderiv.PFNGLGETSHADERIVPROC
    Global glGetShaderInfoLog.PFNGLGETSHADERINFOLOGPROC
    Global glGetShaderSource.PFNGLGETSHADERSOURCEPROC
    Global glGetUniformLocation.PFNGLGETUNIFORMLOCATIONPROC
    Global glGetUniformfv.PFNGLGETUNIFORMFVPROC
    Global glGetUniformiv.PFNGLGETUNIFORMIVPROC
    Global glGetVertexAttribdv.PFNGLGETVERTEXATTRIBDVPROC
    Global glGetVertexAttribfv.PFNGLGETVERTEXATTRIBFVPROC
    Global glGetVertexAttribiv.PFNGLGETVERTEXATTRIBIVPROC
    Global glGetVertexAttribPointerv.PFNGLGETVERTEXATTRIBPOINTERVPROC
    Global glIsProgram.PFNGLISPROGRAMPROC
    Global glIsShader.PFNGLISSHADERPROC
    Global glLinkProgram.PFNGLLINKPROGRAMPROC
    Global glShaderSource.PFNGLSHADERSOURCEPROC
    Global glUseProgram.PFNGLUSEPROGRAMPROC
    Global glUniform1f.PFNGLUNIFORM1FPROC
    Global glUniform2f.PFNGLUNIFORM2FPROC
    Global glUniform3f.PFNGLUNIFORM3FPROC
    Global glUniform4f.PFNGLUNIFORM4FPROC
    Global glUniform1i.PFNGLUNIFORM1IPROC
    Global glUniform2i.PFNGLUNIFORM2IPROC
    Global glUniform3i.PFNGLUNIFORM3IPROC
    Global glUniform4i.PFNGLUNIFORM4IPROC
    Global glUniform1fv.PFNGLUNIFORM1FVPROC
    Global glUniform2fv.PFNGLUNIFORM2FVPROC
    Global glUniform3fv.PFNGLUNIFORM3FVPROC
    Global glUniform4fv.PFNGLUNIFORM4FVPROC
    Global glUniform1iv.PFNGLUNIFORM1IVPROC
    Global glUniform2iv.PFNGLUNIFORM2IVPROC
    Global glUniform3iv.PFNGLUNIFORM3IVPROC
    Global glUniform4iv.PFNGLUNIFORM4IVPROC
    Global glUniformMatrix2fv.PFNGLUNIFORMMATRIX2FVPROC
    Global glUniformMatrix3fv.PFNGLUNIFORMMATRIX3FVPROC
    Global glUniformMatrix4fv.PFNGLUNIFORMMATRIX4FVPROC
    Global glValidateProgram.PFNGLVALIDATEPROGRAMPROC
    Global glVertexAttrib1d.PFNGLVERTEXATTRIB1DPROC
    Global glVertexAttrib1dv.PFNGLVERTEXATTRIB1DVPROC
    Global glVertexAttrib1f.PFNGLVERTEXATTRIB1FPROC
    Global glVertexAttrib1fv.PFNGLVERTEXATTRIB1FVPROC
    Global glVertexAttrib1s.PFNGLVERTEXATTRIB1SPROC
    Global glVertexAttrib1sv.PFNGLVERTEXATTRIB1SVPROC
    Global glVertexAttrib2d.PFNGLVERTEXATTRIB2DPROC
    Global glVertexAttrib2dv.PFNGLVERTEXATTRIB2DVPROC
    Global glVertexAttrib2f.PFNGLVERTEXATTRIB2FPROC
    Global glVertexAttrib2fv.PFNGLVERTEXATTRIB2FVPROC
    Global glVertexAttrib2s.PFNGLVERTEXATTRIB2SPROC
    Global glVertexAttrib2sv.PFNGLVERTEXATTRIB2SVPROC
    Global glVertexAttrib3d.PFNGLVERTEXATTRIB3DPROC
    Global glVertexAttrib3dv.PFNGLVERTEXATTRIB3DVPROC
    Global glVertexAttrib3f.PFNGLVERTEXATTRIB3FPROC
    Global glVertexAttrib3fv.PFNGLVERTEXATTRIB3FVPROC
    Global glVertexAttrib3s.PFNGLVERTEXATTRIB3SPROC
    Global glVertexAttrib3sv.PFNGLVERTEXATTRIB3SVPROC
    Global glVertexAttrib4Nbv.PFNGLVERTEXATTRIB4NBVPROC
    Global glVertexAttrib4Niv.PFNGLVERTEXATTRIB4NIVPROC
    Global glVertexAttrib4Nsv.PFNGLVERTEXATTRIB4NSVPROC
    Global glVertexAttrib4Nub.PFNGLVERTEXATTRIB4NUBPROC
    Global glVertexAttrib4Nubv.PFNGLVERTEXATTRIB4NUBVPROC
    Global glVertexAttrib4Nuiv.PFNGLVERTEXATTRIB4NUIVPROC
    Global glVertexAttrib4Nusv.PFNGLVERTEXATTRIB4NUSVPROC
    Global glVertexAttrib4bv.PFNGLVERTEXATTRIB4BVPROC
    Global glVertexAttrib4d.PFNGLVERTEXATTRIB4DPROC
    Global glVertexAttrib4dv.PFNGLVERTEXATTRIB4DVPROC
    Global glVertexAttrib4f.PFNGLVERTEXATTRIB4FPROC
    Global glVertexAttrib4fv.PFNGLVERTEXATTRIB4FVPROC
    Global glVertexAttrib4iv.PFNGLVERTEXATTRIB4IVPROC
    Global glVertexAttrib4s.PFNGLVERTEXATTRIB4SPROC
    Global glVertexAttrib4sv.PFNGLVERTEXATTRIB4SVPROC
    Global glVertexAttrib4ubv.PFNGLVERTEXATTRIB4UBVPROC
    Global glVertexAttrib4uiv.PFNGLVERTEXATTRIB4UIVPROC
    Global glVertexAttrib4usv.PFNGLVERTEXATTRIB4USVPROC
    Global glVertexAttribPointer.PFNGLVERTEXATTRIBPOINTERPROC
    Global glBindVertexArray.PFNGLBINDVERTEXARRAYSPROC
    Global glDeleteVertexArrays.PFNGLDELETEVERTEXARRAYSPROC
    Global glGenVertexArrays.PFNGLGENVERTEXARRAYSPROC
    Global glIsVertexArray.PFNGLISVERTEXARRAYPROC
    Global glDrawArrays.PFNGLDRAWARRAYSPROC
    
    setGLEXT( glBlendEquationSeparate,    "glBlendEquationSeparate" )
    setGLEXT( glDrawBuffers,              "glDrawBuffers" )
    setGLEXT( glStencilOpSeparate,        "glStencilOpSeparate" )
    setGLEXT( glStencilFuncSeparate,      "glStencilFuncSeparate" )
    setGLEXT( glStencilMaskSeparate,      "glStencilMaskSeparate" )
    setGLEXT( glAttachShader,             "glAttachShader" )
    setGLEXT( glBindAttribLocation,       "glBindAttribLocation" )
    setGLEXT( glCompileShader,            "glCompileShader" )
    setGLEXT( glCreateProgram,            "glCreateProgram" )
    setGLEXT( glCreateShader,             "glCreateShader" )
    setGLEXT( glDeleteProgram,            "glDeleteProgram" )
    setGLEXT( glDeleteShader,             "glDeleteShader" )
    setGLEXT( glDetachShader,             "glDetachShader" )
    setGLEXT( glDisableVertexAttribArray, "glDisableVertexAttribArray" )
    setGLEXT( glEnableVertexAttribArray,  "glEnableVertexAttribArray" )
    setGLEXT( glGetActiveAttrib,          "glGetActiveAttrib" )
    setGLEXT( glGetActiveUniform,         "glGetActiveUniform" )
    setGLEXT( glGetAttachedShaders,       "glGetAttachedShaders" )
    setGLEXT( glGetAttribLocation,        "glGetAttribLocation" )
    setGLEXT( glGetProgramiv,             "glGetProgramiv" )
    setGLEXT( glGetProgramInfoLog,        "glGetProgramInfoLog" )
    setGLEXT( glGetShaderiv,              "glGetShaderiv" )
    setGLEXT( glGetShaderInfoLog,         "glGetShaderInfoLog" )
    setGLEXT( glGetShaderSource,          "glGetShaderSource" )
    setGLEXT( glGetUniformLocation,       "glGetUniformLocation" )
    setGLEXT( glGetUniformfv,             "glGetUniformfv" )
    setGLEXT( glGetUniformiv,             "glGetUniformiv" )
    setGLEXT( glGetVertexAttribdv,        "glGetVertexAttribdv" )
    setGLEXT( glGetVertexAttribfv,        "glGetVertexAttribfv" )
    setGLEXT( glGetVertexAttribiv,        "glGetVertexAttribiv" )
    setGLEXT( glGetVertexAttribPointerv,  "glGetVertexAttribPointerv" )
    setGLEXT( glIsProgram,                "glIsProgram" )
    setGLEXT( glIsShader,                 "glIsShader" )
    setGLEXT( glLinkProgram,              "glLinkProgram" )
    setGLEXT( glShaderSource,             "glShaderSource" )
    setGLEXT( glUseProgram,               "glUseProgram" )
    setGLEXT( glUniform1f,                "glUniform1f" )
    setGLEXT( glUniform2f,                "glUniform2f" )
    setGLEXT( glUniform3f,                "glUniform3f" )
    setGLEXT( glUniform4f,                "glUniform4f" )
    setGLEXT( glUniform1i,                "glUniform1i" )
    setGLEXT( glUniform2i,                "glUniform2i" )
    setGLEXT( glUniform3i,                "glUniform3i" )
    setGLEXT( glUniform4i,                "glUniform4i" )
    setGLEXT( glUniform1fv,               "glUniform1fv" )
    setGLEXT( glUniform2fv,               "glUniform2fv" )
    setGLEXT( glUniform3fv,               "glUniform3fv" )
    setGLEXT( glUniform4fv,               "glUniform4fv" )
    setGLEXT( glUniform1iv,               "glUniform1iv" )
    setGLEXT( glUniform2iv,               "glUniform2iv" )
    setGLEXT( glUniform3iv,               "glUniform3iv" )
    setGLEXT( glUniform4iv,               "glUniform4iv" )
    setGLEXT( glUniformMatrix2fv,         "glUniformMatrix2fv" )
    setGLEXT( glUniformMatrix3fv,         "glUniformMatrix3fv" )
    setGLEXT( glUniformMatrix4fv,         "glUniformMatrix4fv" )
    setGLEXT( glValidateProgram,          "glValidateProgram" )
    setGLEXT( glVertexAttrib1d,           "glVertexAttrib1d" )
    setGLEXT( glVertexAttrib1dv,          "glVertexAttrib1dv" )
    setGLEXT( glVertexAttrib1f,           "glVertexAttrib1f" )
    setGLEXT( glVertexAttrib1fv,          "glVertexAttrib1fv" )
    setGLEXT( glVertexAttrib1s,           "glVertexAttrib1s" )
    setGLEXT( glVertexAttrib1sv,          "glVertexAttrib1sv" )
    setGLEXT( glVertexAttrib2d,           "glVertexAttrib2d" )
    setGLEXT( glVertexAttrib2dv,          "glVertexAttrib2dv" )
    setGLEXT( glVertexAttrib2f,           "glVertexAttrib2f" )
    setGLEXT( glVertexAttrib2fv,          "glVertexAttrib2fv" )
    setGLEXT( glVertexAttrib2s,           "glVertexAttrib2s" )
    setGLEXT( glVertexAttrib2sv,          "glVertexAttrib2sv" )
    setGLEXT( glVertexAttrib3d,           "glVertexAttrib3d" )
    setGLEXT( glVertexAttrib3dv,          "glVertexAttrib3dv" )
    setGLEXT( glVertexAttrib3f,           "glVertexAttrib3f" )
    setGLEXT( glVertexAttrib3fv,          "glVertexAttrib3fv" )
    setGLEXT( glVertexAttrib3s,           "glVertexAttrib3s" )
    setGLEXT( glVertexAttrib3sv,          "glVertexAttrib3sv" )
    setGLEXT( glVertexAttrib4Nbv,         "glVertexAttrib4Nbv" )
    setGLEXT( glVertexAttrib4Niv,         "glVertexAttrib4Niv" )
    setGLEXT( glVertexAttrib4Nsv,         "glVertexAttrib4Nsv" )
    setGLEXT( glVertexAttrib4Nub,         "glVertexAttrib4Nub" )
    setGLEXT( glVertexAttrib4Nubv,        "glVertexAttrib4Nubv" )
    setGLEXT( glVertexAttrib4Nuiv,        "glVertexAttrib4Nuiv" )
    setGLEXT( glVertexAttrib4Nusv,        "glVertexAttrib4Nusv" )
    setGLEXT( glVertexAttrib4bv,          "glVertexAttrib4bv" )
    setGLEXT( glVertexAttrib4d,           "glVertexAttrib4d" )
    setGLEXT( glVertexAttrib4dv,          "glVertexAttrib4dv" )
    setGLEXT( glVertexAttrib4f,           "glVertexAttrib4f" )
    setGLEXT( glVertexAttrib4fv,          "glVertexAttrib4fv" )
    setGLEXT( glVertexAttrib4iv,          "glVertexAttrib4iv" )
    setGLEXT( glVertexAttrib4s,           "glVertexAttrib4s" )
    setGLEXT( glVertexAttrib4sv,          "glVertexAttrib4sv" )
    setGLEXT( glVertexAttrib4ubv,         "glVertexAttrib4ubv" )
    setGLEXT( glVertexAttrib4uiv,         "glVertexAttrib4Nusv" )
    setGLEXT( glVertexAttrib4usv,         "glVertexAttrib4usv" )
    setGLEXT( glVertexAttribPointer,      "glVertexAttribPointer" )
    setGLEXT( glBindVertexArray,          "glBindVertexArray")
    setGLEXT( glDeleteVertexArrays,       "glDeleteVertexArrays")
    setGLEXT( glGenVertexArrays,          "glGenVertexArrays")
    setGLEXT( glIsVertexArray,            "glIsVertexArray")
    setGLEXT( glDrawArrays,               "glDrawArrays")
  CompilerEndIf
  
  ;- OpenGL 2.1
  CompilerIf #ENABLEGL2_1
    Global glUniformMatrix2x3fv.PFNGLUNIFORMMATRIX2X3FVPROC
    Global glUniformMatrix3x2fv.PFNGLUNIFORMMATRIX3X2FVPROC
    Global glUniformMatrix2x4fv.PFNGLUNIFORMMATRIX2X4FVPROC
    Global glUniformMatrix4x2fv.PFNGLUNIFORMMATRIX4X2FVPROC
    Global glUniformMatrix3x4fv.PFNGLUNIFORMMATRIX3X4FVPROC
    Global glUniformMatrix4x3fv.PFNGLUNIFORMMATRIX4X3FVPROC
    
    setGLEXT( glUniformMatrix2x3fv,      "glUniformMatrix2x3fv" )
    setGLEXT( glUniformMatrix3x2fv,      "glUniformMatrix3x2fv" )
    setGLEXT( glUniformMatrix2x4fv,      "glUniformMatrix2x4fv" )
    setGLEXT( glUniformMatrix4x2fv,      "glUniformMatrix4x2fv" )
    setGLEXT( glUniformMatrix3x4fv,      "glUniformMatrix3x4fv" )
    setGLEXT( glUniformMatrix4x3fv,      "glUniformMatrix4x3fv" )
  CompilerEndIf
  
  ;- OpenGL 3.0
  CompilerIf #ENABLEGL3_0
    Global glColorMaski.PFNGLCOLORMASKIPROC
    Global glGetBooleani_v.PFNGLGETBOOLEANI_VPROC
    Global glGetIntegeri_v.PFNGLGETINTEGERI_VPROC
    Global glEnablei.PFNGLENABLEIPROC
    Global glDisablei.PFNGLDISABLEIPROC
    Global glIsEnabledi.PFNGLISENABLEDIPROC
    Global glBeginTransformFeedback.PFNGLBEGINTRANSFORMFEEDBACKPROC
    Global glEndTransformFeedback.PFNGLENDTRANSFORMFEEDBACKPROC
    Global glBindBufferRange.PFNGLBINDBUFFERRANGEPROC
    Global glBindBufferBase.PFNGLBINDBUFFERBASEPROC
    Global glTransformFeedbackVaryings.PFNGLTRANSFORMFEEDBACKVARYINGSPROC
    Global glGetTransformFeedbackVarying.PFNGLGETTRANSFORMFEEDBACKVARYINGPROC
    Global glClampColor.PFNGLCLAMPCOLORPROC
    Global glBeginConditionalRender.PFNGLBEGINCONDITIONALRENDERPROC
    Global glEndConditionalRender.PFNGLENDCONDITIONALRENDERPROC
    Global glVertexAttribIPointer.PFNGLVERTEXATTRIBIPOINTERPROC
    Global glGetVertexAttribIiv.PFNGLGETVERTEXATTRIBIIVPROC
    Global glGetVertexAttribIuiv.PFNGLGETVERTEXATTRIBIUIVPROC
    Global glVertexAttribI1i.PFNGLVERTEXATTRIBI1IPROC
    Global glVertexAttribI2i.PFNGLVERTEXATTRIBI2IPROC
    Global glVertexAttribI3i.PFNGLVERTEXATTRIBI3IPROC
    Global glVertexAttribI4i.PFNGLVERTEXATTRIBI4IPROC
    Global glVertexAttribI1ui.PFNGLVERTEXATTRIBI1UIPROC
    Global glVertexAttribI2ui.PFNGLVERTEXATTRIBI2UIPROC
    Global glVertexAttribI3ui.PFNGLVERTEXATTRIBI3UIPROC
    Global glVertexAttribI4ui.PFNGLVERTEXATTRIBI4UIPROC
    Global glVertexAttribI1iv.PFNGLVERTEXATTRIBI1IVPROC
    Global glVertexAttribI2iv.PFNGLVERTEXATTRIBI2IVPROC
    Global glVertexAttribI3iv.PFNGLVERTEXATTRIBI3IVPROC
    Global glVertexAttribI4iv.PFNGLVERTEXATTRIBI4IVPROC
    Global glVertexAttribI1uiv.PFNGLVERTEXATTRIBI1UIVPROC
    Global glVertexAttribI2uiv.PFNGLVERTEXATTRIBI2UIVPROC
    Global glVertexAttribI3uiv.PFNGLVERTEXATTRIBI3UIVPROC
    Global glVertexAttribI4uiv.PFNGLVERTEXATTRIBI4UIVPROC
    Global glVertexAttribI4bv.PFNGLVERTEXATTRIBI4BVPROC
    Global glVertexAttribI4sv.PFNGLVERTEXATTRIBI4SVPROC
    Global glVertexAttribI4ubv.PFNGLVERTEXATTRIBI4UBVPROC
    Global glVertexAttribI4usv.PFNGLVERTEXATTRIBI4USVPROC
    Global glGetUniformuiv.PFNGLGETUNIFORMUIVPROC
    Global glBindFragDataLocation.PFNGLBINDFRAGDATALOCATIONPROC
    Global glGetFragDataLocation.PFNGLGETFRAGDATALOCATIONPROC
    Global glUniform1ui.PFNGLUNIFORM1UIPROC
    Global glUniform2ui.PFNGLUNIFORM2UIPROC
    Global glUniform3ui.PFNGLUNIFORM3UIPROC
    Global glUniform4ui.PFNGLUNIFORM4UIPROC
    Global glUniform1uiv.PFNGLUNIFORM1UIVPROC
    Global glUniform2uiv.PFNGLUNIFORM2UIVPROC
    Global glUniform3uiv.PFNGLUNIFORM3UIVPROC
    Global glUniform4uiv.PFNGLUNIFORM4UIVPROC
;     Global glUniform1f.PFNGLUNIFORM1FPROC
;     Global glUniform2f.PFNGLUNIFORM2FPROC
;     Global glUniform3f.PFNGLUNIFORM3FPROC
    Global glTexParameterIiv.PFNGLTEXPARAMETERIIVPROC
    Global glTexParameterIuiv.PFNGLTEXPARAMETERIUIVPROC
    Global glGetTexParameterIiv.PFNGLGETTEXPARAMETERIIVPROC
    Global glGetTexParameterIuiv.PFNGLGETTEXPARAMETERIUIVPROC
    Global glClearBufferiv.PFNGLCLEARBUFFERIVPROC
    Global glClearBufferuiv.PFNGLCLEARBUFFERUIVPROC
    Global glClearBufferfv.PFNGLCLEARBUFFERFVPROC
    Global glClearBufferfi.PFNGLCLEARBUFFERFIPROC
    Global glGetStringi_.PFNGLGETSTRINGIPROC
    
    setGLEXT( glColorMaski,                     "glColorMaski" )
    setGLEXT( glGetBooleani_v,                  "glGetBooleani_v" )
    setGLEXT( glGetIntegeri_v,                  "glGetIntegeri_v" )
    setGLEXT( glEnablei,                        "glEnablei" )
    setGLEXT( glDisablei,                       "glDisablei" )
    setGLEXT( glIsEnabledi,                     "glIsEnabledi" )
    setGLEXT( glBeginTransformFeedback,         "glBeginTransformFeedback" )
    setGLEXT( glEndTransformFeedback,           "glEndTransformFeedback" )
    setGLEXT( glBindBufferRange,                "glBindBufferRange" )
    setGLEXT( glBindBufferBase,                 "glBindBufferBase" )
    setGLEXT( glTransformFeedbackVaryings,      "glTransformFeedbackVaryings" )
    setGLEXT( glGetTransformFeedbackVarying,    "glGetTransformFeedbackVarying" )
    setGLEXT( glClampColor,                     "glClampColor" )
    setGLEXT( glBeginConditionalRender,         "glBeginConditionalRender" )
    setGLEXT( glEndConditionalRender,           "glEndConditionalRender" )
    setGLEXT( glVertexAttribIPointer,           "glVertexAttribIPointer" )
    setGLEXT( glGetVertexAttribIiv,             "glGetVertexAttribIiv" )
    setGLEXT( glGetVertexAttribIuiv,            "glGetVertexAttribIuiv" )
    setGLEXT( glVertexAttribI1i,                "glVertexAttribI1i" )
    setGLEXT( glVertexAttribI2i,                "glVertexAttribI2i" )
    setGLEXT( glVertexAttribI3i,                "glVertexAttribI3i" )
    setGLEXT( glVertexAttribI4i,                "glVertexAttribI4i" )
    setGLEXT( glVertexAttribI1ui,               "glVertexAttribI1ui" )
    setGLEXT( glVertexAttribI2ui,               "glVertexAttribI2ui" )
    setGLEXT( glVertexAttribI3ui,               "glVertexAttribI3ui" )
    setGLEXT( glVertexAttribI4ui,               "glVertexAttribI4ui" )
    setGLEXT( glVertexAttribI1iv,               "glVertexAttribI1iv" )
    setGLEXT( glVertexAttribI2iv,               "glVertexAttribI2iv" )
    setGLEXT( glVertexAttribI3iv,               "glVertexAttribI3iv" )
    setGLEXT( glVertexAttribI4iv,               "glVertexAttribI4iv" )
    setGLEXT( glVertexAttribI1uiv,              "glVertexAttribI1uiv" )
    setGLEXT( glVertexAttribI2uiv,              "glVertexAttribI2uiv" )
    setGLEXT( glVertexAttribI3uiv,              "glVertexAttribI3uiv" )
    setGLEXT( glVertexAttribI4uiv,              "glVertexAttribI4uiv" )
    setGLEXT( glVertexAttribI4bv,               "glVertexAttribI4bv" )
    setGLEXT( glVertexAttribI4sv,               "glVertexAttribI4sv" )
    setGLEXT( glVertexAttribI4ubv,              "glVertexAttribI4ubv" )
    setGLEXT( glVertexAttribI4usv,              "glVertexAttribI4usv" )
    setGLEXT( glGetUniformuiv,                  "glGetUniformuiv" )
    setGLEXT( glBindFragDataLocation,           "glBindFragDataLocation" )
    setGLEXT( glGetFragDataLocation,            "glGetFragDataLocation" )
    setGLEXT( glUniform1ui,                     "glUniform1ui" )
    setGLEXT( glUniform2ui,                     "glUniform2ui" )
    setGLEXT( glUniform3ui,                     "glUniform3ui" )
    setGLEXT( glUniform4ui,                     "glUniform4ui" )
    setGLEXT( glUniform1uiv,                    "glUniform1uiv" )
    setGLEXT( glUniform2uiv,                    "glUniform2uiv" )
    setGLEXT( glUniform3uiv,                    "glUniform3uiv" )
    setGLEXT( glUniform4uiv,                    "glUniform4uiv" )
;     setGLEXT( glUniform1f,                      "glUniform1f")
;     setGLEXT( glUniform2f,                      "glUniform2f")
;     setGLEXT( glUniform3f,                      "glUniform3f")
    setGLEXT( glTexParameterIiv,                "glTexParameterIiv" )
    setGLEXT( glTexParameterIuiv,               "glTexParameterIuiv" )
    setGLEXT( glGetTexParameterIiv,             "glGetTexParameterIiv" )
    setGLEXT( glGetTexParameterIuiv,            "glGetTexParameterIuiv" )
    setGLEXT( glClearBufferiv,                  "glClearBufferiv" )
    setGLEXT( glClearBufferuiv,                 "glClearBufferuiv" )
    setGLEXT( glClearBufferfv,                  "glClearBufferfv" )
    setGLEXT( glClearBufferfi,                  "glClearBufferfi" )
    setGLEXT( glGetStringi_,                     "glGetStringi" )
  CompilerEndIf
  
  ;- OpenGL 3.1
  CompilerIf #ENABLEGL3_1
    Global glDrawArraysInstanced.PFNGLDRAWARRAYSINSTANCEDPROC
    Global glDrawElementsInstanced.PFNGLDRAWELEMENTSINSTANCEDPROC
    Global glTexBuffer.PFNGLTEXBUFFERPROC
    Global glPrimitiveRestartIndex.PFNGLPRIMITIVERESTARTINDEXPROC
    
    setGLEXT( glDrawArraysInstanced,    "glDrawArraysInstanced" )
    setGLEXT( glDrawElementsInstanced,  "glDrawElementsInstanced" )
    setGLEXT( glTexBuffer,              "glTexBuffer" )
    setGLEXT( glPrimitiveRestartIndex,  "glPrimitiveRestartIndex" )
  CompilerEndIf
  
  ;- OpenGL 3.2
  CompilerIf #ENABLEGL3_2
    Global glGetInteger64i_v.PFNGLGETINTEGER64I_VPROC
    Global glGetBufferParameteri64v.PFNGLGETBUFFERPARAMETERI64VPROC
    Global glFramebufferTexture.PFNGLFRAMEBUFFERTEXTUREPROC
    
    setGLEXT( glGetInteger64i_v,        "glGetInteger64i_v" )
    setGLEXT( glGetBufferParameteri64v, "glGetBufferParameteri64v" )
    setGLEXT( glFramebufferTexture,     "glFramebufferTexture" )
  CompilerEndIf
  
  ;- OpenGL 3.3
  CompilerIf #ENABLEGL3_2
    Global glVertexAttribDivisor.PFNGLVERTEXATTRIBDIVISORPROC
    setGLEXT( glVertexAttribDivisor,    "glVertexAttribDivisor" )
  CompilerEndIf
  
  ;- OpenGL Misc
  CompilerIf #ENABLEGLMISC
    Global glIsRenderbuffer.PFNGLISRENDERBUFFERPROC
    Global glBindRenderbuffer.PFNGLBINDRENDERBUFFERPROC
    Global glDeleteRenderbuffers.PFNGLDELETERENDERBUFFERSPROC
    Global glGenRenderbuffers.PFNGLGENRENDERBUFFERSPROC
    Global glRenderbufferStorage.PFNGLRENDERBUFFERSTORAGEPROC
    Global glGetRenderbufferParameteriv.PFNGLGETRENDERBUFFERPARAMETERIVPROC
    Global glIsFramebuffer.PFNGLISFRAMEBUFFERPROC
    Global glBindFramebuffer.PFNGLBINDFRAMEBUFFERPROC
    Global glDeleteFramebuffers.PFNGLDELETEFRAMEBUFFERSPROC
    Global glGenFramebuffers.PFNGLGENFRAMEBUFFERSPROC
    Global glCheckFramebufferStatus.PFNGLCHECKFRAMEBUFFERSTATUSPROC
    Global glFramebufferTexture1D.PFNGLFRAMEBUFFERTEXTURE1DPROC
    Global glFramebufferTexture2D.PFNGLFRAMEBUFFERTEXTURE2DPROC
    Global glFramebufferTexture3D.PFNGLFRAMEBUFFERTEXTURE3DPROC
    Global glFramebufferRenderbuffer.PFNGLFRAMEBUFFERRENDERBUFFERPROC
    Global glGetFramebufferAttachmentParameteriv.PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVPROC
    Global glGenerateMipmap.PFNGLGENERATEMIPMAPPROC
    Global glBlitFramebuffer.PFNGLBLITFRAMEBUFFERPROC
    Global glRenderbufferStorageMultisample.PFNGLRENDERBUFFERSTORAGEMULTISAMPLEPROC
    Global glFramebufferTextureLayer.PFNGLFRAMEBUFFERTEXTURELAYERPROC
    
    setGLEXT( glIsRenderbuffer,                       "glIsRenderbuffer" )
    setGLEXT( glBindRenderbuffer,                     "glBindRenderbuffer" )
    setGLEXT( glDeleteRenderbuffers,                  "glDeleteRenderbuffers" )
    setGLEXT( glGenRenderbuffers,                     "glGenRenderbuffers" )
    setGLEXT( glDeleteRenderbuffers,                  "glDeleteRenderbuffers" )
    setGLEXT( glRenderbufferStorage,                  "glRenderbufferStorage" )
    setGLEXT( glGetRenderbufferParameteriv,           "glGetRenderbufferParameteriv" )
    setGLEXT( glIsFramebuffer,                        "glIsFramebuffer" )
    setGLEXT( glBindFramebuffer,                      "glBindFramebuffer" )
    setGLEXT( glDeleteFramebuffers,                   "glDeleteFramebuffers" )
    setGLEXT( glGenFramebuffers,                      "glGenFramebuffers" )
    setGLEXT( glCheckFramebufferStatus,               "glCheckFramebufferStatus" )
    setGLEXT( glFramebufferTexture1D,                 "glFramebufferTexture1D" )
    setGLEXT( glFramebufferTexture2D,                 "glFramebufferTexture2D" )
    setGLEXT( glFramebufferTexture3D,                 "glFramebufferTexture3D" )
    setGLEXT( glFramebufferRenderbuffer,              "glFramebufferRenderbuffer" )
    setGLEXT( glGetFramebufferAttachmentParameteriv,  "glGetFramebufferAttachmentParameteriv" )
    setGLEXT( glGenerateMipmap,                       "glGenerateMipmap" )
    setGLEXT( glBlitFramebuffer,                      "glBlitFramebuffer" )
    setGLEXT( glRenderbufferStorageMultisample,       "glRenderbufferStorageMultisample" )
    setGLEXT( glFramebufferTextureLayer,              "glFramebufferTextureLayer" )
  CompilerEndIf
EndProcedure




; PrototypeC           glDrawArrays                         ( mode.GLenum, first.GLint, count.GLsizei )
; PrototypeC           glDrawElements                       ( mode.GLenum, count.GLsizei, type.GLenum, *indices )
; PrototypeC           glGetPointerv                        ( pname.GLenum, *params )
; PrototypeC           glPolygonOffset                      ( factor.GLfloat, units.GLfloat )
; PrototypeC           glCopyTexImage1D                     ( target.GLenum, level.GLint, internalformat.GLenum, x.GLint, y.GLint, width.GLsizei, border.GLint )
; PrototypeC           glCopyTexImage2D                     ( target.GLenum, level.GLint, internalformat.GLenum, x.GLint, y.GLint, width.GLsizei, height.GLsizei, border.GLint )
; PrototypeC           glCopyTexSubImage1D                  ( target.GLenum, level.GLint, xoffset.GLint, x.GLint, y.GLint, width.GLsizei )
; PrototypeC           glCopyTexSubImage2D                  ( target.GLenum, level.GLint, xoffset.GLint, yoffset.GLint, x.GLint, y.GLint, width.GLsizei, height.GLsizei )
; PrototypeC           glTexSubImage1D                      ( target.GLenum, level.GLint, xoffset.GLint, width.GLsizei, format.GLenum, type.GLenum, *pixels )
; PrototypeC           glTexSubImage2D                      ( target.GLenum, level.GLint, xoffset.GLint, yoffset.GLint, width.GLsizei, height.GLsizei, format.GLenum, type.GLenum, *pixels )
; PrototypeC           glBindTexture                        ( target.GLenum, texture.GLuint )
; PrototypeC           glDeleteTextures                     ( n.GLsizei, *textures )
; PrototypeC           glGenTextures                        ( n.GLsizei, *textures )
; PrototypeC.GLboolean glIsTexture                          ( texture.GLuint )
; PrototypeC           glBlendColor                         ( red.GLclampf, green.GLclampf, blue.GLclampf, alpha.GLclampf )
; PrototypeC           glBlendEquation                      ( mode.GLenum )
; PrototypeC           glDrawRangeElements                  ( mode.GLenum, start.GLuint, end_.GLuint, count.GLsizei, type.GLenum, *indices )
; PrototypeC           glTexImage3D                         ( target.GLenum, level.GLint, internalformat.GLint, width.GLsizei, height.GLsizei, depth.GLsizei, border.GLint, format.GLenum, type.GLenum, *pixels )
; PrototypeC           glTexSubImage3D                      ( target.GLenum, level.GLint, xoffset.GLint, yoffset.GLint, zoffset.GLint, width.GLsizei, height.GLsizei, depth.GLsizei, format.GLenum, type.GLenum, *pixels )
; PrototypeC           glCopyTexSubImage3D                  ( target.GLenum, level.GLint, xoffset.GLint, yoffset.GLint, zoffset.GLint, x.GLint, y.GLint, width.GLsizei, height.GLsizei )
; PrototypeC           glActiveTexture                      ( texture.GLenum )
; PrototypeC           glSampleCoverage                     ( value.GLclampf, invert.GLboolean )
; PrototypeC           glCompressedTexImage3D               ( target.GLenum, level.GLint, internalformat.GLenum, width.GLsizei, height.GLsizei, depth.GLsizei, border.GLint, imageSize.GLsizei, *data_ )
; PrototypeC           glCompressedTexImage2D               ( target.GLenum, level.GLint, internalformat.GLenum, width.GLsizei, height.GLsizei, border.GLint, imageSize.GLsizei, *data_ )
; PrototypeC           glCompressedTexImage1D               ( target.GLenum, level.GLint, internalformat.GLenum, width.GLsizei, border.GLint, imageSize.GLsizei, *data_ )
; PrototypeC           glCompressedTexSubImage3D            ( target.GLenum, level.GLint, xoffset.GLint, yoffset.GLint, zoffset.GLint, width.GLsizei, height.GLsizei, depth.GLsizei, format.GLenum, imageSize.GLsizei, *data_ )
; PrototypeC           glCompressedTexSubImage2D            ( target.GLenum, level.GLint, xoffset.GLint, yoffset.GLint, width.GLsizei, height.GLsizei, format.GLenum, imageSize.GLsizei, *data_ )
; PrototypeC           glCompressedTexSubImage1D            ( target.GLenum, level.GLint, xoffset.GLint, width.GLsizei, format.GLenum, imageSize.GLsizei, *data_ )
; PrototypeC           glGetCompressedTexImage              ( target.GLenum, level.GLint, *img )
; PrototypeC           glBlendFuncSeparate                  ( sfactorRGB.GLenum, dfactorRGB.GLenum, sfactorAlpha.GLenum, dfactorAlpha.GLenum )
; PrototypeC           glMultiDrawArrays                    ( mode.GLenum, first.GLint, count.GLsizei,  primcount.GLsizei )
; PrototypeC           glMultiDrawElements                  ( mode.GLenum, count.GLsizei, type.GLenum, *indices, primcount.GLsizei )
; PrototypeC           glPointParameterf                    ( pname.GLenum, param.GLfloat )                                                                                                                                                 
; PrototypeC           glPointParameterfv                   ( pname.GLenum, *params )
; PrototypeC           glPointParameteri                    ( pname.GLenum, param.GLint )
; PrototypeC           glPointParameteriv                   ( pname.GLenum, params.GLint )
; PrototypeC           glGenQueries                         ( n.GLsizei, *ids )
; PrototypeC           glDeleteQueries                      ( n.GLsizei, *ids )
; PrototypeC.GLboolean glIsQuery                            ( id.GLuint )
; PrototypeC           glBeginQuery                         ( target.GLenum, id.GLuint )
; PrototypeC           glEndQuery                           ( target.GLenum )
; PrototypeC           glGetQueryiv                         ( target.GLenum, pname.GLenum, *params )
; PrototypeC           glGetQueryObjectiv                   ( id.GLuint, pname.GLenum, *params )
; PrototypeC           glGetQueryObjectuiv                  ( id.GLuint, pname.GLenum, *params )
; PrototypeC           glBindBuffer                         ( target.GLenum, buffer.GLuint )
; PrototypeC           glDeleteBuffers                      ( n.GLsizei, *buffers )
; PrototypeC           PGLGENBUFFERS                         ( n.GLsizei, *buffers )
; PrototypeC.GLboolean glIsBuffer                           ( buffer.GLuint )
; PrototypeC           glBufferData                         ( target.GLenum, size.GLsizeiptr, *data_, usage.GLenum )
; PrototypeC           glBufferSubData                      ( target.GLenum, offset.GLintptr, size.GLsizeiptr, *data_ )
; PrototypeC           glGetBufferSubData                   ( target.GLenum, offset.GLintptr, size.GLsizeiptr, *data_ )
; PrototypeC.i         glMapBuffer                          ( target.GLenum, access.GLenum )
; PrototypeC.GLboolean glUnmapBuffer                        ( target.GLenum )
; PrototypeC           glGetBufferParameteriv               ( target.GLenum, pname.GLenum, *params )
; PrototypeC           glGetBufferPointerv                  ( target.GLenum, pname.GLenum, *params ) ; GLvoid** params
; PrototypeC           glBlendEquationSeparate              ( modeRGB.GLenum, modeAlpha.GLenum )
; PrototypeC           glDrawBuffers                        ( n.GLsizei, *bufs )
; PrototypeC           glStencilOpSeparate                  ( face.GLenum, sfail.GLenum, dpfail.GLenum, dppassv.GLenum  )
; PrototypeC           glStencilFuncSeparate                ( face.GLenum, func.GLenum, ref.GLint, mask.GLuint )
; PrototypeC           glStencilMaskSeparate                ( face.GLenum, mask.GLuint )
; PrototypeC           glAttachShader                       ( program.GLuint, shader.GLuint )
; PrototypeC           glBindAttribLocation                 ( program.GLuint, index.GLuint, name.p-ascii )
; PrototypeC           glCompileShader                      ( shader.GLuint )
; PrototypeC.GLuint    glCreateProgram                      ( void )
; PrototypeC.GLuint    glCreateShader                       ( type.GLenum )
; PrototypeC           glDeleteProgram                      ( program.GLuint )
; PrototypeC           glDeleteShader                       ( shader.GLuint )
; PrototypeC           glDetachShader                       ( program.GLuint, shader.GLuint )
; PrototypeC           glDisableVertexAttribArray           ( index.GLuint )
; PrototypeC           glEnableVertexAttribArray            ( index.GLuint )
; PrototypeC           glGetActiveAttrib                    ( program.GLuint, index.GLuint, bufSize.GLsizei, length.GLsizei, size.GLint, type.GLenum, name.p-ascii )
; PrototypeC           glGetActiveUniform                   ( program.GLuint, index.GLuint, bufSize.GLsizei, length.GLsizei, size.GLint, type.GLenum, name.p-ascii )
; PrototypeC           glGetAttachedShaders                 ( program.GLuint, maxCount.GLsizei, count.GLsizei, obj.GLuint )
; PrototypeC.GLint     glGetAttribLocation                  ( program.GLuint, name.p-ascii )
; PrototypeC           glGetProgramiv                       ( program.GLuint, pname.GLenum, *params )
; PrototypeC           glGetProgramInfoLog                  ( program.GLuint, bufSize.GLsizei, length.GLsizei, *infoLog )
; PrototypeC           glGetShaderiv                        ( shader.GLuint, pname.GLenum, *params )
; PrototypeC           glGetShaderInfoLog                   ( shader.GLuint, bufSize.GLsizei, length.GLsizei, *infoLog )
; PrototypeC           glGetShaderSource                    ( shader.GLuint, bufSize.GLsizei, length.GLsizei, *source )
; PrototypeC.GLint     glGetUniformLocation                 ( program.GLuint, name.p-ascii )
; PrototypeC           glGetUniformfv                       ( program.GLuint, location.GLint, *params )
; PrototypeC           glGetUniformiv                       ( program.GLuint, location.GLint, *params )
; PrototypeC           glGetVertexAttribdv                  ( index.GLuint, pname.GLenum, *params )
; PrototypeC           glGetVertexAttribfv                  ( index.GLuint, pname.GLenum, *params )
; PrototypeC           glGetVertexAttribiv                  ( index.GLuint, pname.GLenum, *params )
; PrototypeC           glGetVertexAttribPointerv            ( index.GLuint, pname.GLenum, *pointer )
; PrototypeC.GLboolean glIsProgram                          ( program.GLuint )
; PrototypeC.GLboolean glIsShader                           ( shader.GLuint )
; PrototypeC           glLinkProgram                        ( program.GLuint )
; PrototypeC           glShaderSource                       ( shader.GLuint, count.GLsizei, *string, *length ) ; const GLchar** string
; PrototypeC           glUseProgram                         ( program.GLuint )
; PrototypeC           glUniform1f                          ( location.GLint, v0.GLfloat )
; PrototypeC           glUniform2f                          ( location.GLint, v0.GLfloat, v1.GLfloat )
; PrototypeC           glUniform3f                          ( location.GLint, v0.GLfloat, v1.GLfloat, v2.GLfloat )
; PrototypeC           glUniform4f                          ( location.GLint, v0.GLfloat, v1.GLfloat, v2.GLfloat, v3.GLfloat )
; PrototypeC           glUniform1i                          ( location.GLint, v0.GLint )
; PrototypeC           glUniform2i                          ( location.GLint, v0.GLint, v1.GLint )
; PrototypeC           glUniform3i                          ( location.GLint, v0.GLint, v1.GLint, v2.GLint )
; PrototypeC           glUniform4i                          ( location.GLint, v0.GLint, v1.GLint, v2.GLint, v3.GLint )
; PrototypeC           glUniform1fv                         ( location.GLint, count.GLsizei, *value )
; PrototypeC           glUniform2fv                         ( location.GLint, count.GLsizei, *value )
; PrototypeC           glUniform3fv                         ( location.GLint, count.GLsizei, *value )
; PrototypeC           glUniform4fv                         ( location.GLint, count.GLsizei, *value )
; PrototypeC           glUniform1iv                         ( location.GLint, count.GLsizei, *value )
; PrototypeC           glUniform2iv                         ( location.GLint, count.GLsizei, *value )
; PrototypeC           glUniform3iv                         ( location.GLint, count.GLsizei, *value )
; PrototypeC           glUniform4iv                         ( location.GLint, count.GLsizei, *value )
; PrototypeC           glUniformMatrix2fv                   ( location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glUniformMatrix3fv                   ( location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glUniformMatrix4fv                   ( location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glValidateProgram                    ( program.GLuint )
; PrototypeC           glVertexAttrib1d                     ( index.GLuint, x.GLdouble )
; PrototypeC           glVertexAttrib1dv                    ( index.GLuint, *v )
; PrototypeC           glVertexAttrib1f                     ( index.GLuint, x.GLfloat )
; PrototypeC           glVertexAttrib1fv                    ( index.GLuint, *v )
; PrototypeC           glVertexAttrib1s                     ( index.GLuint, x.GLshort )
; PrototypeC           glVertexAttrib1sv                    ( index.GLuint, *v )
; PrototypeC           glVertexAttrib2d                     ( index.GLuint, x.GLdouble, y.GLdouble )
; PrototypeC           glVertexAttrib2dv                    ( index.GLuint, *v )
; PrototypeC           glVertexAttrib2f                     ( index.GLuint, x.GLfloat, y.GLfloat )
; PrototypeC           glVertexAttrib2fv                    ( index.GLuint, *v )
; PrototypeC           glVertexAttrib2s                     ( index.GLuint, x.GLshort, y.GLshort )
; PrototypeC           glVertexAttrib2sv                    ( index.GLuint, *v )
; PrototypeC           glVertexAttrib3d                     ( index.GLuint, x.GLdouble, y.GLdouble, z.GLdouble )
; PrototypeC           glVertexAttrib3dv                    ( index.GLuint, *v )
; PrototypeC           glVertexAttrib3f                     ( index.GLuint, x.GLfloat, y.GLfloat, z.GLfloat )
; PrototypeC           glVertexAttrib3fv                    ( index.GLuint, *v )
; PrototypeC           glVertexAttrib3s                     ( index.GLuint, x.GLshort, y.GLshort, z.GLshort )
; PrototypeC           glVertexAttrib3sv                    ( index.GLuint, *v )
; PrototypeC           glVertexAttrib4Nbv                   ( index.GLuint, *v )
; PrototypeC           glVertexAttrib4Niv                   ( index.GLuint, *v )
; PrototypeC           glVertexAttrib4Nsv                   ( index.GLuint, *v )
; PrototypeC           glVertexAttrib4Nub                   ( index.GLuint, x.GLubyte, y.GLubyte, z.GLubyte, w.GLubyte )
; PrototypeC           glVertexAttrib4Nubv                  ( index.GLuint, *v )
; PrototypeC           glVertexAttrib4Nuiv                  ( index.GLuint, *v )
; PrototypeC           glVertexAttrib4Nusv                  ( index.GLuint, *v )
; PrototypeC           glVertexAttrib4bv                    ( index.GLuint, *v )
; PrototypeC           glVertexAttrib4d                     ( index.GLuint, x.GLdouble, y.GLdouble, z.GLdouble, w.GLdouble )
; PrototypeC           glVertexAttrib4dv                    ( index.GLuint, *v )
; PrototypeC           glVertexAttrib4f                     ( index.GLuint, x.GLfloat, y.GLfloat, z.GLfloat, w.GLfloat )
; PrototypeC           glVertexAttrib4fv                    ( index.GLuint, *v )
; PrototypeC           glVertexAttrib4iv                    ( index.GLuint, *v )
; PrototypeC           glVertexAttrib4s                     ( index.GLuint, x.GLshort, y.GLshort, z.GLshort, w.GLshort )
; PrototypeC           glVertexAttrib4sv                    ( index.GLuint, *v )
; PrototypeC           glVertexAttrib4ubv                   ( index.GLuint, *v )
; PrototypeC           glVertexAttrib4uiv                   ( index.GLuint, *v )
; PrototypeC           glVertexAttrib4usv                   ( index.GLuint, *v )
; PrototypeC           glVertexAttribPointer                ( index.GLuint, size.GLint, type.GLenum, normalized.GLboolean, stride.GLsizei, *pointer )
; PrototypeC           glUniformMatrix2x3fv                 ( location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glUniformMatrix3x2fv                 ( location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glUniformMatrix2x4fv                 ( location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glUniformMatrix4x2fv                 ( location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glUniformMatrix3x4fv                 ( location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glUniformMatrix4x3fv                 ( location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glColorMaski                         ( index.GLuint, r.GLboolean, g.GLboolean, b.GLboolean, a.GLboolean )
; PrototypeC           glGetBooleani_v                      ( target.GLenum, index.GLuint, *data_ )
; PrototypeC           glGetIntegeri_v                      ( target.GLenum, index.GLuint, *data_ )
; PrototypeC           glEnablei                            ( target.GLenum, index.GLuint )
; PrototypeC           glDisablei                           ( target.GLenum, index.GLuint )
; PrototypeC.GLboolean glIsEnabledi                         ( target.GLenum, index.GLuint )
; PrototypeC           glBeginTransformFeedback             ( primitiveMode.GLenum )
; PrototypeC           glEndTransformFeedback               ( void )
; PrototypeC           glBindBufferRange                    ( target.GLenum, index.GLuint, buffer.GLuint, offset.GLintptr, size.GLsizeiptr )
; PrototypeC           glBindBufferBase                     ( target.GLenum, index.GLuint, buffer.GLuint )
; PrototypeC           glTransformFeedbackVaryings          ( program.GLuint, count.GLsizei, *varyings, bufferMode.GLenum ) ; **varyings.GLchar
; PrototypeC           glGetTransformFeedbackVarying        ( program.GLuint, index.GLuint, bufSize.GLsizei, *length, *size, *type, name.p-ascii )
; PrototypeC           glClampColor                         ( target.GLenum, clamp.GLenum )
; PrototypeC           glBeginConditionalRender             ( id.GLuint, mode.GLenum )
; PrototypeC           glEndConditionalRender               ( void )
; PrototypeC           glVertexAttribIPointer               ( index.GLuint, size.GLint, type.GLenum, stride.GLsizei, *pointer )
; PrototypeC           glGetVertexAttribIiv                 ( index.GLuint, pname.GLenum, *params )
; PrototypeC           glGetVertexAttribIuiv                ( index.GLuint, pname.GLenum, *params )
; PrototypeC           glVertexAttribI1i                    ( index.GLuint, x.GLint )
; PrototypeC           glVertexAttribI2i                    ( index.GLuint, x.GLint, y.GLint )
; PrototypeC           glVertexAttribI3i                    ( index.GLuint, x.GLint, y.GLint, z.GLint )
; PrototypeC           glVertexAttribI4i                    ( index.GLuint, x.GLint, y.GLint, z.GLint, w.GLint )
; PrototypeC           glVertexAttribI1ui                   ( index.GLuint, x.GLuint )
; PrototypeC           glVertexAttribI2ui                   ( index.GLuint, x.GLuint, y.GLuint )
; PrototypeC           glVertexAttribI3ui                   ( index.GLuint, x.GLuint, y.GLuint, z.GLuint )
; PrototypeC           glVertexAttribI4ui                   ( index.GLuint, x.GLuint, y.GLuint, z.GLuint, w.GLuint )
; PrototypeC           glVertexAttribI1iv                   ( index.GLuint, *v )
; PrototypeC           glVertexAttribI2iv                   ( index.GLuint, *v )
; PrototypeC           glVertexAttribI3iv                   ( index.GLuint, *v )
; PrototypeC           glVertexAttribI4iv                   ( index.GLuint, *v )
; PrototypeC           glVertexAttribI1uiv                  ( index.GLuint, *v )
; PrototypeC           glVertexAttribI2uiv                  ( index.GLuint, *v )
; PrototypeC           glVertexAttribI3uiv                  ( index.GLuint, *v )
; PrototypeC           glVertexAttribI4uiv                  ( index.GLuint, *v )
; PrototypeC           glVertexAttribI4bv                   ( index.GLuint, *v )
; PrototypeC           glVertexAttribI4sv                   ( index.GLuint, *v )
; PrototypeC           glVertexAttribI4ubv                  ( index.GLuint, *v )
; PrototypeC           glVertexAttribI4usv                  ( index.GLuint, *v )
; PrototypeC           glGetUniformuiv                      ( program.GLuint, location.GLint, *params )
; PrototypeC           glBindFragDataLocation               ( program.GLuint, color.GLuint, name.p-ascii )
; PrototypeC.GLint     glGetFragDataLocation                ( program.GLuint, name.p-ascii )
; PrototypeC           glUniform1ui                         ( location.GLint, v0.GLuint )
; PrototypeC           glUniform2ui                         ( location.GLint, v0.GLuint, v1.GLuint )
; PrototypeC           glUniform3ui                         ( location.GLint, v0.GLuint, v1.GLuint, v2.GLuint )
; PrototypeC           glUniform4ui                         ( location.GLint, v0.GLuint, v1.GLuint, v2.GLuint, v3.GLuint )
; PrototypeC           glUniform1uiv                        ( location.GLint, count.GLsizei, *value )
; PrototypeC           glUniform2uiv                        ( location.GLint, count.GLsizei, *value )
; PrototypeC           glUniform3uiv                        ( location.GLint, count.GLsizei, *value )
; PrototypeC           glUniform4uiv                        ( location.GLint, count.GLsizei, *value )
; PrototypeC           glTexParameterIiv                    ( target.GLenum, pname.GLenum, *params )
; PrototypeC           glTexParameterIuiv                   ( target.GLenum, pname.GLenum, *params )
; PrototypeC           glGetTexParameterIiv                 ( target.GLenum, pname.GLenum, *params )
; PrototypeC           glGetTexParameterIuiv                ( target.GLenum, pname.GLenum, *params )
; PrototypeC           glClearBufferiv                      ( buffer.GLenum, drawbuffer.GLint, *value )
; PrototypeC           glClearBufferuiv                     ( buffer.GLenum, drawbuffer.GLint, *value )
; PrototypeC           glClearBufferfv                      ( buffer.GLenum, drawbuffer.GLint, *value )
; PrototypeC           glClearBufferfi                      ( buffer.GLenum, drawbuffer.GLint, depth.GLfloat, stencil.GLint )
; PrototypeC.i         glGetStringi                         ( name.GLenum, index.GLuint )
; PrototypeC           glDrawArraysInstanced                ( mode.GLenum, first.GLint, count.GLsizei, primcount.GLsizei )
; PrototypeC           glDrawElementsInstanced              ( mode.GLenum, count.GLsizei, type.GLenum, *indices, primcount.GLsizei )
; PrototypeC           glTexBuffer                          ( target.GLenum, internalformat.GLenum, buffer.GLuint )
; PrototypeC           glPrimitiveRestartIndex              ( index.GLuint )
; PrototypeC           glGetInteger64i_v                    ( target.GLenum, index.GLuint, *data_ )
; PrototypeC           glGetBufferParameteri64v             ( target.GLenum, pname.GLenum, *params )
; PrototypeC           glFramebufferTexture                 ( target.GLenum, attachment.GLenum, texture.GLuint, level.GLint )
; PrototypeC           glVertexAttribDivisor                ( index.GLuint, divisor.GLuint )
; PrototypeC           glMinSampleShading                   ( value.GLclampf )
; PrototypeC           glBlendEquationi                     ( buf.GLuint, mode.GLenum )
; PrototypeC           glBlendEquationSeparatei             ( buf.GLuint, modeRGB.GLenum, modeAlpha.GLenum )
; PrototypeC           glBlendFunci                         ( buf.GLuint, src.GLenum, dst.GLenum )
; PrototypeC           glBlendFuncSeparatei                 ( buf.GLuint, srcRGB.GLenum, dstRGB.GLenum, srcAlpha.GLenum, dstAlpha.GLenum )
; PrototypeC.GLboolean glIsRenderbuffer                     ( renderbuffer.GLuint )
; PrototypeC           glBindRenderbuffer                   ( target.GLenum, renderbuffer.GLuint )
; PrototypeC           glDeleteRenderbuffers                ( n.GLsizei, *renderbuffers )
; PrototypeC           glGenRenderbuffers                   ( n.GLsizei, *renderbuffers )
; PrototypeC           glRenderbufferStorage                ( target.GLenum, internalformat.GLenum, width.GLsizei, height.GLsizei )
; PrototypeC           glGetRenderbufferParameteriv         ( target.GLenum, pname.GLenum, *params )
; PrototypeC.GLboolean glIsFramebuffer                      ( framebuffer.GLuint )
; PrototypeC           glBindFramebuffer                    ( target.GLenum, framebuffer.GLuint )
; PrototypeC           glDeleteFramebuffers                 ( n.GLsizei, *framebuffers )
; PrototypeC           glGenFramebuffers                    ( n.GLsizei, *framebuffers )
; PrototypeC.GLenum    glCheckFramebufferStatus             ( target.GLenum )
; PrototypeC           glFramebufferTexture1D               ( target.GLenum, attachment.GLenum, textarget.GLenum, texture.GLuint, level.GLint )
; PrototypeC           glFramebufferTexture2D               ( target.GLenum, attachment.GLenum, textarget.GLenum, texture.GLuint, level.GLint )
; PrototypeC           glFramebufferTexture3D               ( target.GLenum, attachment.GLenum, textarget.GLenum, texture.GLuint, level.GLint, zoffset.GLint )
; PrototypeC           glFramebufferRenderbuffer            ( target.GLenum, attachment.GLenum, renderbuffertarget.GLenum, renderbuffer.GLuint )
; PrototypeC           glGetFramebufferAttachmentParameteriv( target.GLenum, attachment.GLenum, pname.GLenum, *params )
; PrototypeC           glGenerateMipmap                     ( target.GLenum )
; PrototypeC           glBlitFramebuffer                    ( srcX0.GLint, srcY0.GLint, srcX1.GLint, srcY1.GLint, dstX0.GLint, dstY0.GLint, dstX1.GLint, dstY1.GLint, mask.GLbitfield, filter.GLenum )
; PrototypeC           glRenderbufferStorageMultisample     ( target.GLenum, samples.GLsizei, internalformat.GLenum, width.GLsizei, height.GLsizei )
; PrototypeC           glFramebufferTextureLayer            ( target.GLenum, attachment.GLenum, texture.GLuint, level.GLint, layer.GLint )
; PrototypeC.i         glMapBufferRange                     ( target.GLenum, offset.GLintptr, length.GLsizeiptr, access.GLbitfield )
; PrototypeC           glFlushMappedBufferRange             ( target.GLenum, offset.GLintptr, length.GLsizeiptr )
; PrototypeC           glBindVertexArray                    ( array_.GLuint )
; PrototypeC           glDeleteVertexArrays                 ( n.GLsizei, *arrays )
; PrototypeC           glGenVertexArrays                    ( n.GLsizei, *arrays )
; PrototypeC.GLboolean glIsVertexArray                      ( array_.GLuint )
; PrototypeC           glGetUniformIndices                  ( program.GLuint, uniformCount.GLsizei, *uniformNames, *uniformIndices )
; PrototypeC           glGetActiveUniformsiv                ( program.GLuint, uniformCount.GLsizei, *uniformIndices, pname.GLenum, *params )
; PrototypeC           glGetActiveUniformName               ( program.GLuint, uniformIndex.GLuint, bufSize.GLsizei, *length, uniformName.p-ascii )
; PrototypeC.GLuint    glGetUniformBlockIndex               ( program.GLuint, uniformBlockName.p-ascii )
; PrototypeC           glGetActiveUniformBlockiv            ( program.GLuint, uniformBlockIndex.GLuint, pname.GLenum, *params )
; PrototypeC           glGetActiveUniformBlockName          ( program.GLuint, uniformBlockIndex.GLuint, bufSize.GLsizei, *length, uniformBlockName.p-ascii )
; PrototypeC           glUniformBlockBinding                ( program.GLuint, uniformBlockIndex.GLuint, uniformBlockBinding.GLuint )
; PrototypeC           glCopyBufferSubData                  ( readTarget.GLenum, writeTarget.GLenum, readOffset.GLintptr, writeOffset.GLintptr, size.GLsizeiptr )
; PrototypeC           glDrawElementsBaseVertex             ( mode.GLenum, count.GLsizei, type.GLenum, *indices, basevertex.GLint )
; PrototypeC           glDrawRangeElementsBaseVertex        ( mode.GLenum, start.GLuint, end_.GLuint, count.GLsizei, type.GLenum, *indices, basevertex.GLint )
; PrototypeC           glDrawElementsInstancedBaseVertex    ( mode.GLenum, count.GLsizei, type.GLenum, *indices, primcount.GLsizei, basevertex.GLint )
; PrototypeC           glMultiDrawElementsBaseVertex        ( mode.GLenum, *count, type.GLenum, *indices, primcount.GLsizei, *basevertex )
; PrototypeC           glProvokingVertex                    ( mode.GLenum )
; PrototypeC.GLsync    glFenceSync                          ( condition.GLenum, flags.GLbitfield )
; PrototypeC.GLboolean glIsSync                             ( sync.GLsync )
; PrototypeC           glDeleteSync                         ( sync.GLsync )
; PrototypeC.GLenum    glClientWaitSync                     ( sync.GLsync, flags.GLbitfield, timeout.GLuint64 )
; PrototypeC           glWaitSync                           ( sync.GLsync, flags.GLbitfield, timeout.GLuint64 )
; PrototypeC           glGetInteger64v                      ( pname.GLenum, *params )
; PrototypeC           glGetSynciv                          ( sync.GLsync, pname.GLenum, bufSize.GLsizei, *length, *values )
; PrototypeC           glTexImage2DMultisample              ( target.GLenum, samples.GLsizei, internalformat.GLint, width.GLsizei, height.GLsizei, fixedsamplelocations.GLboolean )
; PrototypeC           glTexImage3DMultisample              ( target.GLenum, samples.GLsizei, internalformat.GLint, width.GLsizei, height.GLsizei, depth.GLsizei, fixedsamplelocations.GLboolean )
; PrototypeC           glGetMultisamplefv                   ( pname.GLenum, index.GLuint, *val )
; PrototypeC           glSampleMaski                        ( index.GLuint, mask.GLbitfield )
; PrototypeC           glNamedStringARB                     ( type.GLenum, namelen.GLint, name.p-ascii, stringlen.GLint, string.p-ascii )
; PrototypeC           glDeleteNamedStringARB               ( namelen.GLint, name.p-ascii )
; PrototypeC           glCompileShaderIncludeARB            ( shader.GLuint, count.GLsizei, *path, *length ) ; const GLchar** path
; PrototypeC.GLboolean glIsNamedStringARB                   ( namelen.GLint, name.p-ascii )
; PrototypeC           glGetNamedStringARB                  ( namelen.GLint, name.p-ascii, bufSize.GLsizei, *stringlen, *string )
; PrototypeC           glGetNamedStringivARB                ( namelen.GLint, name.p-ascii, pname.GLenum, *params )
; PrototypeC           glBindFragDataLocationIndexed        ( program.GLuint, colorNumber.GLuint, index.GLuint, name.p-ascii )
; PrototypeC.GLint     glGetFragDataIndex                   ( program.GLuint, name.p-ascii )
; PrototypeC           glGenSamplers                        ( count.GLsizei, *samplers )
; PrototypeC           glDeleteSamplers                     ( count.GLsizei, *samplers )
; PrototypeC.GLboolean glIsSampler                          ( sampler.GLuint )
; PrototypeC           glBindSampler                        ( unit.GLuint, sampler.GLuint )
; PrototypeC           glSamplerParameteri                  ( sampler.GLuint, pname.GLenum, param.GLint )
; PrototypeC           glSamplerParameteriv                 ( sampler.GLuint, pname.GLenum, *param )
; PrototypeC           glSamplerParameterf                  ( sampler.GLuint, pname.GLenum, param.GLfloat )
; PrototypeC           glSamplerParameterfv                 ( sampler.GLuint, pname.GLenum, *param )
; PrototypeC           glSamplerParameterIiv                ( sampler.GLuint, pname.GLenum, *param )
; PrototypeC           glSamplerParameterIuiv               ( sampler.GLuint, pname.GLenum, *param )
; PrototypeC           glGetSamplerParameteriv              ( sampler.GLuint, pname.GLenum, *params )
; PrototypeC           glGetSamplerParameterIiv             ( sampler.GLuint, pname.GLenum, *params )
; PrototypeC           glGetSamplerParameterfv              ( sampler.GLuint, pname.GLenum, *params )
; PrototypeC           glGetSamplerParameterIuiv            ( sampler.GLuint, pname.GLenum, *params )
; PrototypeC           glQueryCounter                       ( id.GLuint, target.GLenum )
; PrototypeC           glGetQueryObjecti64v                 ( id.GLuint, pname.GLenum, *params )
; PrototypeC           glGetQueryObjectui64v                ( id.GLuint, pname.GLenum, *params )
; PrototypeC           glVertexP2ui                         ( type.GLenum, value.GLuint )
; PrototypeC           glVertexP2uiv                        ( type.GLenum, *value )
; PrototypeC           glVertexP3ui                         ( type.GLenum, value.GLuint )
; PrototypeC           glVertexP3uiv                        ( type.GLenum, *value )
; PrototypeC           glVertexP4ui                         ( type.GLenum, value.GLuint )
; PrototypeC           glVertexP4uiv                        ( type.GLenum, *value )
; PrototypeC           glTexCoordP1ui                       ( type.GLenum, coords.GLuint )
; PrototypeC           glTexCoordP1uiv                      ( type.GLenum, *coords )
; PrototypeC           glTexCoordP2ui                       ( type.GLenum, coords.GLuint )
; PrototypeC           glTexCoordP2uiv                      ( type.GLenum, *coords )
; PrototypeC           glTexCoordP3ui                       ( type.GLenum, coords.GLuint )
; PrototypeC           glTexCoordP3uiv                      ( type.GLenum, *coords )
; PrototypeC           glTexCoordP4ui                       ( type.GLenum, coords.GLuint )
; PrototypeC           glTexCoordP4uiv                      ( type.GLenum, *coords )
; PrototypeC           glMultiTexCoordP1ui                  ( texture.GLenum, type.GLenum, coords.GLuint )
; PrototypeC           glMultiTexCoordP1uiv                 ( texture.GLenum, type.GLenum, *coords )
; PrototypeC           glMultiTexCoordP2ui                  ( texture.GLenum, type.GLenum, coords.GLuint )
; PrototypeC           glMultiTexCoordP2uiv                 ( texture.GLenum, type.GLenum, *coords )
; PrototypeC           glMultiTexCoordP3ui                  ( texture.GLenum, type.GLenum, coords.GLuint )
; PrototypeC           glMultiTexCoordP3uiv                 ( texture.GLenum, type.GLenum, *coords )
; PrototypeC           glMultiTexCoordP4ui                  ( texture.GLenum, type.GLenum, coords.GLuint )
; PrototypeC           glMultiTexCoordP4uiv                 ( texture.GLenum, type.GLenum, *coords )
; PrototypeC           glNormalP3ui                         ( type.GLenum, coords.GLuint )
; PrototypeC           glNormalP3uiv                        ( type.GLenum, *coords )
; PrototypeC           glColorP3ui                          ( type.GLenum, color.GLuint )
; PrototypeC           glColorP3uiv                         ( type.GLenum, *color )
; PrototypeC           glColorP4ui                          ( type.GLenum, color.GLuint )
; PrototypeC           glColorP4uiv                         ( type.GLenum, *color )
; PrototypeC           glSecondaryColorP3ui                 ( type.GLenum, color.GLuint )
; PrototypeC           glSecondaryColorP3uiv                ( type.GLenum, *color )
; PrototypeC           glVertexAttribP1ui                   ( index.GLuint, type.GLenum, normalized.GLboolean, value.GLuint )
; PrototypeC           glVertexAttribP1uiv                  ( index.GLuint, type.GLenum, normalized.GLboolean, *value )
; PrototypeC           glVertexAttribP2ui                   ( index.GLuint, type.GLenum, normalized.GLboolean, value.GLuint )
; PrototypeC           glVertexAttribP2uiv                  ( index.GLuint, type.GLenum, normalized.GLboolean, *value )
; PrototypeC           glVertexAttribP3ui                   ( index.GLuint, type.GLenum, normalized.GLboolean, value.GLuint )
; PrototypeC           glVertexAttribP3uiv                  ( index.GLuint, type.GLenum, normalized.GLboolean, *value )
; PrototypeC           glVertexAttribP4ui                   ( index.GLuint, type.GLenum, normalized.GLboolean, value.GLuint )
; PrototypeC           glVertexAttribP4uiv                  ( index.GLuint, type.GLenum, normalized.GLboolean, *value )
; PrototypeC           glDrawArraysIndirect                 ( mode.GLenum, *indirect )
; PrototypeC           glDrawElementsIndirect               ( mode.GLenum, type.GLenum, *indirect )
; PrototypeC           glUniform1d                          ( location.GLint, x.GLdouble )
; PrototypeC           glUniform2d                          ( location.GLint, x.GLdouble, y.GLdouble )
; PrototypeC           glUniform3d                          ( location.GLint, x.GLdouble, y.GLdouble, z.GLdouble )
; PrototypeC           glUniform4d                          ( location.GLint, x.GLdouble, y.GLdouble, z.GLdouble, w.GLdouble )
; PrototypeC           glUniform1dv                         ( location.GLint, count.GLsizei, *value )
; PrototypeC           glUniform2dv                         ( location.GLint, count.GLsizei, *value )
; PrototypeC           glUniform3dv                         ( location.GLint, count.GLsizei, *value )
; PrototypeC           glUniform4dv                         ( location.GLint, count.GLsizei, *value )
; PrototypeC           glUniformMatrix2dv                   ( location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glUniformMatrix3dv                   ( location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glUniformMatrix4dv                   ( location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glUniformMatrix2x3dv                 ( location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glUniformMatrix2x4dv                 ( location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glUniformMatrix3x2dv                 ( location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glUniformMatrix3x4dv                 ( location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glUniformMatrix4x2dv                 ( location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glUniformMatrix4x3dv                 ( location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glGetUniformdv                       ( program.GLuint, location.GLint, *params )
; PrototypeC.GLint     glGetSubroutineUniformLocation       ( program.GLuint, shadertype.GLenum, name.p-ascii )
; PrototypeC.GLuint    glGetSubroutineIndex                 ( program.GLuint, shadertype.GLenum, name.p-ascii )
; PrototypeC           glGetActiveSubroutineUniformiv       ( program.GLuint, shadertype.GLenum, index.GLuint, pname.GLenum, *values )
; PrototypeC           glGetActiveSubroutineUniformName     ( program.GLuint, shadertype.GLenum, index.GLuint, bufsize.GLsizei, *length, *name )
; PrototypeC           glGetActiveSubroutineName            ( program.GLuint, shadertype.GLenum, index.GLuint, bufsize.GLsizei, *length, *name )
; PrototypeC           glUniformSubroutinesuiv              ( shadertype.GLenum, count.GLsizei, *indices )
; PrototypeC           glGetUniformSubroutineuiv            ( shadertype.GLenum, location.GLint, *params )
; PrototypeC           glGetProgramStageiv                  ( program.GLuint, shadertype.GLenum, pname.GLenum, *values )
; PrototypeC           glPatchParameteri                    ( pname.GLenum, value.GLint )
; PrototypeC           glPatchParameterfv                   ( pname.GLenum, *values )
; PrototypeC           glBindTransformFeedback              ( target.GLenum, id.GLuint )
; PrototypeC           glDeleteTransformFeedbacks           ( n.GLsizei, *ids )
; PrototypeC           glGenTransformFeedbacks              ( n.GLsizei, *ids )
; PrototypeC.GLboolean glIsTransformFeedback                ( id.GLuint )
; PrototypeC           glPauseTransformFeedback             ( void )
; PrototypeC           glResumeTransformFeedback            ( void )
; PrototypeC           glDrawTransformFeedback              ( mode.GLenum, id.GLuint )
; PrototypeC           glDrawTransformFeedbackStream        ( mode.GLenum, id.GLuint, stream.GLuint )
; PrototypeC           glBeginQueryIndexed                  ( target.GLenum, index.GLuint, id.GLuint )
; PrototypeC           glEndQueryIndexed                    ( target.GLenum, index.GLuint )
; PrototypeC           glGetQueryIndexediv                  ( target.GLenum, index.GLuint, pname.GLenum, *params )
; PrototypeC           glReleaseShaderCompiler              ( void )
; PrototypeC           glShaderBinary                       ( count.GLsizei, *shaders, binaryformat.GLenum, *binary, length.GLsizei )
; PrototypeC           glGetShaderPrecisionFormat           ( shadertype.GLenum, precisiontype.GLenum, *range, *precision )
; PrototypeC           glDepthRangef                        ( n.GLclampf, f.GLclampf )
; PrototypeC           glClearDepthf                        ( d.GLclampf )
; PrototypeC           glGetProgramBinary                   ( program.GLuint, bufSize.GLsizei, *length, *binaryFormat, *binary )
; PrototypeC           glProgramBinary                      ( program.GLuint, binaryFormat.GLenum, *binary, length.GLsizei )
; PrototypeC           glProgramParameteri                  ( program.GLuint, pname.GLenum, value.GLint )
; PrototypeC           glUseProgramStages                   ( pipeline.GLuint, stages.GLbitfield, program.GLuint )
; PrototypeC           glActiveShaderProgram                ( pipeline.GLuint, program.GLuint )
; PrototypeC.GLuint    glCreateShaderProgramv               ( type.GLenum, count.GLsizei, *strings ) ; const GLchar** strings
; PrototypeC           glBindProgramPipeline                ( pipeline.GLuint )
; PrototypeC           glDeleteProgramPipelines             ( n.GLsizei, *pipelines )
; PrototypeC           glGenProgramPipelines                ( n.GLsizei, *pipelines )
; PrototypeC.GLboolean glIsProgramPipeline                  ( pipeline.GLuint )
; PrototypeC           glGetProgramPipelineiv               ( pipeline.GLuint, pname.GLenum, *params )
; PrototypeC           glProgramUniform1i                   ( program.GLuint, location.GLint, v0.GLint )
; PrototypeC           glProgramUniform1iv                  ( program.GLuint, location.GLint, count.GLsizei, *value )
; PrototypeC           glProgramUniform1f                   ( program.GLuint, location.GLint, v0.GLfloat )
; PrototypeC           glProgramUniform1fv                  ( program.GLuint, location.GLint, count.GLsizei, *value )
; PrototypeC           glProgramUniform1d                   ( program.GLuint, location.GLint, v0.GLdouble )
; PrototypeC           glProgramUniform1dv                  ( program.GLuint, location.GLint, count.GLsizei, *value )
; PrototypeC           glProgramUniform1ui                  ( program.GLuint, location.GLint, v0.GLuint )
; PrototypeC           glProgramUniform1uiv                 ( program.GLuint, location.GLint, count.GLsizei, *value )
; PrototypeC           glProgramUniform2i                   ( program.GLuint, location.GLint, v0.GLint, v1.GLint )
; PrototypeC           glProgramUniform2iv                  ( program.GLuint, location.GLint, count.GLsizei, *value )
; PrototypeC           glProgramUniform2f                   ( program.GLuint, location.GLint, v0.GLfloat, v1.GLfloat )
; PrototypeC           glProgramUniform2fv                  ( program.GLuint, location.GLint, count.GLsizei, *value )
; PrototypeC           glProgramUniform2d                   ( program.GLuint, location.GLint, v0.GLdouble, v1.GLdouble )
; PrototypeC           glProgramUniform2dv                  ( program.GLuint, location.GLint, count.GLsizei, *value )
; PrototypeC           glProgramUniform2ui                  ( program.GLuint, location.GLint, v0.GLuint, v1.GLuint )
; PrototypeC           glProgramUniform2uiv                 ( program.GLuint, location.GLint, count.GLsizei, *value )
; PrototypeC           glProgramUniform3i                   ( program.GLuint, location.GLint, v0.GLint, v1.GLint, v2.GLint )
; PrototypeC           glProgramUniform3iv                  ( program.GLuint, location.GLint, count.GLsizei, *value )
; PrototypeC           glProgramUniform3f                   ( program.GLuint, location.GLint, v0.GLfloat, v1.GLfloat, v2.GLfloat )
; PrototypeC           glProgramUniform3fv                  ( program.GLuint, location.GLint, count.GLsizei, *value )
; PrototypeC           glProgramUniform3d                   ( program.GLuint, location.GLint, v0.GLdouble, v1.GLdouble, v2.GLdouble )
; PrototypeC           glProgramUniform3dv                  ( program.GLuint, location.GLint, count.GLsizei, *value )
; PrototypeC           glProgramUniform3ui                  ( program.GLuint, location.GLint, v0.GLuint, v1.GLuint, v2.GLuint )
; PrototypeC           glProgramUniform3uiv                 ( program.GLuint, location.GLint, count.GLsizei, *value )
; PrototypeC           glProgramUniform4i                   ( program.GLuint, location.GLint, v0.GLint, v1.GLint, v2.GLint, v3.GLint )
; PrototypeC           glProgramUniform4iv                  ( program.GLuint, location.GLint, count.GLsizei, *value )
; PrototypeC           glProgramUniform4f                   ( program.GLuint, location.GLint, v0.GLfloat, v1.GLfloat, v2.GLfloat, v3.GLfloat )
; PrototypeC           glProgramUniform4fv                  ( program.GLuint, location.GLint, count.GLsizei, *value )
; PrototypeC           glProgramUniform4d                   ( program.GLuint, location.GLint, v0.GLdouble, v1.GLdouble, v2.GLdouble, v3.GLdouble )
; PrototypeC           glProgramUniform4dv                  ( program.GLuint, location.GLint, count.GLsizei, *value )
; PrototypeC           glProgramUniform4ui                  ( program.GLuint, location.GLint, v0.GLuint, v1.GLuint, v2.GLuint, v3.GLuint )
; PrototypeC           glProgramUniform4uiv                 ( program.GLuint, location.GLint, count.GLsizei, *value )
; PrototypeC           glProgramUniformMatrix2fv            ( program.GLuint, location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glProgramUniformMatrix3fv            ( program.GLuint, location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glProgramUniformMatrix4fv            ( program.GLuint, location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glProgramUniformMatrix2dv            ( program.GLuint, location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glProgramUniformMatrix3dv            ( program.GLuint, location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glProgramUniformMatrix4dv            ( program.GLuint, location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glProgramUniformMatrix2x3fv          ( program.GLuint, location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glProgramUniformMatrix3x2fv          ( program.GLuint, location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glProgramUniformMatrix2x4fv          ( program.GLuint, location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glProgramUniformMatrix4x2fv          ( program.GLuint, location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glProgramUniformMatrix3x4fv          ( program.GLuint, location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glProgramUniformMatrix4x3fv          ( program.GLuint, location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glProgramUniformMatrix2x3dv          ( program.GLuint, location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glProgramUniformMatrix3x2dv          ( program.GLuint, location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glProgramUniformMatrix2x4dv          ( program.GLuint, location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glProgramUniformMatrix4x2dv          ( program.GLuint, location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glProgramUniformMatrix3x4dv          ( program.GLuint, location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glProgramUniformMatrix4x3dv          ( program.GLuint, location.GLint, count.GLsizei, transpose.GLboolean, *value )
; PrototypeC           glValidateProgramPipeline            ( pipeline.GLuint )
; PrototypeC           glGetProgramPipelineInfoLog          ( pipeline.GLuint, bufSize.GLsizei, *length, *infoLog )
; PrototypeC           glVertexAttribL1d                    ( index.GLuint, x.GLdouble )
; PrototypeC           glVertexAttribL2d                    ( index.GLuint, x.GLdouble, y.GLdouble )
; PrototypeC           glVertexAttribL3d                    ( index.GLuint, x.GLdouble, y.GLdouble, z.GLdouble )
; PrototypeC           glVertexAttribL4d                    ( index.GLuint, x.GLdouble, y.GLdouble, z.GLdouble, w.GLdouble )
; PrototypeC           glVertexAttribL1dv                   ( index.GLuint, *v )
; PrototypeC           glVertexAttribL2dv                   ( index.GLuint, *v )
; PrototypeC           glVertexAttribL3dv                   ( index.GLuint, *v )
; PrototypeC           glVertexAttribL4dv                   ( index.GLuint, *v )
; PrototypeC           glVertexAttribLPointer               ( index.GLuint, size.GLint, type.GLenum, stride.GLsizei, *pointer )
; PrototypeC           glGetVertexAttribLdv                 ( index.GLuint, pname.GLenum, *params )
; PrototypeC           glViewportArrayv                     ( first.GLuint, count.GLsizei, *v )
; PrototypeC           glViewportIndexedf                   ( index.GLuint, x.GLfloat, y.GLfloat, w.GLfloat, h.GLfloat )
; PrototypeC           glViewportIndexedfv                  ( index.GLuint, *v )
; PrototypeC           glScissorArrayv                      ( first.GLuint, count.GLsizei, *v )
; PrototypeC           glScissorIndexed                     ( index.GLuint, left.GLint, bottom.GLint, width.GLsizei, height.GLsizei )
; PrototypeC           glScissorIndexedv                    ( index.GLuint, *v )
; PrototypeC           glDepthRangeArrayv                   ( first.GLuint, count.GLsizei, *v )
; PrototypeC           glDepthRangeIndexed                  ( index.GLuint, n.GLclampd, f.GLclampd )
; PrototypeC           glGetFloati_v                        ( target.GLenum, index.GLuint, *data_ )
; PrototypeC           glGetDoublei_v                       ( target.GLenum, index.GLuint, *data_ )
; PrototypeC.GLsync    glCreateSyncFromCLeventARB           ( *context, *event, flags.GLbitfield ) ; struct _cl_context* context, struct _cl_event* event
; PrototypeC           glDebugMessageControlARB             ( source.GLenum, type.GLenum, severity.GLenum, count.GLsizei, *ids, enabled.GLboolean )
; PrototypeC           glDebugMessageInsertARB              ( source.GLenum, type.GLenum, id.GLuint, severity.GLenum, length.GLsizei, *buf )
; PrototypeC           glDebugMessageCallbackARB            ( callback.GLDEBUGPROCARB, *userParam )
; PrototypeC.GLuint    glGetDebugMessageLogARB              ( count.GLuint, bufsize.GLsizei, *sources, *types, *ids, *severities, *lengths, *messageLog )
; PrototypeC.GLenum    glGetGraphicsResetStatusARB          ( void )
; PrototypeC           glGetnMapdvARB                       ( target.GLenum, query.GLenum, bufSize.GLsizei, *v )
; PrototypeC           glGetnMapfvARB                       ( target.GLenum, query.GLenum, bufSize.GLsizei, *v )
; PrototypeC           glGetnMapivARB                       ( target.GLenum, query.GLenum, bufSize.GLsizei, *v )
; PrototypeC           glGetnPixelMapfvARB                  ( map_.GLenum, bufSize.GLsizei, *values )
; PrototypeC           glGetnPixelMapuivARB                 ( map_.GLenum, bufSize.GLsizei, *values )
; PrototypeC           glGetnPixelMapusvARB                 ( map_.GLenum, bufSize.GLsizei, *values )
; PrototypeC           glGetnPolygonStippleARB              ( bufSize.GLsizei, *pattern )
; PrototypeC           glGetnColorTableARB                  ( target.GLenum, format.GLenum, type.GLenum, bufSize.GLsizei, *table )
; PrototypeC           glGetnConvolutionFilterARB           ( target.GLenum, format.GLenum, type.GLenum, bufSize.GLsizei, *image )
; PrototypeC           glGetnSeparableFilterARB             ( target.GLenum, format.GLenum, type.GLenum, rowBufSize.GLsizei, *row, columnBufSize.GLsizei, *column, *span )
; PrototypeC           glGetnHistogramARB                   ( target.GLenum, reset.GLboolean, format.GLenum, type.GLenum, bufSize.GLsizei, *values )
; PrototypeC           glGetnMinmaxARB                      ( target.GLenum, reset.GLboolean, format.GLenum, type.GLenum, bufSize.GLsizei, *values )
; PrototypeC           glGetnTexImageARB                    ( target.GLenum, level.GLint, format.GLenum, type.GLenum, bufSize.GLsizei, *img )
; PrototypeC           glReadnPixelsARB                     ( x.GLint, y.GLint, width.GLsizei, height.GLsizei, format.GLenum, type.GLenum, bufSize.GLsizei, *data_ )
; PrototypeC           glGetnCompressedTexImageARB          ( target.GLenum, lod.GLint, bufSize.GLsizei, *img )
; PrototypeC           glGetnUniformfvARB                   ( program.GLuint, location.GLint, bufSize.GLsizei, *params )
; PrototypeC           glGetnUniformivARB                   ( program.GLuint, location.GLint, bufSize.GLsizei, *params )
; PrototypeC           glGetnUniformuivARB                  ( program.GLuint, location.GLint, bufSize.GLsizei, *params )
; PrototypeC           glGetnUniformdvARB                   ( program.GLuint, location.GLint, bufSize.GLsizei, *params )
; ;}


; ============================================================================
;  EOF
; ============================================================================

;----------------------------
; Log Graphic Hardware
;----------------------------
Procedure glfwDebugHardware()
  Debug "OpenGL Vendor: "    +#TAB$+#TAB$+   GLFWGETSTRINGOUTPUT(glGetString( #GL_VENDOR ) )
  Debug "OpenGL Renderer: "  +#TAB$+         GLFWGETSTRINGOUTPUT(glGetString( #GL_RENDERER ))
  Debug "OpenGL Version: "   +#TAB$+         GLFWGETSTRINGOUTPUT(glGetString( #GL_VERSION ) )
  Debug "OpenGL Shader: "    +#TAB$+#TAB$+   GLFWGETSTRINGOUTPUT(glGetString( #GL_SHADING_LANGUAGE_VERSION) )
EndProcedure


; IDE Options = PureBasic 5.42 LTS (MacOS X - x64)
; CursorPosition = 2164
; FirstLine = 2160
; Folding = --------------------
; EnableXP