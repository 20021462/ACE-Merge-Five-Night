//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-UIRDefault" {
Properties {
_MainTex ("Atlas", 2D) = "white" { }
_FontTex ("Font", 2D) = "black" { }
_CustomTex ("Custom", 2D) = "black" { }
_Color ("Tint", Color) = (1,1,1,1)
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "UIE_ShaderModelIs35" = "1" "UIE_VertexTexturingIsAvailable" = "1" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "UIE_ShaderModelIs35" = "1" "UIE_VertexTexturingIsAvailable" = "1" }
  Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  GpuProgramID 56316
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FontTexSDFScale;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[8];
uniform 	vec4 _PixelClipInvView;
UNITY_LOCATION(9) uniform mediump sampler2D _ShaderInfoTex;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
in highp vec4 in_TEXCOORD4;
in highp vec4 in_TEXCOORD5;
in highp float in_TEXCOORD6;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
flat out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
flat out highp vec2 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
flat out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
int u_xlati3;
uint u_xlatu3;
bvec2 u_xlatb3;
vec3 u_xlat4;
bvec4 u_xlatb4;
vec4 u_xlat5;
mediump float u_xlat16_6;
vec4 u_xlat7;
vec4 u_xlat8;
bvec4 u_xlatb8;
mediump float u_xlat16_9;
vec2 u_xlat10;
vec2 u_xlat13;
bool u_xlatb13;
mediump vec3 u_xlat16_16;
vec2 u_xlat20;
vec2 u_xlat23;
int u_xlati30;
void main()
{
    u_xlat0 = in_TEXCOORD2.xxzz * vec4(255.0, 8160.0, 255.0, 8160.0);
    u_xlatb1 = greaterThanEqual(u_xlat0.yyww, (-u_xlat0.yyww));
    u_xlat1.x = (u_xlatb1.x) ? float(32.0) : float(-32.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.03125) : float(-0.03125);
    u_xlat1.z = (u_xlatb1.z) ? float(32.0) : float(-32.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.03125) : float(-0.03125);
    u_xlat0.xy = u_xlat0.xz * u_xlat1.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xz;
    u_xlat20.xy = in_TEXCOORD2.xz * vec2(255.0, 255.0) + (-u_xlat0.xy);
    u_xlat1.x = in_TEXCOORD1.x * 8160.0 + u_xlat0.x;
    u_xlat0.xz = u_xlat20.xy * vec2(0.09375, 0.03125);
    u_xlat1.y = in_TEXCOORD1.y * 2040.0 + u_xlat0.x;
    u_xlat2 = u_xlat1.xyxy + vec4(0.5, 0.5, 0.5, 1.5);
    u_xlat2 = u_xlat2 * _ShaderInfoTex_TexelSize.xyxy;
    u_xlat0.xw = u_xlat1.xy + vec2(0.5, 2.5);
    u_xlat0.xw = u_xlat0.xw * _ShaderInfoTex_TexelSize.xy;
    u_xlat1 = textureLod(_ShaderInfoTex, u_xlat2.xy, 0.0);
    u_xlat2 = textureLod(_ShaderInfoTex, u_xlat2.zw, 0.0);
    u_xlat3 = textureLod(_ShaderInfoTex, u_xlat0.xw, 0.0);
    u_xlat0.x = in_TEXCOORD3.x * 255.0;
    u_xlat0.x = roundEven(u_xlat0.x);
    u_xlatb4 = equal(u_xlat0.xxxx, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat5.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat5.z = u_xlatb4.z ? float(1.0) : 0.0;
    u_xlat5.w = u_xlatb4.w ? float(1.0) : 0.0;
;
    u_xlat0.xw = u_xlat5.zz + u_xlat5.wy;
    u_xlat0.x = u_xlat5.y + u_xlat0.x;
    u_xlat0.x = u_xlat5.x + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat1.z = dot(u_xlat1, in_POSITION0);
    u_xlat1.w = dot(u_xlat2, in_POSITION0);
    u_xlat2.x = dot(u_xlat3, in_POSITION0);
    u_xlat3 = u_xlat1.wwww * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat2.xxxx + u_xlat3;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlatb3.x = _FontTexSDFScale==0.0;
    u_xlatb3.x = u_xlatb3.x && u_xlatb4.w;
    u_xlat13.xy = u_xlat2.xy + vec2(1.0, 1.0);
    u_xlat13.xy = u_xlat13.xy / _PixelClipInvView.xy;
    u_xlat13.xy = u_xlat13.xy + vec2(0.152700007, 0.152700007);
    u_xlat13.xy = roundEven(u_xlat13.xy);
    u_xlat13.xy = u_xlat13.xy * _PixelClipInvView.xy + vec2(-1.0, -1.0);
    u_xlat2.xy = (u_xlatb3.x) ? u_xlat13.xy : u_xlat2.xy;
    vs_TEXCOORD4.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat3.x = u_xlatb4.w ? float(2.0) : 0.0;
    u_xlat3.y = u_xlatb4.x ? float(4.0) : 0.0;
;
    u_xlat0.x = u_xlat0.x + u_xlat3.x;
    u_xlat0.x = u_xlat0.w * 3.0 + u_xlat0.x;
    u_xlat0.x = u_xlat3.y + u_xlat0.x;
    u_xlat16_6 = 0.0;
    u_xlati30 = 0;
    u_xlati3 = 0;
    while(true){
        u_xlatb13 = u_xlati30>=7;
        u_xlati3 = 0;
        if(u_xlatb13){break;}
        u_xlatb13 = in_TEXCOORD6==_TextureInfo[u_xlati30].x;
        if(u_xlatb13){
            u_xlat16_6 = float(u_xlati30);
            u_xlati3 = int(0xFFFFFFFFu);
            break;
        }
        u_xlati30 = u_xlati30 + 1;
        u_xlatb3.x = u_xlatb13;
        u_xlat16_6 = 0.0;
    }
    u_xlat16_6 = (u_xlati3 != 0) ? u_xlat16_6 : 7.0;
    u_xlat0.w = dot(in_TEXCOORD4.zw, vec2(65025.0, 255.0));
    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_TEXCOORD3.zwzz).xy;
    u_xlat23.x = u_xlatb3.x ? 1.0 : float(0.0);
    u_xlat3.x = (u_xlatb3.x) ? 3.0 : 2.0;
    vs_TEXCOORD1.w = (u_xlatb3.y) ? u_xlat3.x : u_xlat23.x;
    if(u_xlatb4.y){
        u_xlatu3 = uint(u_xlat16_6);
        u_xlat1.xy = in_TEXCOORD0.xy * _TextureInfo[int(u_xlatu3)].yz;
    } else {
        u_xlat1.xy = in_TEXCOORD0.xy;
    }
    u_xlat23.x = in_TEXCOORD4.x * 8160.0 + u_xlat0.y;
    u_xlat23.y = in_TEXCOORD4.y * 2040.0 + u_xlat0.z;
    u_xlat10.xy = u_xlat23.xy + vec2(0.5, 0.5);
    u_xlat5.zw = u_xlat10.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat7 = in_TEXCOORD2.wwyy * vec4(255.0, 8160.0, 255.0, 8160.0);
    u_xlatb8 = greaterThanEqual(u_xlat7.yyww, (-u_xlat7.yyww));
    u_xlat8.x = (u_xlatb8.x) ? float(32.0) : float(-32.0);
    u_xlat8.y = (u_xlatb8.y) ? float(0.03125) : float(-0.03125);
    u_xlat8.z = (u_xlatb8.z) ? float(32.0) : float(-32.0);
    u_xlat8.w = (u_xlatb8.w) ? float(0.03125) : float(-0.03125);
    u_xlat3.xzw = u_xlat7.xzx * u_xlat8.ywy;
    u_xlat3.xzw = fract(u_xlat3.xzw);
    u_xlat3.xzw = u_xlat3.xzw * u_xlat8.xzx;
    u_xlat4.xyz = in_TEXCOORD2.wyw * vec3(255.0, 255.0, 255.0) + (-u_xlat3.xzw);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.03125, 0.03125, 0.125);
    u_xlat7.x = in_TEXCOORD4.z * 8160.0 + u_xlat3.w;
    u_xlat7.yz = in_TEXCOORD4.ww * vec2(2040.0, 2040.0) + u_xlat4.xz;
    u_xlat10.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat10.xy = u_xlat10.xy * _ShaderInfoTex_TexelSize.xy;
    if(u_xlatb3.y){
        u_xlat8 = textureLod(_ShaderInfoTex, u_xlat10.xy, 0.0);
        u_xlat16_16.xyz = u_xlat8.xyz;
        u_xlat16_9 = u_xlat8.w;
    } else {
        u_xlat16_16.xyz = in_COLOR0.xyz;
        u_xlat16_9 = in_COLOR0.w;
    }
    u_xlat3.x = in_TEXCOORD1.z * 8160.0 + u_xlat3.z;
    u_xlat3.y = in_TEXCOORD1.w * 2040.0 + u_xlat4.y;
    u_xlat3.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat5.xy = u_xlat3.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat3.x = textureLod(_ShaderInfoTex, u_xlat5.zw, 0.0).w;
    u_xlat3.x = u_xlat3.x * u_xlat16_9;
    vs_TEXCOORD3.xy = (u_xlatb4.w) ? u_xlat7.xz : u_xlat10.xy;
    vs_TEXCOORD6 = textureLod(_ShaderInfoTex, u_xlat5.xy, 0.0);
    gl_Position = u_xlat2;
    vs_COLOR0.xyz = u_xlat16_16.xyz;
    vs_COLOR0.w = u_xlat3.x;
    vs_TEXCOORD0 = u_xlat1;
    vs_TEXCOORD1.y = u_xlat16_6;
    vs_TEXCOORD1.xz = u_xlat0.xw;
    vs_TEXCOORD2 = u_xlat5;
    vs_TEXCOORD4.z = 0.0;
    vs_TEXCOORD4.w = in_TEXCOORD3.y;
    vs_TEXCOORD5 = in_TEXCOORD5;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _FontTex_TexelSize;
uniform 	float _FontTexSDFScale;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[8];
uniform 	vec4 _ScreenClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture1;
UNITY_LOCATION(2) uniform mediump sampler2D _Texture2;
UNITY_LOCATION(3) uniform mediump sampler2D _Texture3;
UNITY_LOCATION(4) uniform mediump sampler2D _Texture4;
UNITY_LOCATION(5) uniform mediump sampler2D _Texture5;
UNITY_LOCATION(6) uniform mediump sampler2D _Texture6;
UNITY_LOCATION(7) uniform mediump sampler2D _Texture7;
UNITY_LOCATION(8) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(9) uniform mediump sampler2D _ShaderInfoTex;
UNITY_LOCATION(10) uniform mediump sampler2D _GradientSettingsTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
flat in mediump vec4 vs_TEXCOORD1;
flat in highp vec2 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
flat in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
int u_xlati4;
bvec3 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec3 u_xlat8;
vec2 u_xlat9;
mediump float u_xlat16_9;
uint u_xlatu9;
bool u_xlatb9;
mediump vec2 u_xlat16_10;
float u_xlat13;
bvec2 u_xlatb13;
vec2 u_xlat14;
bool u_xlatb14;
bool u_xlatb15;
vec2 u_xlat18;
bvec2 u_xlatb18;
vec2 u_xlat21;
vec2 u_xlat22;
vec2 u_xlat23;
bool u_xlatb23;
float u_xlat27;
bool u_xlatb27;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD0.zwzz, vs_TEXCOORD6.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(vs_TEXCOORD6.zzzw, vs_TEXCOORD0.zzzw).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlatb18.xy = greaterThanEqual(vs_TEXCOORD4.xyxy, _ScreenClipRect.xyxy).xy;
    u_xlat18.x = u_xlatb18.x ? float(1.0) : 0.0;
    u_xlat18.y = u_xlatb18.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat18.xy + u_xlat0.xy;
    u_xlatb18.xy = greaterThanEqual(_ScreenClipRect.zwzw, vs_TEXCOORD4.xyxy).xy;
    u_xlat18.x = u_xlatb18.x ? float(1.0) : 0.0;
    u_xlat18.y = u_xlatb18.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat18.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
    u_xlatb0.x = u_xlat0.x<0.0;
    if(u_xlatb0.x){discard;}
    u_xlatb0.xy = equal(vs_TEXCOORD1.xxxx, vec4(2.0, 3.0, 0.0, 0.0)).xy;
    u_xlatb18.x = vs_TEXCOORD1.w>=2.0;
    u_xlat27 = vs_TEXCOORD1.w + -2.0;
    u_xlat16_1 = (u_xlatb18.x) ? u_xlat27 : vs_TEXCOORD1.w;
    if(u_xlatb0.y){
        u_xlatb9 = vs_TEXCOORD1.y<4.0;
        if(u_xlatb9){
            u_xlatb9 = vs_TEXCOORD1.y<2.0;
            if(u_xlatb9){
                u_xlatb9 = vs_TEXCOORD1.y<1.0;
                if(u_xlatb9){
                    u_xlat2 = texture(_Texture0, vs_TEXCOORD0.xy);
                } else {
                    u_xlat2 = texture(_Texture1, vs_TEXCOORD0.xy);
                }
            } else {
                u_xlatb9 = vs_TEXCOORD1.y<3.0;
                if(u_xlatb9){
                    u_xlat2 = texture(_Texture2, vs_TEXCOORD0.xy);
                } else {
                    u_xlat2 = texture(_Texture3, vs_TEXCOORD0.xy);
                }
            }
        } else {
            u_xlatb9 = vs_TEXCOORD1.y<6.0;
            if(u_xlatb9){
                u_xlatb9 = vs_TEXCOORD1.y<5.0;
                if(u_xlatb9){
                    u_xlat2 = texture(_Texture4, vs_TEXCOORD0.xy);
                } else {
                    u_xlat2 = texture(_Texture5, vs_TEXCOORD0.xy);
                }
            } else {
                u_xlatb9 = vs_TEXCOORD1.y<7.0;
                if(u_xlatb9){
                    u_xlat2 = texture(_Texture6, vs_TEXCOORD0.xy);
                } else {
                    u_xlat2 = texture(_Texture7, vs_TEXCOORD0.xy);
                }
            }
        }
        u_xlat16_2 = u_xlat2;
    } else {
        if(u_xlatb0.x){
            u_xlat16_9 = texture(_FontTex, vs_TEXCOORD0.xy).w;
            u_xlatb27 = 0.0<_FontTexSDFScale;
            if(u_xlatb27){
                u_xlat3 = vs_TEXCOORD3.xyxy + vec4(0.5, 1.5, 0.5, 2.5);
                u_xlat3 = u_xlat3 * _ShaderInfoTex_TexelSize.xyxy;
                u_xlat4.xy = vs_TEXCOORD3.xy + vec2(0.5, 3.5);
                u_xlat4.xy = u_xlat4.xy * _ShaderInfoTex_TexelSize.xy;
                u_xlat5 = textureLod(_ShaderInfoTex, u_xlat3.xy, 0.0);
                u_xlat16_3 = textureLod(_ShaderInfoTex, u_xlat3.zw, 0.0);
                u_xlat16_4 = textureLod(_ShaderInfoTex, u_xlat4.xy, 0.0);
                if(u_xlatb18.x){
                    u_xlat18.xy = vs_TEXCOORD3.xy + vec2(0.5, 0.5);
                    u_xlat18.xy = u_xlat18.xy * _ShaderInfoTex_TexelSize.xy;
                    u_xlat6 = textureLod(_ShaderInfoTex, u_xlat18.xy, 0.0);
                } else {
                    u_xlat6 = vs_COLOR0;
                }
                u_xlat4 = u_xlat16_4 * vec4(_FontTexSDFScale);
                u_xlat7.y = u_xlat4.w * 0.25;
                u_xlat18.xy = u_xlat4.xy * _FontTex_TexelSize.xx + vs_TEXCOORD0.xy;
                u_xlat8.z = texture(_FontTex, u_xlat18.xy).w;
                u_xlat7.x = (-u_xlat7.y);
                u_xlat7.z = 0.0;
                u_xlat7.xyz = u_xlat7.xyz + vs_TEXCOORD4.www;
                u_xlat18.x = dFdx(vs_TEXCOORD0.y);
                u_xlat27 = dFdy(vs_TEXCOORD0.y);
                u_xlat18.x = abs(u_xlat27) + abs(u_xlat18.x);
                u_xlat8.xy = vec2(u_xlat16_9);
                u_xlat8.xyz = u_xlat8.xyz + vec3(-0.5, -0.5, -0.5);
                u_xlat7.xyz = u_xlat8.xyz * vec3(_FontTexSDFScale) + u_xlat7.xyz;
                u_xlat7.xyz = u_xlat7.xyz + u_xlat7.xyz;
                u_xlat4.x = float(0.0);
                u_xlat4.y = float(0.0);
                u_xlat4.xyz = _FontTex_TexelSize.www * u_xlat18.xxx + u_xlat4.xyz;
                u_xlat4.xyz = u_xlat7.xyz / u_xlat4.xyz;
                u_xlat4.xyz = u_xlat4.xyz + vec3(0.5, 0.5, 0.5);
                u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
                u_xlat7.w = u_xlat16_3.w * u_xlat4.z;
                u_xlat6.xyz = u_xlat6.www * u_xlat6.xyz;
                u_xlat5.xyz = u_xlat5.www * u_xlat5.xyz;
                u_xlat7.xyz = u_xlat16_3.xyz * u_xlat7.www;
                u_xlat3 = (-u_xlat7) + u_xlat5;
                u_xlat3 = u_xlat4.yyyy * u_xlat3 + u_xlat7;
                u_xlat5 = (-u_xlat3) + u_xlat6;
                u_xlat3 = u_xlat4.xxxx * u_xlat5 + u_xlat3;
                u_xlatb18.x = 0.0<u_xlat3.w;
                u_xlat18.x = (u_xlatb18.x) ? u_xlat3.w : 1.0;
                u_xlat3.xyz = u_xlat3.xyz / u_xlat18.xxx;
                u_xlat16_2 = u_xlat3;
            } else {
                u_xlat16_2.x = float(1.0);
                u_xlat16_2.y = float(1.0);
                u_xlat16_2.z = float(1.0);
                u_xlat16_2.w = u_xlat16_9;
            }
        } else {
            u_xlatb9 = vs_TEXCOORD1.x==4.0;
            if(u_xlatb9){
                u_xlatu9 = uint(vs_TEXCOORD1.y);
                u_xlat3.y = vs_TEXCOORD1.z + 0.5;
                u_xlat3.x = float(0.5);
                u_xlat21.y = float(0.0);
                u_xlat18.xy = u_xlat3.xy * _GradientSettingsTex_TexelSize.xy;
                u_xlat16_4 = texture(_GradientSettingsTex, u_xlat18.xy);
                u_xlatb4.x = 0.0<u_xlat16_4.x;
                u_xlat22.xy = u_xlat16_4.zw + vec2(-0.5, -0.5);
                u_xlat22.xy = u_xlat22.xy + u_xlat22.xy;
                u_xlat5.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
                u_xlat5.xy = u_xlat5.xy * vec2(2.0, 2.0) + (-u_xlat22.xy);
                u_xlat23.x = dot(u_xlat5.xy, u_xlat5.xy);
                u_xlat23.x = inversesqrt(u_xlat23.x);
                u_xlat23.xy = u_xlat23.xx * u_xlat5.xy;
                u_xlat6.x = dot((-u_xlat22.xy), u_xlat23.xy);
                u_xlat22.x = dot(u_xlat22.xy, u_xlat22.xy);
                u_xlat22.x = (-u_xlat6.x) * u_xlat6.x + u_xlat22.x;
                u_xlat22.x = (-u_xlat22.x) + 1.0;
                u_xlat22.x = sqrt(u_xlat22.x);
                u_xlat31 = (-u_xlat22.x) + u_xlat6.x;
                u_xlat22.x = u_xlat22.x + u_xlat6.x;
                u_xlat6.x = min(u_xlat22.x, u_xlat31);
                u_xlatb15 = u_xlat6.x<0.0;
                u_xlat22.x = max(u_xlat22.x, u_xlat31);
                u_xlat22.x = (u_xlatb15) ? u_xlat22.x : u_xlat6.x;
                u_xlat22.xy = u_xlat22.xx * u_xlat23.xy;
                u_xlatb23 = 9.99999975e-05>=abs(u_xlat22.x);
                u_xlatb32 = 9.99999975e-05<abs(u_xlat22.y);
                u_xlat22.xy = u_xlat5.xy / u_xlat22.xy;
                u_xlat31 = u_xlatb32 ? u_xlat22.y : float(0.0);
                u_xlat14.x = (u_xlatb23) ? u_xlat31 : u_xlat22.x;
                u_xlat14.y = 0.0;
                u_xlat5.yz = (u_xlatb4.x) ? u_xlat14.xy : vs_TEXCOORD0.xy;
                u_xlat16_10.x = u_xlat16_4.y * 255.0;
                u_xlat16_10.x = roundEven(u_xlat16_10.x);
                u_xlati4 = int(u_xlat16_10.x);
                u_xlatb13.x = u_xlat5.y>=(-u_xlat5.y);
                u_xlat22.x = fract(abs(u_xlat5.y));
                u_xlat13 = (u_xlatb13.x) ? u_xlat22.x : (-u_xlat22.x);
                u_xlat13 = (u_xlati4 != 0) ? u_xlat5.y : u_xlat13;
                u_xlatb4.xz = equal(ivec4(u_xlati4), ivec4(1, 0, 2, 0)).xz;
                u_xlat31 = u_xlat13;
                u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
                u_xlat4.x = (u_xlatb4.x) ? u_xlat31 : u_xlat13;
                u_xlat13 = u_xlat4.x * 0.5;
                u_xlatb31 = u_xlat13>=(-u_xlat13);
                u_xlat13 = fract(abs(u_xlat13));
                u_xlat13 = (u_xlatb31) ? u_xlat13 : (-u_xlat13);
                u_xlat31 = u_xlat13 + u_xlat13;
                u_xlatb13.x = 0.5<u_xlat13;
                u_xlatb14 = u_xlat31>=(-u_xlat31);
                u_xlat32 = fract(abs(u_xlat31));
                u_xlat14.x = (u_xlatb14) ? u_xlat32 : (-u_xlat32);
                u_xlat14.x = (-u_xlat14.x) + 1.0;
                u_xlat13 = (u_xlatb13.x) ? u_xlat14.x : u_xlat31;
                u_xlat5.x = (u_xlatb4.z) ? u_xlat13 : u_xlat4.x;
                u_xlat21.x = _GradientSettingsTex_TexelSize.x;
                u_xlat3.xy = u_xlat3.xy * _GradientSettingsTex_TexelSize.xy + u_xlat21.xy;
                u_xlat16_4 = texture(_GradientSettingsTex, u_xlat3.xy);
                u_xlat3.xy = u_xlat16_4.yw * vec2(255.0, 255.0);
                u_xlat16_10.xy = u_xlat16_4.xz * vec2(65025.0, 65025.0) + u_xlat3.xy;
                u_xlat3.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
                u_xlat18.xy = u_xlat21.xy * vec2(2.0, 2.0) + u_xlat18.xy;
                u_xlat16_4 = texture(_GradientSettingsTex, u_xlat18.xy);
                u_xlat18.xy = u_xlat16_4.yw * vec2(255.0, 255.0);
                u_xlat16_10.xy = u_xlat16_4.xz * vec2(65025.0, 65025.0) + u_xlat18.xy;
                u_xlat18.xy = u_xlat3.xy * _TextureInfo[int(u_xlatu9)].yz;
                u_xlat3.xy = u_xlat16_10.xy * _TextureInfo[int(u_xlatu9)].yz;
                u_xlat9.xy = u_xlat5.xz * u_xlat3.xy + u_xlat18.xy;
                u_xlatb27 = vs_TEXCOORD1.y<4.0;
                if(u_xlatb27){
                    u_xlatb27 = vs_TEXCOORD1.y<2.0;
                    if(u_xlatb27){
                        u_xlatb27 = vs_TEXCOORD1.y<1.0;
                        if(u_xlatb27){
                            u_xlat3 = texture(_Texture0, u_xlat9.xy);
                        } else {
                            u_xlat3 = texture(_Texture1, u_xlat9.xy);
                        }
                    } else {
                        u_xlatb27 = vs_TEXCOORD1.y<3.0;
                        if(u_xlatb27){
                            u_xlat3 = texture(_Texture2, u_xlat9.xy);
                        } else {
                            u_xlat3 = texture(_Texture3, u_xlat9.xy);
                        }
                    }
                } else {
                    u_xlatb27 = vs_TEXCOORD1.y<6.0;
                    if(u_xlatb27){
                        u_xlatb27 = vs_TEXCOORD1.y<5.0;
                        if(u_xlatb27){
                            u_xlat3 = texture(_Texture4, u_xlat9.xy);
                        } else {
                            u_xlat3 = texture(_Texture5, u_xlat9.xy);
                        }
                    } else {
                        u_xlatb27 = vs_TEXCOORD1.y<7.0;
                        if(u_xlatb27){
                            u_xlat3 = texture(_Texture6, u_xlat9.xy);
                        } else {
                            u_xlat3 = texture(_Texture7, u_xlat9.xy);
                        }
                    }
                }
                u_xlat16_2 = u_xlat3;
            } else {
                u_xlatb9 = vs_TEXCOORD1.x==1.0;
                u_xlat16_2 = (bool(u_xlatb9)) ? vec4(1.0, 1.0, 1.0, 1.0) : vec4(0.0, 0.0, 0.0, 0.0);
            }
        }
    }
    u_xlatb9 = 0.0<_FontTexSDFScale;
    u_xlatb0.x = u_xlatb9 && u_xlatb0.x;
    u_xlat16_3 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_0 = (u_xlatb0.x) ? u_xlat16_2 : u_xlat16_3;
    u_xlatb4.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(u_xlat16_1);
    u_xlatb13.xy = lessThan(vec4(-9999.0, -9999.0, 0.0, 0.0), vs_TEXCOORD5.xzxx).xy;
    u_xlat31 = dot(vs_TEXCOORD5.xy, vs_TEXCOORD5.xy);
    u_xlat31 = sqrt(u_xlat31);
    u_xlat31 = u_xlat31 + -1.0;
    u_xlat5.x = dFdx(u_xlat31);
    u_xlat14.x = dFdy(u_xlat31);
    u_xlat5.x = abs(u_xlat14.x) + abs(u_xlat5.x);
    u_xlat31 = u_xlat31 / u_xlat5.x;
    u_xlat31 = (-u_xlat31) + 0.5;
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
    u_xlat31 = u_xlat16_0.w * u_xlat31;
    u_xlat16_1 = (u_xlatb13.x) ? u_xlat31 : u_xlat16_0.w;
    u_xlat13 = dot(vs_TEXCOORD5.zw, vs_TEXCOORD5.zw);
    u_xlat13 = sqrt(u_xlat13);
    u_xlat13 = u_xlat13 + -1.0;
    u_xlat31 = dFdx(u_xlat13);
    u_xlat5.x = dFdy(u_xlat13);
    u_xlat31 = abs(u_xlat31) + abs(u_xlat5.x);
    u_xlat13 = u_xlat13 / u_xlat31;
    u_xlat13 = (-u_xlat13) + 0.5;
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat13 = (-u_xlat13) + 1.0;
    u_xlat13 = u_xlat16_1 * u_xlat13;
    u_xlat16_1 = (u_xlatb13.y) ? u_xlat13 : u_xlat16_1;
    u_xlat13 = u_xlat16_1 + -0.00300000003;
    u_xlatb13.x = u_xlat13<0.0;
    u_xlatb13.x = u_xlatb4.x && u_xlatb13.x;
    if(u_xlatb13.x){discard;}
    SV_Target0.w = (u_xlatb4.x) ? u_xlat16_1 : u_xlat16_0.w;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FontTexSDFScale;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[8];
uniform 	vec4 _PixelClipInvView;
UNITY_LOCATION(9) uniform mediump sampler2D _ShaderInfoTex;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
in highp vec4 in_TEXCOORD4;
in highp vec4 in_TEXCOORD5;
in highp float in_TEXCOORD6;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
flat out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
flat out highp vec2 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
flat out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
int u_xlati3;
uint u_xlatu3;
bvec2 u_xlatb3;
vec3 u_xlat4;
bvec4 u_xlatb4;
vec4 u_xlat5;
mediump float u_xlat16_6;
vec4 u_xlat7;
vec4 u_xlat8;
bvec4 u_xlatb8;
mediump float u_xlat16_9;
vec2 u_xlat10;
vec2 u_xlat13;
bool u_xlatb13;
mediump vec3 u_xlat16_16;
vec2 u_xlat20;
vec2 u_xlat23;
int u_xlati30;
void main()
{
    u_xlat0 = in_TEXCOORD2.xxzz * vec4(255.0, 8160.0, 255.0, 8160.0);
    u_xlatb1 = greaterThanEqual(u_xlat0.yyww, (-u_xlat0.yyww));
    u_xlat1.x = (u_xlatb1.x) ? float(32.0) : float(-32.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.03125) : float(-0.03125);
    u_xlat1.z = (u_xlatb1.z) ? float(32.0) : float(-32.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.03125) : float(-0.03125);
    u_xlat0.xy = u_xlat0.xz * u_xlat1.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xz;
    u_xlat20.xy = in_TEXCOORD2.xz * vec2(255.0, 255.0) + (-u_xlat0.xy);
    u_xlat1.x = in_TEXCOORD1.x * 8160.0 + u_xlat0.x;
    u_xlat0.xz = u_xlat20.xy * vec2(0.09375, 0.03125);
    u_xlat1.y = in_TEXCOORD1.y * 2040.0 + u_xlat0.x;
    u_xlat2 = u_xlat1.xyxy + vec4(0.5, 0.5, 0.5, 1.5);
    u_xlat2 = u_xlat2 * _ShaderInfoTex_TexelSize.xyxy;
    u_xlat0.xw = u_xlat1.xy + vec2(0.5, 2.5);
    u_xlat0.xw = u_xlat0.xw * _ShaderInfoTex_TexelSize.xy;
    u_xlat1 = textureLod(_ShaderInfoTex, u_xlat2.xy, 0.0);
    u_xlat2 = textureLod(_ShaderInfoTex, u_xlat2.zw, 0.0);
    u_xlat3 = textureLod(_ShaderInfoTex, u_xlat0.xw, 0.0);
    u_xlat0.x = in_TEXCOORD3.x * 255.0;
    u_xlat0.x = roundEven(u_xlat0.x);
    u_xlatb4 = equal(u_xlat0.xxxx, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat5.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat5.z = u_xlatb4.z ? float(1.0) : 0.0;
    u_xlat5.w = u_xlatb4.w ? float(1.0) : 0.0;
;
    u_xlat0.xw = u_xlat5.zz + u_xlat5.wy;
    u_xlat0.x = u_xlat5.y + u_xlat0.x;
    u_xlat0.x = u_xlat5.x + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat1.z = dot(u_xlat1, in_POSITION0);
    u_xlat1.w = dot(u_xlat2, in_POSITION0);
    u_xlat2.x = dot(u_xlat3, in_POSITION0);
    u_xlat3 = u_xlat1.wwww * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat2.xxxx + u_xlat3;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlatb3.x = _FontTexSDFScale==0.0;
    u_xlatb3.x = u_xlatb3.x && u_xlatb4.w;
    u_xlat13.xy = u_xlat2.xy + vec2(1.0, 1.0);
    u_xlat13.xy = u_xlat13.xy / _PixelClipInvView.xy;
    u_xlat13.xy = u_xlat13.xy + vec2(0.152700007, 0.152700007);
    u_xlat13.xy = roundEven(u_xlat13.xy);
    u_xlat13.xy = u_xlat13.xy * _PixelClipInvView.xy + vec2(-1.0, -1.0);
    u_xlat2.xy = (u_xlatb3.x) ? u_xlat13.xy : u_xlat2.xy;
    vs_TEXCOORD4.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat3.x = u_xlatb4.w ? float(2.0) : 0.0;
    u_xlat3.y = u_xlatb4.x ? float(4.0) : 0.0;
;
    u_xlat0.x = u_xlat0.x + u_xlat3.x;
    u_xlat0.x = u_xlat0.w * 3.0 + u_xlat0.x;
    u_xlat0.x = u_xlat3.y + u_xlat0.x;
    u_xlat16_6 = 0.0;
    u_xlati30 = 0;
    u_xlati3 = 0;
    while(true){
        u_xlatb13 = u_xlati30>=7;
        u_xlati3 = 0;
        if(u_xlatb13){break;}
        u_xlatb13 = in_TEXCOORD6==_TextureInfo[u_xlati30].x;
        if(u_xlatb13){
            u_xlat16_6 = float(u_xlati30);
            u_xlati3 = int(0xFFFFFFFFu);
            break;
        }
        u_xlati30 = u_xlati30 + 1;
        u_xlatb3.x = u_xlatb13;
        u_xlat16_6 = 0.0;
    }
    u_xlat16_6 = (u_xlati3 != 0) ? u_xlat16_6 : 7.0;
    u_xlat0.w = dot(in_TEXCOORD4.zw, vec2(65025.0, 255.0));
    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_TEXCOORD3.zwzz).xy;
    u_xlat23.x = u_xlatb3.x ? 1.0 : float(0.0);
    u_xlat3.x = (u_xlatb3.x) ? 3.0 : 2.0;
    vs_TEXCOORD1.w = (u_xlatb3.y) ? u_xlat3.x : u_xlat23.x;
    if(u_xlatb4.y){
        u_xlatu3 = uint(u_xlat16_6);
        u_xlat1.xy = in_TEXCOORD0.xy * _TextureInfo[int(u_xlatu3)].yz;
    } else {
        u_xlat1.xy = in_TEXCOORD0.xy;
    }
    u_xlat23.x = in_TEXCOORD4.x * 8160.0 + u_xlat0.y;
    u_xlat23.y = in_TEXCOORD4.y * 2040.0 + u_xlat0.z;
    u_xlat10.xy = u_xlat23.xy + vec2(0.5, 0.5);
    u_xlat5.zw = u_xlat10.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat7 = in_TEXCOORD2.wwyy * vec4(255.0, 8160.0, 255.0, 8160.0);
    u_xlatb8 = greaterThanEqual(u_xlat7.yyww, (-u_xlat7.yyww));
    u_xlat8.x = (u_xlatb8.x) ? float(32.0) : float(-32.0);
    u_xlat8.y = (u_xlatb8.y) ? float(0.03125) : float(-0.03125);
    u_xlat8.z = (u_xlatb8.z) ? float(32.0) : float(-32.0);
    u_xlat8.w = (u_xlatb8.w) ? float(0.03125) : float(-0.03125);
    u_xlat3.xzw = u_xlat7.xzx * u_xlat8.ywy;
    u_xlat3.xzw = fract(u_xlat3.xzw);
    u_xlat3.xzw = u_xlat3.xzw * u_xlat8.xzx;
    u_xlat4.xyz = in_TEXCOORD2.wyw * vec3(255.0, 255.0, 255.0) + (-u_xlat3.xzw);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.03125, 0.03125, 0.125);
    u_xlat7.x = in_TEXCOORD4.z * 8160.0 + u_xlat3.w;
    u_xlat7.yz = in_TEXCOORD4.ww * vec2(2040.0, 2040.0) + u_xlat4.xz;
    u_xlat10.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat10.xy = u_xlat10.xy * _ShaderInfoTex_TexelSize.xy;
    if(u_xlatb3.y){
        u_xlat8 = textureLod(_ShaderInfoTex, u_xlat10.xy, 0.0);
        u_xlat16_16.xyz = u_xlat8.xyz;
        u_xlat16_9 = u_xlat8.w;
    } else {
        u_xlat16_16.xyz = in_COLOR0.xyz;
        u_xlat16_9 = in_COLOR0.w;
    }
    u_xlat3.x = in_TEXCOORD1.z * 8160.0 + u_xlat3.z;
    u_xlat3.y = in_TEXCOORD1.w * 2040.0 + u_xlat4.y;
    u_xlat3.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat5.xy = u_xlat3.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat3.x = textureLod(_ShaderInfoTex, u_xlat5.zw, 0.0).w;
    u_xlat3.x = u_xlat3.x * u_xlat16_9;
    vs_TEXCOORD3.xy = (u_xlatb4.w) ? u_xlat7.xz : u_xlat10.xy;
    vs_TEXCOORD6 = textureLod(_ShaderInfoTex, u_xlat5.xy, 0.0);
    gl_Position = u_xlat2;
    vs_COLOR0.xyz = u_xlat16_16.xyz;
    vs_COLOR0.w = u_xlat3.x;
    vs_TEXCOORD0 = u_xlat1;
    vs_TEXCOORD1.y = u_xlat16_6;
    vs_TEXCOORD1.xz = u_xlat0.xw;
    vs_TEXCOORD2 = u_xlat5;
    vs_TEXCOORD4.z = 0.0;
    vs_TEXCOORD4.w = in_TEXCOORD3.y;
    vs_TEXCOORD5 = in_TEXCOORD5;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _FontTex_TexelSize;
uniform 	float _FontTexSDFScale;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[8];
uniform 	vec4 _ScreenClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture1;
UNITY_LOCATION(2) uniform mediump sampler2D _Texture2;
UNITY_LOCATION(3) uniform mediump sampler2D _Texture3;
UNITY_LOCATION(4) uniform mediump sampler2D _Texture4;
UNITY_LOCATION(5) uniform mediump sampler2D _Texture5;
UNITY_LOCATION(6) uniform mediump sampler2D _Texture6;
UNITY_LOCATION(7) uniform mediump sampler2D _Texture7;
UNITY_LOCATION(8) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(9) uniform mediump sampler2D _ShaderInfoTex;
UNITY_LOCATION(10) uniform mediump sampler2D _GradientSettingsTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
flat in mediump vec4 vs_TEXCOORD1;
flat in highp vec2 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
flat in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
int u_xlati4;
bvec3 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec3 u_xlat8;
vec2 u_xlat9;
mediump float u_xlat16_9;
uint u_xlatu9;
bool u_xlatb9;
mediump vec2 u_xlat16_10;
float u_xlat13;
bvec2 u_xlatb13;
vec2 u_xlat14;
bool u_xlatb14;
bool u_xlatb15;
vec2 u_xlat18;
bvec2 u_xlatb18;
vec2 u_xlat21;
vec2 u_xlat22;
vec2 u_xlat23;
bool u_xlatb23;
float u_xlat27;
bool u_xlatb27;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD0.zwzz, vs_TEXCOORD6.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(vs_TEXCOORD6.zzzw, vs_TEXCOORD0.zzzw).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlatb18.xy = greaterThanEqual(vs_TEXCOORD4.xyxy, _ScreenClipRect.xyxy).xy;
    u_xlat18.x = u_xlatb18.x ? float(1.0) : 0.0;
    u_xlat18.y = u_xlatb18.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat18.xy + u_xlat0.xy;
    u_xlatb18.xy = greaterThanEqual(_ScreenClipRect.zwzw, vs_TEXCOORD4.xyxy).xy;
    u_xlat18.x = u_xlatb18.x ? float(1.0) : 0.0;
    u_xlat18.y = u_xlatb18.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat18.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
    u_xlatb0.x = u_xlat0.x<0.0;
    if(u_xlatb0.x){discard;}
    u_xlatb0.xy = equal(vs_TEXCOORD1.xxxx, vec4(2.0, 3.0, 0.0, 0.0)).xy;
    u_xlatb18.x = vs_TEXCOORD1.w>=2.0;
    u_xlat27 = vs_TEXCOORD1.w + -2.0;
    u_xlat16_1 = (u_xlatb18.x) ? u_xlat27 : vs_TEXCOORD1.w;
    if(u_xlatb0.y){
        u_xlatb9 = vs_TEXCOORD1.y<4.0;
        if(u_xlatb9){
            u_xlatb9 = vs_TEXCOORD1.y<2.0;
            if(u_xlatb9){
                u_xlatb9 = vs_TEXCOORD1.y<1.0;
                if(u_xlatb9){
                    u_xlat2 = texture(_Texture0, vs_TEXCOORD0.xy);
                } else {
                    u_xlat2 = texture(_Texture1, vs_TEXCOORD0.xy);
                }
            } else {
                u_xlatb9 = vs_TEXCOORD1.y<3.0;
                if(u_xlatb9){
                    u_xlat2 = texture(_Texture2, vs_TEXCOORD0.xy);
                } else {
                    u_xlat2 = texture(_Texture3, vs_TEXCOORD0.xy);
                }
            }
        } else {
            u_xlatb9 = vs_TEXCOORD1.y<6.0;
            if(u_xlatb9){
                u_xlatb9 = vs_TEXCOORD1.y<5.0;
                if(u_xlatb9){
                    u_xlat2 = texture(_Texture4, vs_TEXCOORD0.xy);
                } else {
                    u_xlat2 = texture(_Texture5, vs_TEXCOORD0.xy);
                }
            } else {
                u_xlatb9 = vs_TEXCOORD1.y<7.0;
                if(u_xlatb9){
                    u_xlat2 = texture(_Texture6, vs_TEXCOORD0.xy);
                } else {
                    u_xlat2 = texture(_Texture7, vs_TEXCOORD0.xy);
                }
            }
        }
        u_xlat16_2 = u_xlat2;
    } else {
        if(u_xlatb0.x){
            u_xlat16_9 = texture(_FontTex, vs_TEXCOORD0.xy).w;
            u_xlatb27 = 0.0<_FontTexSDFScale;
            if(u_xlatb27){
                u_xlat3 = vs_TEXCOORD3.xyxy + vec4(0.5, 1.5, 0.5, 2.5);
                u_xlat3 = u_xlat3 * _ShaderInfoTex_TexelSize.xyxy;
                u_xlat4.xy = vs_TEXCOORD3.xy + vec2(0.5, 3.5);
                u_xlat4.xy = u_xlat4.xy * _ShaderInfoTex_TexelSize.xy;
                u_xlat5 = textureLod(_ShaderInfoTex, u_xlat3.xy, 0.0);
                u_xlat16_3 = textureLod(_ShaderInfoTex, u_xlat3.zw, 0.0);
                u_xlat16_4 = textureLod(_ShaderInfoTex, u_xlat4.xy, 0.0);
                if(u_xlatb18.x){
                    u_xlat18.xy = vs_TEXCOORD3.xy + vec2(0.5, 0.5);
                    u_xlat18.xy = u_xlat18.xy * _ShaderInfoTex_TexelSize.xy;
                    u_xlat6 = textureLod(_ShaderInfoTex, u_xlat18.xy, 0.0);
                } else {
                    u_xlat6 = vs_COLOR0;
                }
                u_xlat4 = u_xlat16_4 * vec4(_FontTexSDFScale);
                u_xlat7.y = u_xlat4.w * 0.25;
                u_xlat18.xy = u_xlat4.xy * _FontTex_TexelSize.xx + vs_TEXCOORD0.xy;
                u_xlat8.z = texture(_FontTex, u_xlat18.xy).w;
                u_xlat7.x = (-u_xlat7.y);
                u_xlat7.z = 0.0;
                u_xlat7.xyz = u_xlat7.xyz + vs_TEXCOORD4.www;
                u_xlat18.x = dFdx(vs_TEXCOORD0.y);
                u_xlat27 = dFdy(vs_TEXCOORD0.y);
                u_xlat18.x = abs(u_xlat27) + abs(u_xlat18.x);
                u_xlat8.xy = vec2(u_xlat16_9);
                u_xlat8.xyz = u_xlat8.xyz + vec3(-0.5, -0.5, -0.5);
                u_xlat7.xyz = u_xlat8.xyz * vec3(_FontTexSDFScale) + u_xlat7.xyz;
                u_xlat7.xyz = u_xlat7.xyz + u_xlat7.xyz;
                u_xlat4.x = float(0.0);
                u_xlat4.y = float(0.0);
                u_xlat4.xyz = _FontTex_TexelSize.www * u_xlat18.xxx + u_xlat4.xyz;
                u_xlat4.xyz = u_xlat7.xyz / u_xlat4.xyz;
                u_xlat4.xyz = u_xlat4.xyz + vec3(0.5, 0.5, 0.5);
                u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
                u_xlat7.w = u_xlat16_3.w * u_xlat4.z;
                u_xlat6.xyz = u_xlat6.www * u_xlat6.xyz;
                u_xlat5.xyz = u_xlat5.www * u_xlat5.xyz;
                u_xlat7.xyz = u_xlat16_3.xyz * u_xlat7.www;
                u_xlat3 = (-u_xlat7) + u_xlat5;
                u_xlat3 = u_xlat4.yyyy * u_xlat3 + u_xlat7;
                u_xlat5 = (-u_xlat3) + u_xlat6;
                u_xlat3 = u_xlat4.xxxx * u_xlat5 + u_xlat3;
                u_xlatb18.x = 0.0<u_xlat3.w;
                u_xlat18.x = (u_xlatb18.x) ? u_xlat3.w : 1.0;
                u_xlat3.xyz = u_xlat3.xyz / u_xlat18.xxx;
                u_xlat16_2 = u_xlat3;
            } else {
                u_xlat16_2.x = float(1.0);
                u_xlat16_2.y = float(1.0);
                u_xlat16_2.z = float(1.0);
                u_xlat16_2.w = u_xlat16_9;
            }
        } else {
            u_xlatb9 = vs_TEXCOORD1.x==4.0;
            if(u_xlatb9){
                u_xlatu9 = uint(vs_TEXCOORD1.y);
                u_xlat3.y = vs_TEXCOORD1.z + 0.5;
                u_xlat3.x = float(0.5);
                u_xlat21.y = float(0.0);
                u_xlat18.xy = u_xlat3.xy * _GradientSettingsTex_TexelSize.xy;
                u_xlat16_4 = texture(_GradientSettingsTex, u_xlat18.xy);
                u_xlatb4.x = 0.0<u_xlat16_4.x;
                u_xlat22.xy = u_xlat16_4.zw + vec2(-0.5, -0.5);
                u_xlat22.xy = u_xlat22.xy + u_xlat22.xy;
                u_xlat5.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
                u_xlat5.xy = u_xlat5.xy * vec2(2.0, 2.0) + (-u_xlat22.xy);
                u_xlat23.x = dot(u_xlat5.xy, u_xlat5.xy);
                u_xlat23.x = inversesqrt(u_xlat23.x);
                u_xlat23.xy = u_xlat23.xx * u_xlat5.xy;
                u_xlat6.x = dot((-u_xlat22.xy), u_xlat23.xy);
                u_xlat22.x = dot(u_xlat22.xy, u_xlat22.xy);
                u_xlat22.x = (-u_xlat6.x) * u_xlat6.x + u_xlat22.x;
                u_xlat22.x = (-u_xlat22.x) + 1.0;
                u_xlat22.x = sqrt(u_xlat22.x);
                u_xlat31 = (-u_xlat22.x) + u_xlat6.x;
                u_xlat22.x = u_xlat22.x + u_xlat6.x;
                u_xlat6.x = min(u_xlat22.x, u_xlat31);
                u_xlatb15 = u_xlat6.x<0.0;
                u_xlat22.x = max(u_xlat22.x, u_xlat31);
                u_xlat22.x = (u_xlatb15) ? u_xlat22.x : u_xlat6.x;
                u_xlat22.xy = u_xlat22.xx * u_xlat23.xy;
                u_xlatb23 = 9.99999975e-05>=abs(u_xlat22.x);
                u_xlatb32 = 9.99999975e-05<abs(u_xlat22.y);
                u_xlat22.xy = u_xlat5.xy / u_xlat22.xy;
                u_xlat31 = u_xlatb32 ? u_xlat22.y : float(0.0);
                u_xlat14.x = (u_xlatb23) ? u_xlat31 : u_xlat22.x;
                u_xlat14.y = 0.0;
                u_xlat5.yz = (u_xlatb4.x) ? u_xlat14.xy : vs_TEXCOORD0.xy;
                u_xlat16_10.x = u_xlat16_4.y * 255.0;
                u_xlat16_10.x = roundEven(u_xlat16_10.x);
                u_xlati4 = int(u_xlat16_10.x);
                u_xlatb13.x = u_xlat5.y>=(-u_xlat5.y);
                u_xlat22.x = fract(abs(u_xlat5.y));
                u_xlat13 = (u_xlatb13.x) ? u_xlat22.x : (-u_xlat22.x);
                u_xlat13 = (u_xlati4 != 0) ? u_xlat5.y : u_xlat13;
                u_xlatb4.xz = equal(ivec4(u_xlati4), ivec4(1, 0, 2, 0)).xz;
                u_xlat31 = u_xlat13;
                u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
                u_xlat4.x = (u_xlatb4.x) ? u_xlat31 : u_xlat13;
                u_xlat13 = u_xlat4.x * 0.5;
                u_xlatb31 = u_xlat13>=(-u_xlat13);
                u_xlat13 = fract(abs(u_xlat13));
                u_xlat13 = (u_xlatb31) ? u_xlat13 : (-u_xlat13);
                u_xlat31 = u_xlat13 + u_xlat13;
                u_xlatb13.x = 0.5<u_xlat13;
                u_xlatb14 = u_xlat31>=(-u_xlat31);
                u_xlat32 = fract(abs(u_xlat31));
                u_xlat14.x = (u_xlatb14) ? u_xlat32 : (-u_xlat32);
                u_xlat14.x = (-u_xlat14.x) + 1.0;
                u_xlat13 = (u_xlatb13.x) ? u_xlat14.x : u_xlat31;
                u_xlat5.x = (u_xlatb4.z) ? u_xlat13 : u_xlat4.x;
                u_xlat21.x = _GradientSettingsTex_TexelSize.x;
                u_xlat3.xy = u_xlat3.xy * _GradientSettingsTex_TexelSize.xy + u_xlat21.xy;
                u_xlat16_4 = texture(_GradientSettingsTex, u_xlat3.xy);
                u_xlat3.xy = u_xlat16_4.yw * vec2(255.0, 255.0);
                u_xlat16_10.xy = u_xlat16_4.xz * vec2(65025.0, 65025.0) + u_xlat3.xy;
                u_xlat3.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
                u_xlat18.xy = u_xlat21.xy * vec2(2.0, 2.0) + u_xlat18.xy;
                u_xlat16_4 = texture(_GradientSettingsTex, u_xlat18.xy);
                u_xlat18.xy = u_xlat16_4.yw * vec2(255.0, 255.0);
                u_xlat16_10.xy = u_xlat16_4.xz * vec2(65025.0, 65025.0) + u_xlat18.xy;
                u_xlat18.xy = u_xlat3.xy * _TextureInfo[int(u_xlatu9)].yz;
                u_xlat3.xy = u_xlat16_10.xy * _TextureInfo[int(u_xlatu9)].yz;
                u_xlat9.xy = u_xlat5.xz * u_xlat3.xy + u_xlat18.xy;
                u_xlatb27 = vs_TEXCOORD1.y<4.0;
                if(u_xlatb27){
                    u_xlatb27 = vs_TEXCOORD1.y<2.0;
                    if(u_xlatb27){
                        u_xlatb27 = vs_TEXCOORD1.y<1.0;
                        if(u_xlatb27){
                            u_xlat3 = texture(_Texture0, u_xlat9.xy);
                        } else {
                            u_xlat3 = texture(_Texture1, u_xlat9.xy);
                        }
                    } else {
                        u_xlatb27 = vs_TEXCOORD1.y<3.0;
                        if(u_xlatb27){
                            u_xlat3 = texture(_Texture2, u_xlat9.xy);
                        } else {
                            u_xlat3 = texture(_Texture3, u_xlat9.xy);
                        }
                    }
                } else {
                    u_xlatb27 = vs_TEXCOORD1.y<6.0;
                    if(u_xlatb27){
                        u_xlatb27 = vs_TEXCOORD1.y<5.0;
                        if(u_xlatb27){
                            u_xlat3 = texture(_Texture4, u_xlat9.xy);
                        } else {
                            u_xlat3 = texture(_Texture5, u_xlat9.xy);
                        }
                    } else {
                        u_xlatb27 = vs_TEXCOORD1.y<7.0;
                        if(u_xlatb27){
                            u_xlat3 = texture(_Texture6, u_xlat9.xy);
                        } else {
                            u_xlat3 = texture(_Texture7, u_xlat9.xy);
                        }
                    }
                }
                u_xlat16_2 = u_xlat3;
            } else {
                u_xlatb9 = vs_TEXCOORD1.x==1.0;
                u_xlat16_2 = (bool(u_xlatb9)) ? vec4(1.0, 1.0, 1.0, 1.0) : vec4(0.0, 0.0, 0.0, 0.0);
            }
        }
    }
    u_xlatb9 = 0.0<_FontTexSDFScale;
    u_xlatb0.x = u_xlatb9 && u_xlatb0.x;
    u_xlat16_3 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_0 = (u_xlatb0.x) ? u_xlat16_2 : u_xlat16_3;
    u_xlatb4.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(u_xlat16_1);
    u_xlatb13.xy = lessThan(vec4(-9999.0, -9999.0, 0.0, 0.0), vs_TEXCOORD5.xzxx).xy;
    u_xlat31 = dot(vs_TEXCOORD5.xy, vs_TEXCOORD5.xy);
    u_xlat31 = sqrt(u_xlat31);
    u_xlat31 = u_xlat31 + -1.0;
    u_xlat5.x = dFdx(u_xlat31);
    u_xlat14.x = dFdy(u_xlat31);
    u_xlat5.x = abs(u_xlat14.x) + abs(u_xlat5.x);
    u_xlat31 = u_xlat31 / u_xlat5.x;
    u_xlat31 = (-u_xlat31) + 0.5;
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
    u_xlat31 = u_xlat16_0.w * u_xlat31;
    u_xlat16_1 = (u_xlatb13.x) ? u_xlat31 : u_xlat16_0.w;
    u_xlat13 = dot(vs_TEXCOORD5.zw, vs_TEXCOORD5.zw);
    u_xlat13 = sqrt(u_xlat13);
    u_xlat13 = u_xlat13 + -1.0;
    u_xlat31 = dFdx(u_xlat13);
    u_xlat5.x = dFdy(u_xlat13);
    u_xlat31 = abs(u_xlat31) + abs(u_xlat5.x);
    u_xlat13 = u_xlat13 / u_xlat31;
    u_xlat13 = (-u_xlat13) + 0.5;
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat13 = (-u_xlat13) + 1.0;
    u_xlat13 = u_xlat16_1 * u_xlat13;
    u_xlat16_1 = (u_xlatb13.y) ? u_xlat13 : u_xlat16_1;
    u_xlat13 = u_xlat16_1 + -0.00300000003;
    u_xlatb13.x = u_xlat13<0.0;
    u_xlatb13.x = u_xlatb4.x && u_xlatb13.x;
    if(u_xlatb13.x){discard;}
    SV_Target0.w = (u_xlatb4.x) ? u_xlat16_1 : u_xlat16_0.w;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FontTexSDFScale;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[8];
uniform 	vec4 _PixelClipInvView;
UNITY_LOCATION(9) uniform mediump sampler2D _ShaderInfoTex;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
in highp vec4 in_TEXCOORD4;
in highp vec4 in_TEXCOORD5;
in highp float in_TEXCOORD6;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
flat out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
flat out highp vec2 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
flat out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
int u_xlati3;
uint u_xlatu3;
bvec2 u_xlatb3;
vec3 u_xlat4;
bvec4 u_xlatb4;
vec4 u_xlat5;
mediump float u_xlat16_6;
vec4 u_xlat7;
vec4 u_xlat8;
bvec4 u_xlatb8;
mediump float u_xlat16_9;
vec2 u_xlat10;
vec2 u_xlat13;
bool u_xlatb13;
mediump vec3 u_xlat16_16;
vec2 u_xlat20;
vec2 u_xlat23;
int u_xlati30;
void main()
{
    u_xlat0 = in_TEXCOORD2.xxzz * vec4(255.0, 8160.0, 255.0, 8160.0);
    u_xlatb1 = greaterThanEqual(u_xlat0.yyww, (-u_xlat0.yyww));
    u_xlat1.x = (u_xlatb1.x) ? float(32.0) : float(-32.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.03125) : float(-0.03125);
    u_xlat1.z = (u_xlatb1.z) ? float(32.0) : float(-32.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.03125) : float(-0.03125);
    u_xlat0.xy = u_xlat0.xz * u_xlat1.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xz;
    u_xlat20.xy = in_TEXCOORD2.xz * vec2(255.0, 255.0) + (-u_xlat0.xy);
    u_xlat1.x = in_TEXCOORD1.x * 8160.0 + u_xlat0.x;
    u_xlat0.xz = u_xlat20.xy * vec2(0.09375, 0.03125);
    u_xlat1.y = in_TEXCOORD1.y * 2040.0 + u_xlat0.x;
    u_xlat2 = u_xlat1.xyxy + vec4(0.5, 0.5, 0.5, 1.5);
    u_xlat2 = u_xlat2 * _ShaderInfoTex_TexelSize.xyxy;
    u_xlat0.xw = u_xlat1.xy + vec2(0.5, 2.5);
    u_xlat0.xw = u_xlat0.xw * _ShaderInfoTex_TexelSize.xy;
    u_xlat1 = textureLod(_ShaderInfoTex, u_xlat2.xy, 0.0);
    u_xlat2 = textureLod(_ShaderInfoTex, u_xlat2.zw, 0.0);
    u_xlat3 = textureLod(_ShaderInfoTex, u_xlat0.xw, 0.0);
    u_xlat0.x = in_TEXCOORD3.x * 255.0;
    u_xlat0.x = roundEven(u_xlat0.x);
    u_xlatb4 = equal(u_xlat0.xxxx, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat5.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat5.z = u_xlatb4.z ? float(1.0) : 0.0;
    u_xlat5.w = u_xlatb4.w ? float(1.0) : 0.0;
;
    u_xlat0.xw = u_xlat5.zz + u_xlat5.wy;
    u_xlat0.x = u_xlat5.y + u_xlat0.x;
    u_xlat0.x = u_xlat5.x + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat1.z = dot(u_xlat1, in_POSITION0);
    u_xlat1.w = dot(u_xlat2, in_POSITION0);
    u_xlat2.x = dot(u_xlat3, in_POSITION0);
    u_xlat3 = u_xlat1.wwww * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat2.xxxx + u_xlat3;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlatb3.x = _FontTexSDFScale==0.0;
    u_xlatb3.x = u_xlatb3.x && u_xlatb4.w;
    u_xlat13.xy = u_xlat2.xy + vec2(1.0, 1.0);
    u_xlat13.xy = u_xlat13.xy / _PixelClipInvView.xy;
    u_xlat13.xy = u_xlat13.xy + vec2(0.152700007, 0.152700007);
    u_xlat13.xy = roundEven(u_xlat13.xy);
    u_xlat13.xy = u_xlat13.xy * _PixelClipInvView.xy + vec2(-1.0, -1.0);
    u_xlat2.xy = (u_xlatb3.x) ? u_xlat13.xy : u_xlat2.xy;
    vs_TEXCOORD4.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat3.x = u_xlatb4.w ? float(2.0) : 0.0;
    u_xlat3.y = u_xlatb4.x ? float(4.0) : 0.0;
;
    u_xlat0.x = u_xlat0.x + u_xlat3.x;
    u_xlat0.x = u_xlat0.w * 3.0 + u_xlat0.x;
    u_xlat0.x = u_xlat3.y + u_xlat0.x;
    u_xlat16_6 = 0.0;
    u_xlati30 = 0;
    u_xlati3 = 0;
    while(true){
        u_xlatb13 = u_xlati30>=7;
        u_xlati3 = 0;
        if(u_xlatb13){break;}
        u_xlatb13 = in_TEXCOORD6==_TextureInfo[u_xlati30].x;
        if(u_xlatb13){
            u_xlat16_6 = float(u_xlati30);
            u_xlati3 = int(0xFFFFFFFFu);
            break;
        }
        u_xlati30 = u_xlati30 + 1;
        u_xlatb3.x = u_xlatb13;
        u_xlat16_6 = 0.0;
    }
    u_xlat16_6 = (u_xlati3 != 0) ? u_xlat16_6 : 7.0;
    u_xlat0.w = dot(in_TEXCOORD4.zw, vec2(65025.0, 255.0));
    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_TEXCOORD3.zwzz).xy;
    u_xlat23.x = u_xlatb3.x ? 1.0 : float(0.0);
    u_xlat3.x = (u_xlatb3.x) ? 3.0 : 2.0;
    vs_TEXCOORD1.w = (u_xlatb3.y) ? u_xlat3.x : u_xlat23.x;
    if(u_xlatb4.y){
        u_xlatu3 = uint(u_xlat16_6);
        u_xlat1.xy = in_TEXCOORD0.xy * _TextureInfo[int(u_xlatu3)].yz;
    } else {
        u_xlat1.xy = in_TEXCOORD0.xy;
    }
    u_xlat23.x = in_TEXCOORD4.x * 8160.0 + u_xlat0.y;
    u_xlat23.y = in_TEXCOORD4.y * 2040.0 + u_xlat0.z;
    u_xlat10.xy = u_xlat23.xy + vec2(0.5, 0.5);
    u_xlat5.zw = u_xlat10.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat7 = in_TEXCOORD2.wwyy * vec4(255.0, 8160.0, 255.0, 8160.0);
    u_xlatb8 = greaterThanEqual(u_xlat7.yyww, (-u_xlat7.yyww));
    u_xlat8.x = (u_xlatb8.x) ? float(32.0) : float(-32.0);
    u_xlat8.y = (u_xlatb8.y) ? float(0.03125) : float(-0.03125);
    u_xlat8.z = (u_xlatb8.z) ? float(32.0) : float(-32.0);
    u_xlat8.w = (u_xlatb8.w) ? float(0.03125) : float(-0.03125);
    u_xlat3.xzw = u_xlat7.xzx * u_xlat8.ywy;
    u_xlat3.xzw = fract(u_xlat3.xzw);
    u_xlat3.xzw = u_xlat3.xzw * u_xlat8.xzx;
    u_xlat4.xyz = in_TEXCOORD2.wyw * vec3(255.0, 255.0, 255.0) + (-u_xlat3.xzw);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.03125, 0.03125, 0.125);
    u_xlat7.x = in_TEXCOORD4.z * 8160.0 + u_xlat3.w;
    u_xlat7.yz = in_TEXCOORD4.ww * vec2(2040.0, 2040.0) + u_xlat4.xz;
    u_xlat10.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat10.xy = u_xlat10.xy * _ShaderInfoTex_TexelSize.xy;
    if(u_xlatb3.y){
        u_xlat8 = textureLod(_ShaderInfoTex, u_xlat10.xy, 0.0);
        u_xlat16_16.xyz = u_xlat8.xyz;
        u_xlat16_9 = u_xlat8.w;
    } else {
        u_xlat16_16.xyz = in_COLOR0.xyz;
        u_xlat16_9 = in_COLOR0.w;
    }
    u_xlat3.x = in_TEXCOORD1.z * 8160.0 + u_xlat3.z;
    u_xlat3.y = in_TEXCOORD1.w * 2040.0 + u_xlat4.y;
    u_xlat3.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat5.xy = u_xlat3.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat3.x = textureLod(_ShaderInfoTex, u_xlat5.zw, 0.0).w;
    u_xlat3.x = u_xlat3.x * u_xlat16_9;
    vs_TEXCOORD3.xy = (u_xlatb4.w) ? u_xlat7.xz : u_xlat10.xy;
    vs_TEXCOORD6 = textureLod(_ShaderInfoTex, u_xlat5.xy, 0.0);
    gl_Position = u_xlat2;
    vs_COLOR0.xyz = u_xlat16_16.xyz;
    vs_COLOR0.w = u_xlat3.x;
    vs_TEXCOORD0 = u_xlat1;
    vs_TEXCOORD1.y = u_xlat16_6;
    vs_TEXCOORD1.xz = u_xlat0.xw;
    vs_TEXCOORD2 = u_xlat5;
    vs_TEXCOORD4.z = 0.0;
    vs_TEXCOORD4.w = in_TEXCOORD3.y;
    vs_TEXCOORD5 = in_TEXCOORD5;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _FontTex_TexelSize;
uniform 	float _FontTexSDFScale;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[8];
uniform 	vec4 _ScreenClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture1;
UNITY_LOCATION(2) uniform mediump sampler2D _Texture2;
UNITY_LOCATION(3) uniform mediump sampler2D _Texture3;
UNITY_LOCATION(4) uniform mediump sampler2D _Texture4;
UNITY_LOCATION(5) uniform mediump sampler2D _Texture5;
UNITY_LOCATION(6) uniform mediump sampler2D _Texture6;
UNITY_LOCATION(7) uniform mediump sampler2D _Texture7;
UNITY_LOCATION(8) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(9) uniform mediump sampler2D _ShaderInfoTex;
UNITY_LOCATION(10) uniform mediump sampler2D _GradientSettingsTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
flat in mediump vec4 vs_TEXCOORD1;
flat in highp vec2 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
flat in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
int u_xlati4;
bvec3 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec3 u_xlat8;
vec2 u_xlat9;
mediump float u_xlat16_9;
uint u_xlatu9;
bool u_xlatb9;
mediump vec2 u_xlat16_10;
float u_xlat13;
bvec2 u_xlatb13;
vec2 u_xlat14;
bool u_xlatb14;
bool u_xlatb15;
vec2 u_xlat18;
bvec2 u_xlatb18;
vec2 u_xlat21;
vec2 u_xlat22;
vec2 u_xlat23;
bool u_xlatb23;
float u_xlat27;
bool u_xlatb27;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD0.zwzz, vs_TEXCOORD6.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(vs_TEXCOORD6.zzzw, vs_TEXCOORD0.zzzw).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlatb18.xy = greaterThanEqual(vs_TEXCOORD4.xyxy, _ScreenClipRect.xyxy).xy;
    u_xlat18.x = u_xlatb18.x ? float(1.0) : 0.0;
    u_xlat18.y = u_xlatb18.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat18.xy + u_xlat0.xy;
    u_xlatb18.xy = greaterThanEqual(_ScreenClipRect.zwzw, vs_TEXCOORD4.xyxy).xy;
    u_xlat18.x = u_xlatb18.x ? float(1.0) : 0.0;
    u_xlat18.y = u_xlatb18.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat18.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
    u_xlatb0.x = u_xlat0.x<0.0;
    if(u_xlatb0.x){discard;}
    u_xlatb0.xy = equal(vs_TEXCOORD1.xxxx, vec4(2.0, 3.0, 0.0, 0.0)).xy;
    u_xlatb18.x = vs_TEXCOORD1.w>=2.0;
    u_xlat27 = vs_TEXCOORD1.w + -2.0;
    u_xlat16_1 = (u_xlatb18.x) ? u_xlat27 : vs_TEXCOORD1.w;
    if(u_xlatb0.y){
        u_xlatb9 = vs_TEXCOORD1.y<4.0;
        if(u_xlatb9){
            u_xlatb9 = vs_TEXCOORD1.y<2.0;
            if(u_xlatb9){
                u_xlatb9 = vs_TEXCOORD1.y<1.0;
                if(u_xlatb9){
                    u_xlat2 = texture(_Texture0, vs_TEXCOORD0.xy);
                } else {
                    u_xlat2 = texture(_Texture1, vs_TEXCOORD0.xy);
                }
            } else {
                u_xlatb9 = vs_TEXCOORD1.y<3.0;
                if(u_xlatb9){
                    u_xlat2 = texture(_Texture2, vs_TEXCOORD0.xy);
                } else {
                    u_xlat2 = texture(_Texture3, vs_TEXCOORD0.xy);
                }
            }
        } else {
            u_xlatb9 = vs_TEXCOORD1.y<6.0;
            if(u_xlatb9){
                u_xlatb9 = vs_TEXCOORD1.y<5.0;
                if(u_xlatb9){
                    u_xlat2 = texture(_Texture4, vs_TEXCOORD0.xy);
                } else {
                    u_xlat2 = texture(_Texture5, vs_TEXCOORD0.xy);
                }
            } else {
                u_xlatb9 = vs_TEXCOORD1.y<7.0;
                if(u_xlatb9){
                    u_xlat2 = texture(_Texture6, vs_TEXCOORD0.xy);
                } else {
                    u_xlat2 = texture(_Texture7, vs_TEXCOORD0.xy);
                }
            }
        }
        u_xlat16_2 = u_xlat2;
    } else {
        if(u_xlatb0.x){
            u_xlat16_9 = texture(_FontTex, vs_TEXCOORD0.xy).w;
            u_xlatb27 = 0.0<_FontTexSDFScale;
            if(u_xlatb27){
                u_xlat3 = vs_TEXCOORD3.xyxy + vec4(0.5, 1.5, 0.5, 2.5);
                u_xlat3 = u_xlat3 * _ShaderInfoTex_TexelSize.xyxy;
                u_xlat4.xy = vs_TEXCOORD3.xy + vec2(0.5, 3.5);
                u_xlat4.xy = u_xlat4.xy * _ShaderInfoTex_TexelSize.xy;
                u_xlat5 = textureLod(_ShaderInfoTex, u_xlat3.xy, 0.0);
                u_xlat16_3 = textureLod(_ShaderInfoTex, u_xlat3.zw, 0.0);
                u_xlat16_4 = textureLod(_ShaderInfoTex, u_xlat4.xy, 0.0);
                if(u_xlatb18.x){
                    u_xlat18.xy = vs_TEXCOORD3.xy + vec2(0.5, 0.5);
                    u_xlat18.xy = u_xlat18.xy * _ShaderInfoTex_TexelSize.xy;
                    u_xlat6 = textureLod(_ShaderInfoTex, u_xlat18.xy, 0.0);
                } else {
                    u_xlat6 = vs_COLOR0;
                }
                u_xlat4 = u_xlat16_4 * vec4(_FontTexSDFScale);
                u_xlat7.y = u_xlat4.w * 0.25;
                u_xlat18.xy = u_xlat4.xy * _FontTex_TexelSize.xx + vs_TEXCOORD0.xy;
                u_xlat8.z = texture(_FontTex, u_xlat18.xy).w;
                u_xlat7.x = (-u_xlat7.y);
                u_xlat7.z = 0.0;
                u_xlat7.xyz = u_xlat7.xyz + vs_TEXCOORD4.www;
                u_xlat18.x = dFdx(vs_TEXCOORD0.y);
                u_xlat27 = dFdy(vs_TEXCOORD0.y);
                u_xlat18.x = abs(u_xlat27) + abs(u_xlat18.x);
                u_xlat8.xy = vec2(u_xlat16_9);
                u_xlat8.xyz = u_xlat8.xyz + vec3(-0.5, -0.5, -0.5);
                u_xlat7.xyz = u_xlat8.xyz * vec3(_FontTexSDFScale) + u_xlat7.xyz;
                u_xlat7.xyz = u_xlat7.xyz + u_xlat7.xyz;
                u_xlat4.x = float(0.0);
                u_xlat4.y = float(0.0);
                u_xlat4.xyz = _FontTex_TexelSize.www * u_xlat18.xxx + u_xlat4.xyz;
                u_xlat4.xyz = u_xlat7.xyz / u_xlat4.xyz;
                u_xlat4.xyz = u_xlat4.xyz + vec3(0.5, 0.5, 0.5);
                u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
                u_xlat7.w = u_xlat16_3.w * u_xlat4.z;
                u_xlat6.xyz = u_xlat6.www * u_xlat6.xyz;
                u_xlat5.xyz = u_xlat5.www * u_xlat5.xyz;
                u_xlat7.xyz = u_xlat16_3.xyz * u_xlat7.www;
                u_xlat3 = (-u_xlat7) + u_xlat5;
                u_xlat3 = u_xlat4.yyyy * u_xlat3 + u_xlat7;
                u_xlat5 = (-u_xlat3) + u_xlat6;
                u_xlat3 = u_xlat4.xxxx * u_xlat5 + u_xlat3;
                u_xlatb18.x = 0.0<u_xlat3.w;
                u_xlat18.x = (u_xlatb18.x) ? u_xlat3.w : 1.0;
                u_xlat3.xyz = u_xlat3.xyz / u_xlat18.xxx;
                u_xlat16_2 = u_xlat3;
            } else {
                u_xlat16_2.x = float(1.0);
                u_xlat16_2.y = float(1.0);
                u_xlat16_2.z = float(1.0);
                u_xlat16_2.w = u_xlat16_9;
            }
        } else {
            u_xlatb9 = vs_TEXCOORD1.x==4.0;
            if(u_xlatb9){
                u_xlatu9 = uint(vs_TEXCOORD1.y);
                u_xlat3.y = vs_TEXCOORD1.z + 0.5;
                u_xlat3.x = float(0.5);
                u_xlat21.y = float(0.0);
                u_xlat18.xy = u_xlat3.xy * _GradientSettingsTex_TexelSize.xy;
                u_xlat16_4 = texture(_GradientSettingsTex, u_xlat18.xy);
                u_xlatb4.x = 0.0<u_xlat16_4.x;
                u_xlat22.xy = u_xlat16_4.zw + vec2(-0.5, -0.5);
                u_xlat22.xy = u_xlat22.xy + u_xlat22.xy;
                u_xlat5.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
                u_xlat5.xy = u_xlat5.xy * vec2(2.0, 2.0) + (-u_xlat22.xy);
                u_xlat23.x = dot(u_xlat5.xy, u_xlat5.xy);
                u_xlat23.x = inversesqrt(u_xlat23.x);
                u_xlat23.xy = u_xlat23.xx * u_xlat5.xy;
                u_xlat6.x = dot((-u_xlat22.xy), u_xlat23.xy);
                u_xlat22.x = dot(u_xlat22.xy, u_xlat22.xy);
                u_xlat22.x = (-u_xlat6.x) * u_xlat6.x + u_xlat22.x;
                u_xlat22.x = (-u_xlat22.x) + 1.0;
                u_xlat22.x = sqrt(u_xlat22.x);
                u_xlat31 = (-u_xlat22.x) + u_xlat6.x;
                u_xlat22.x = u_xlat22.x + u_xlat6.x;
                u_xlat6.x = min(u_xlat22.x, u_xlat31);
                u_xlatb15 = u_xlat6.x<0.0;
                u_xlat22.x = max(u_xlat22.x, u_xlat31);
                u_xlat22.x = (u_xlatb15) ? u_xlat22.x : u_xlat6.x;
                u_xlat22.xy = u_xlat22.xx * u_xlat23.xy;
                u_xlatb23 = 9.99999975e-05>=abs(u_xlat22.x);
                u_xlatb32 = 9.99999975e-05<abs(u_xlat22.y);
                u_xlat22.xy = u_xlat5.xy / u_xlat22.xy;
                u_xlat31 = u_xlatb32 ? u_xlat22.y : float(0.0);
                u_xlat14.x = (u_xlatb23) ? u_xlat31 : u_xlat22.x;
                u_xlat14.y = 0.0;
                u_xlat5.yz = (u_xlatb4.x) ? u_xlat14.xy : vs_TEXCOORD0.xy;
                u_xlat16_10.x = u_xlat16_4.y * 255.0;
                u_xlat16_10.x = roundEven(u_xlat16_10.x);
                u_xlati4 = int(u_xlat16_10.x);
                u_xlatb13.x = u_xlat5.y>=(-u_xlat5.y);
                u_xlat22.x = fract(abs(u_xlat5.y));
                u_xlat13 = (u_xlatb13.x) ? u_xlat22.x : (-u_xlat22.x);
                u_xlat13 = (u_xlati4 != 0) ? u_xlat5.y : u_xlat13;
                u_xlatb4.xz = equal(ivec4(u_xlati4), ivec4(1, 0, 2, 0)).xz;
                u_xlat31 = u_xlat13;
                u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
                u_xlat4.x = (u_xlatb4.x) ? u_xlat31 : u_xlat13;
                u_xlat13 = u_xlat4.x * 0.5;
                u_xlatb31 = u_xlat13>=(-u_xlat13);
                u_xlat13 = fract(abs(u_xlat13));
                u_xlat13 = (u_xlatb31) ? u_xlat13 : (-u_xlat13);
                u_xlat31 = u_xlat13 + u_xlat13;
                u_xlatb13.x = 0.5<u_xlat13;
                u_xlatb14 = u_xlat31>=(-u_xlat31);
                u_xlat32 = fract(abs(u_xlat31));
                u_xlat14.x = (u_xlatb14) ? u_xlat32 : (-u_xlat32);
                u_xlat14.x = (-u_xlat14.x) + 1.0;
                u_xlat13 = (u_xlatb13.x) ? u_xlat14.x : u_xlat31;
                u_xlat5.x = (u_xlatb4.z) ? u_xlat13 : u_xlat4.x;
                u_xlat21.x = _GradientSettingsTex_TexelSize.x;
                u_xlat3.xy = u_xlat3.xy * _GradientSettingsTex_TexelSize.xy + u_xlat21.xy;
                u_xlat16_4 = texture(_GradientSettingsTex, u_xlat3.xy);
                u_xlat3.xy = u_xlat16_4.yw * vec2(255.0, 255.0);
                u_xlat16_10.xy = u_xlat16_4.xz * vec2(65025.0, 65025.0) + u_xlat3.xy;
                u_xlat3.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
                u_xlat18.xy = u_xlat21.xy * vec2(2.0, 2.0) + u_xlat18.xy;
                u_xlat16_4 = texture(_GradientSettingsTex, u_xlat18.xy);
                u_xlat18.xy = u_xlat16_4.yw * vec2(255.0, 255.0);
                u_xlat16_10.xy = u_xlat16_4.xz * vec2(65025.0, 65025.0) + u_xlat18.xy;
                u_xlat18.xy = u_xlat3.xy * _TextureInfo[int(u_xlatu9)].yz;
                u_xlat3.xy = u_xlat16_10.xy * _TextureInfo[int(u_xlatu9)].yz;
                u_xlat9.xy = u_xlat5.xz * u_xlat3.xy + u_xlat18.xy;
                u_xlatb27 = vs_TEXCOORD1.y<4.0;
                if(u_xlatb27){
                    u_xlatb27 = vs_TEXCOORD1.y<2.0;
                    if(u_xlatb27){
                        u_xlatb27 = vs_TEXCOORD1.y<1.0;
                        if(u_xlatb27){
                            u_xlat3 = texture(_Texture0, u_xlat9.xy);
                        } else {
                            u_xlat3 = texture(_Texture1, u_xlat9.xy);
                        }
                    } else {
                        u_xlatb27 = vs_TEXCOORD1.y<3.0;
                        if(u_xlatb27){
                            u_xlat3 = texture(_Texture2, u_xlat9.xy);
                        } else {
                            u_xlat3 = texture(_Texture3, u_xlat9.xy);
                        }
                    }
                } else {
                    u_xlatb27 = vs_TEXCOORD1.y<6.0;
                    if(u_xlatb27){
                        u_xlatb27 = vs_TEXCOORD1.y<5.0;
                        if(u_xlatb27){
                            u_xlat3 = texture(_Texture4, u_xlat9.xy);
                        } else {
                            u_xlat3 = texture(_Texture5, u_xlat9.xy);
                        }
                    } else {
                        u_xlatb27 = vs_TEXCOORD1.y<7.0;
                        if(u_xlatb27){
                            u_xlat3 = texture(_Texture6, u_xlat9.xy);
                        } else {
                            u_xlat3 = texture(_Texture7, u_xlat9.xy);
                        }
                    }
                }
                u_xlat16_2 = u_xlat3;
            } else {
                u_xlatb9 = vs_TEXCOORD1.x==1.0;
                u_xlat16_2 = (bool(u_xlatb9)) ? vec4(1.0, 1.0, 1.0, 1.0) : vec4(0.0, 0.0, 0.0, 0.0);
            }
        }
    }
    u_xlatb9 = 0.0<_FontTexSDFScale;
    u_xlatb0.x = u_xlatb9 && u_xlatb0.x;
    u_xlat16_3 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_0 = (u_xlatb0.x) ? u_xlat16_2 : u_xlat16_3;
    u_xlatb4.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(u_xlat16_1);
    u_xlatb13.xy = lessThan(vec4(-9999.0, -9999.0, 0.0, 0.0), vs_TEXCOORD5.xzxx).xy;
    u_xlat31 = dot(vs_TEXCOORD5.xy, vs_TEXCOORD5.xy);
    u_xlat31 = sqrt(u_xlat31);
    u_xlat31 = u_xlat31 + -1.0;
    u_xlat5.x = dFdx(u_xlat31);
    u_xlat14.x = dFdy(u_xlat31);
    u_xlat5.x = abs(u_xlat14.x) + abs(u_xlat5.x);
    u_xlat31 = u_xlat31 / u_xlat5.x;
    u_xlat31 = (-u_xlat31) + 0.5;
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
    u_xlat31 = u_xlat16_0.w * u_xlat31;
    u_xlat16_1 = (u_xlatb13.x) ? u_xlat31 : u_xlat16_0.w;
    u_xlat13 = dot(vs_TEXCOORD5.zw, vs_TEXCOORD5.zw);
    u_xlat13 = sqrt(u_xlat13);
    u_xlat13 = u_xlat13 + -1.0;
    u_xlat31 = dFdx(u_xlat13);
    u_xlat5.x = dFdy(u_xlat13);
    u_xlat31 = abs(u_xlat31) + abs(u_xlat5.x);
    u_xlat13 = u_xlat13 / u_xlat31;
    u_xlat13 = (-u_xlat13) + 0.5;
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat13 = (-u_xlat13) + 1.0;
    u_xlat13 = u_xlat16_1 * u_xlat13;
    u_xlat16_1 = (u_xlatb13.y) ? u_xlat13 : u_xlat16_1;
    u_xlat13 = u_xlat16_1 + -0.00300000003;
    u_xlatb13.x = u_xlat13<0.0;
    u_xlatb13.x = u_xlatb4.x && u_xlatb13.x;
    if(u_xlatb13.x){discard;}
    SV_Target0.w = (u_xlatb4.x) ? u_xlat16_1 : u_xlat16_0.w;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
"// disassembly error Unable to decode SMOL-V shader
"
}
}
}
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  GpuProgramID 88086
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FontTexSDFScale;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[4];
uniform 	vec4 _PixelClipInvView;
uniform 	vec4 _Transforms[60];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
in highp vec4 in_TEXCOORD4;
in highp vec4 in_TEXCOORD5;
in highp float in_TEXCOORD6;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec2 u_xlat1;
ivec2 u_xlati1;
vec3 u_xlat2;
int u_xlati2;
uint u_xlatu2;
bvec4 u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
bool u_xlatb7;
float u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
int u_xlati15;
vec2 u_xlat19;
float u_xlat22;
int u_xlati22;
void main()
{
    u_xlat0 = in_TEXCOORD2.xzzw * vec4(765.0, 255.0, 8160.0, 255.0);
    u_xlati0 = int(u_xlat0.x);
    u_xlati1.xy = ivec2(u_xlati0) + ivec2(1, 2);
    u_xlat15.x = in_TEXCOORD3.x * 255.0;
    u_xlat15.x = roundEven(u_xlat15.x);
    u_xlatb2 = equal(u_xlat15.xxxx, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat3.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat3.z = u_xlatb2.z ? float(1.0) : 0.0;
    u_xlat3.w = u_xlatb2.w ? float(1.0) : 0.0;
;
    u_xlat15.xy = u_xlat3.zz + u_xlat3.wy;
    u_xlat15.x = u_xlat3.y + u_xlat15.x;
    u_xlat15.x = u_xlat3.x + u_xlat15.x;
    u_xlat15.x = min(u_xlat15.x, 1.0);
    u_xlat15.x = (-u_xlat15.x) + 1.0;
    u_xlat3.z = dot(_Transforms[u_xlati0], in_POSITION0);
    u_xlat3.w = dot(_Transforms[u_xlati1.x], in_POSITION0);
    u_xlat0.x = dot(_Transforms[u_xlati1.y], in_POSITION0);
    u_xlat4 = u_xlat3.wwww * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat3.zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat5 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat5;
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat4.wwww + u_xlat5;
    u_xlatb0 = _FontTexSDFScale==0.0;
    u_xlatb0 = u_xlatb0 && u_xlatb2.w;
    u_xlat1.xy = u_xlat4.xy + vec2(1.0, 1.0);
    u_xlat1.xy = u_xlat1.xy / _PixelClipInvView.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.152700007, 0.152700007);
    u_xlat1.xy = roundEven(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * _PixelClipInvView.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = (bool(u_xlatb0)) ? u_xlat1.xy : u_xlat4.xy;
    vs_TEXCOORD4.xy = u_xlat1.xy / u_xlat4.ww;
    u_xlat2.x = u_xlatb2.w ? float(2.0) : 0.0;
    u_xlat2.z = u_xlatb2.x ? float(4.0) : 0.0;
;
    u_xlat0.x = u_xlat15.x + u_xlat2.x;
    u_xlat0.x = u_xlat15.y * 3.0 + u_xlat0.x;
    u_xlat0.x = u_xlat2.z + u_xlat0.x;
    u_xlat15.x = (-in_TEXCOORD6) + _TextureInfo[1].x;
    u_xlati22 = int((0.0<u_xlat15.x) ? 0xFFFFFFFFu : uint(0));
    u_xlati15 = int((u_xlat15.x<0.0) ? 0xFFFFFFFFu : uint(0));
    u_xlati15 = (-u_xlati22) + u_xlati15;
    u_xlati15 = max((-u_xlati15), u_xlati15);
    u_xlat15.x = float(u_xlati15);
    u_xlat22 = (-in_TEXCOORD6) + _TextureInfo[2].x;
    u_xlati2 = int((0.0<u_xlat22) ? 0xFFFFFFFFu : uint(0));
    u_xlati22 = int((u_xlat22<0.0) ? 0xFFFFFFFFu : uint(0));
    u_xlati22 = (-u_xlati2) + u_xlati22;
    u_xlati22 = max((-u_xlati22), u_xlati22);
    u_xlat15.y = float(u_xlati22);
    u_xlat15.xy = (-u_xlat15.xy) + vec2(1.0, 1.0);
    u_xlat15.x = u_xlat15.y * 2.0 + u_xlat15.x;
    u_xlat22 = (-in_TEXCOORD6) + _TextureInfo[3].x;
    u_xlati2 = int((0.0<u_xlat22) ? 0xFFFFFFFFu : uint(0));
    u_xlati22 = int((u_xlat22<0.0) ? 0xFFFFFFFFu : uint(0));
    u_xlati22 = (-u_xlati2) + u_xlati22;
    u_xlati22 = max((-u_xlati22), u_xlati22);
    u_xlat22 = float(u_xlati22);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat15.x = u_xlat22 * 3.0 + u_xlat15.x;
    u_xlat15.y = dot(in_TEXCOORD4.zw, vec2(65025.0, 255.0));
    u_xlatb2.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_TEXCOORD3.zzwz).xz;
    u_xlat4.x = u_xlatb2.x ? 1.0 : float(0.0);
    u_xlat2.x = (u_xlatb2.x) ? 3.0 : 2.0;
    vs_TEXCOORD1.w = (u_xlatb2.z) ? u_xlat2.x : u_xlat4.x;
    if(u_xlatb2.y){
        u_xlatu2 = uint(u_xlat15.x);
        u_xlat3.xy = in_TEXCOORD0.xy * _TextureInfo[int(u_xlatu2)].yz;
    } else {
        u_xlat3.xy = in_TEXCOORD0.xy;
    }
    u_xlatb14 = u_xlat0.z>=(-u_xlat0.z);
    u_xlat2.xy = (bool(u_xlatb14)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat7.x = u_xlat0.y * u_xlat2.y;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * u_xlat2.x;
    u_xlat14 = in_TEXCOORD2.z * 255.0 + (-u_xlat7.x);
    u_xlat2.xy = in_TEXCOORD4.yw * vec2(2040.0, 2040.0);
    u_xlat19.x = in_TEXCOORD4.x * 8160.0 + u_xlat7.x;
    u_xlat19.y = u_xlat14 * 0.03125 + u_xlat2.x;
    u_xlat7.xy = u_xlat19.xy + vec2(0.5, 0.5);
    u_xlat5.zw = u_xlat7.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat7.x = in_TEXCOORD2.w * 8160.0;
    u_xlatb7 = u_xlat7.x>=(-u_xlat7.x);
    u_xlat7.xy = (bool(u_xlatb7)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat14 = u_xlat7.y * u_xlat0.w;
    u_xlat14 = fract(u_xlat14);
    u_xlat7.x = u_xlat14 * u_xlat7.x;
    u_xlat14 = in_TEXCOORD2.w * 255.0 + (-u_xlat7.x);
    u_xlat6.x = in_TEXCOORD4.z * 8160.0 + u_xlat7.x;
    u_xlat6.yz = vec2(u_xlat14) * vec2(0.03125, 0.125) + u_xlat2.yy;
    u_xlat7.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _ShaderInfoTex_TexelSize.xy;
    vs_TEXCOORD3.xy = (u_xlatb2.w) ? u_xlat6.xz : u_xlat7.xy;
    gl_Position.zw = u_xlat4.zw;
    gl_Position.xy = u_xlat1.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = u_xlat3;
    vs_TEXCOORD1.x = u_xlat0.x;
    vs_TEXCOORD1.yz = u_xlat15.xy;
    u_xlat5.x = in_TEXCOORD2.y * 255.0;
    u_xlat5.y = 0.0;
    vs_TEXCOORD2 = u_xlat5;
    vs_TEXCOORD4.z = 0.0;
    vs_TEXCOORD4.w = in_TEXCOORD3.y;
    vs_TEXCOORD5 = in_TEXCOORD5;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _FontTex_TexelSize;
uniform 	float _FontTexSDFScale;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[4];
uniform 	vec4 _ScreenClipRect;
uniform 	vec4 _ClipRects[20];
UNITY_LOCATION(0) uniform mediump sampler2D _ShaderInfoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(2) uniform mediump sampler2D _Texture1;
UNITY_LOCATION(3) uniform mediump sampler2D _Texture2;
UNITY_LOCATION(4) uniform mediump sampler2D _Texture3;
UNITY_LOCATION(5) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(6) uniform mediump sampler2D _GradientSettingsTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec2 u_xlati0;
uint u_xlatu0;
bvec4 u_xlatb0;
mediump float u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
int u_xlati5;
bvec3 u_xlatb5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
vec2 u_xlat10;
mediump float u_xlat16_10;
uint u_xlatu10;
bool u_xlatb10;
mediump vec2 u_xlat16_11;
float u_xlat14;
bvec2 u_xlatb14;
float u_xlat15;
bool u_xlatb15;
vec2 u_xlat16;
bool u_xlatb16;
bool u_xlatb17;
vec2 u_xlat20;
bvec2 u_xlatb20;
vec2 u_xlat24;
vec2 u_xlat25;
vec2 u_xlat26;
bool u_xlatb26;
float u_xlat30;
mediump float u_xlat16_30;
int u_xlati30;
bool u_xlatb30;
float u_xlat32;
float u_xlat34;
float u_xlat35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

void main()
{
    u_xlatu0 = uint(vs_TEXCOORD2.x);
    u_xlatb0.yz = greaterThanEqual(vs_TEXCOORD0.zzwz, _ClipRects[int(u_xlatu0)].xxyx).yz;
    u_xlatb0.xw = greaterThanEqual(_ClipRects[int(u_xlatu0)].zzzw, vs_TEXCOORD0.zzzw).xw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xw + u_xlat0.yz;
    u_xlatb20.xy = greaterThanEqual(vs_TEXCOORD4.xyxy, _ScreenClipRect.xyxy).xy;
    u_xlat20.x = u_xlatb20.x ? float(1.0) : 0.0;
    u_xlat20.y = u_xlatb20.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat20.xy + u_xlat0.xy;
    u_xlatb20.xy = greaterThanEqual(_ScreenClipRect.zwzw, vs_TEXCOORD4.xyxy).xy;
    u_xlat20.x = u_xlatb20.x ? float(1.0) : 0.0;
    u_xlat20.y = u_xlatb20.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat20.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
    u_xlatb0.x = u_xlat0.x<0.0;
    if(u_xlatb0.x){discard;}
    u_xlati0.xy = ivec2(uvec2(equal(vs_TEXCOORD1.xxxx, vec4(2.0, 3.0, 0.0, 0.0)).xy) * 0xFFFFFFFFu);
    u_xlatb20.x = vs_TEXCOORD1.w>=2.0;
    u_xlat30 = vs_TEXCOORD1.w + -2.0;
    u_xlat16_1 = (u_xlatb20.x) ? u_xlat30 : vs_TEXCOORD1.w;
    u_xlati30 = op_not(u_xlati0.x);
    u_xlati30 = u_xlatb20.x ? u_xlati30 : int(0);
    if(u_xlati30 != 0) {
        u_xlat16_2 = texture(_ShaderInfoTex, vs_TEXCOORD3.xy);
        u_xlat16_2 = u_xlat16_2;
    } else {
        u_xlat16_30 = texture(_ShaderInfoTex, vs_TEXCOORD2.zw).w;
        u_xlat32 = u_xlat16_30 * vs_COLOR0.w;
        u_xlat16_2.xyz = vs_COLOR0.xyz;
        u_xlat16_2.w = u_xlat32;
    }
    if(u_xlati0.y != 0) {
        u_xlatb10 = vs_TEXCOORD1.y<2.0;
        if(u_xlatb10){
            u_xlatb10 = vs_TEXCOORD1.y<1.0;
            if(u_xlatb10){
                u_xlat3 = texture(_Texture0, vs_TEXCOORD0.xy);
            } else {
                u_xlat3 = texture(_Texture1, vs_TEXCOORD0.xy);
            }
        } else {
            u_xlatb10 = vs_TEXCOORD1.y<3.0;
            if(u_xlatb10){
                u_xlat3 = texture(_Texture2, vs_TEXCOORD0.xy);
            } else {
                u_xlat3 = texture(_Texture3, vs_TEXCOORD0.xy);
            }
        }
        u_xlat16_3 = u_xlat3;
    } else {
        if(u_xlati0.x != 0) {
            u_xlat16_10 = texture(_FontTex, vs_TEXCOORD0.xy).w;
            u_xlatb30 = 0.0<_FontTexSDFScale;
            if(u_xlatb30){
                u_xlat4 = vs_TEXCOORD3.xyxy + vec4(0.5, 1.5, 0.5, 2.5);
                u_xlat4 = u_xlat4 * _ShaderInfoTex_TexelSize.xyxy;
                u_xlat5.xy = vs_TEXCOORD3.xy + vec2(0.5, 3.5);
                u_xlat5.xy = u_xlat5.xy * _ShaderInfoTex_TexelSize.xy;
                u_xlat6 = textureLod(_ShaderInfoTex, u_xlat4.xy, 0.0);
                u_xlat16_4 = textureLod(_ShaderInfoTex, u_xlat4.zw, 0.0);
                u_xlat16_5 = textureLod(_ShaderInfoTex, u_xlat5.xy, 0.0);
                if(u_xlatb20.x){
                    u_xlat20.xy = vs_TEXCOORD3.xy + vec2(0.5, 0.5);
                    u_xlat20.xy = u_xlat20.xy * _ShaderInfoTex_TexelSize.xy;
                    u_xlat7 = textureLod(_ShaderInfoTex, u_xlat20.xy, 0.0);
                } else {
                    u_xlat7 = u_xlat16_2;
                }
                u_xlat5 = u_xlat16_5 * vec4(_FontTexSDFScale);
                u_xlat8.y = u_xlat5.w * 0.25;
                u_xlat20.xy = u_xlat5.xy * _FontTex_TexelSize.xx + vs_TEXCOORD0.xy;
                u_xlat9.z = texture(_FontTex, u_xlat20.xy).w;
                u_xlat8.x = (-u_xlat8.y);
                u_xlat8.z = 0.0;
                u_xlat8.xyz = u_xlat8.xyz + vs_TEXCOORD4.www;
                u_xlat20.x = dFdx(vs_TEXCOORD0.y);
                u_xlat30 = dFdy(vs_TEXCOORD0.y);
                u_xlat20.x = abs(u_xlat30) + abs(u_xlat20.x);
                u_xlat9.xy = vec2(u_xlat16_10);
                u_xlat9.xyz = u_xlat9.xyz + vec3(-0.5, -0.5, -0.5);
                u_xlat8.xyz = u_xlat9.xyz * vec3(_FontTexSDFScale) + u_xlat8.xyz;
                u_xlat8.xyz = u_xlat8.xyz + u_xlat8.xyz;
                u_xlat5.x = float(0.0);
                u_xlat5.y = float(0.0);
                u_xlat5.xyz = _FontTex_TexelSize.www * u_xlat20.xxx + u_xlat5.xyz;
                u_xlat5.xyz = u_xlat8.xyz / u_xlat5.xyz;
                u_xlat5.xyz = u_xlat5.xyz + vec3(0.5, 0.5, 0.5);
                u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
                u_xlat8.w = u_xlat16_4.w * u_xlat5.z;
                u_xlat7.xyz = u_xlat7.www * u_xlat7.xyz;
                u_xlat6.xyz = u_xlat6.www * u_xlat6.xyz;
                u_xlat8.xyz = u_xlat16_4.xyz * u_xlat8.www;
                u_xlat4 = (-u_xlat8) + u_xlat6;
                u_xlat4 = u_xlat5.yyyy * u_xlat4 + u_xlat8;
                u_xlat6 = (-u_xlat4) + u_xlat7;
                u_xlat4 = u_xlat5.xxxx * u_xlat6 + u_xlat4;
                u_xlatb20.x = 0.0<u_xlat4.w;
                u_xlat20.x = (u_xlatb20.x) ? u_xlat4.w : 1.0;
                u_xlat4.xyz = u_xlat4.xyz / u_xlat20.xxx;
                u_xlat16_3 = u_xlat4;
            } else {
                u_xlat16_3.x = float(1.0);
                u_xlat16_3.y = float(1.0);
                u_xlat16_3.z = float(1.0);
                u_xlat16_3.w = u_xlat16_10;
            }
        } else {
            u_xlatb10 = vs_TEXCOORD1.x==4.0;
            if(u_xlatb10){
                u_xlatu10 = uint(vs_TEXCOORD1.y);
                u_xlat4.y = vs_TEXCOORD1.z + 0.5;
                u_xlat4.x = float(0.5);
                u_xlat24.y = float(0.0);
                u_xlat20.xy = u_xlat4.xy * _GradientSettingsTex_TexelSize.xy;
                u_xlat16_5 = texture(_GradientSettingsTex, u_xlat20.xy);
                u_xlatb5.x = 0.0<u_xlat16_5.x;
                u_xlat25.xy = u_xlat16_5.zw + vec2(-0.5, -0.5);
                u_xlat25.xy = u_xlat25.xy + u_xlat25.xy;
                u_xlat6.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
                u_xlat6.xy = u_xlat6.xy * vec2(2.0, 2.0) + (-u_xlat25.xy);
                u_xlat26.x = dot(u_xlat6.xy, u_xlat6.xy);
                u_xlat26.x = inversesqrt(u_xlat26.x);
                u_xlat26.xy = u_xlat26.xx * u_xlat6.xy;
                u_xlat7.x = dot((-u_xlat25.xy), u_xlat26.xy);
                u_xlat25.x = dot(u_xlat25.xy, u_xlat25.xy);
                u_xlat25.x = (-u_xlat7.x) * u_xlat7.x + u_xlat25.x;
                u_xlat25.x = (-u_xlat25.x) + 1.0;
                u_xlat25.x = sqrt(u_xlat25.x);
                u_xlat35 = (-u_xlat25.x) + u_xlat7.x;
                u_xlat25.x = u_xlat25.x + u_xlat7.x;
                u_xlat7.x = min(u_xlat25.x, u_xlat35);
                u_xlatb17 = u_xlat7.x<0.0;
                u_xlat25.x = max(u_xlat25.x, u_xlat35);
                u_xlat25.x = (u_xlatb17) ? u_xlat25.x : u_xlat7.x;
                u_xlat25.xy = u_xlat25.xx * u_xlat26.xy;
                u_xlatb26 = 9.99999975e-05>=abs(u_xlat25.x);
                u_xlatb36 = 9.99999975e-05<abs(u_xlat25.y);
                u_xlat25.xy = u_xlat6.xy / u_xlat25.xy;
                u_xlat35 = u_xlatb36 ? u_xlat25.y : float(0.0);
                u_xlat16.x = (u_xlatb26) ? u_xlat35 : u_xlat25.x;
                u_xlat16.y = 0.0;
                u_xlat6.yz = (u_xlatb5.x) ? u_xlat16.xy : vs_TEXCOORD0.xy;
                u_xlat16_11.x = u_xlat16_5.y * 255.0;
                u_xlat16_11.x = roundEven(u_xlat16_11.x);
                u_xlati5 = int(u_xlat16_11.x);
                u_xlatb15 = u_xlat6.y>=(-u_xlat6.y);
                u_xlat25.x = fract(abs(u_xlat6.y));
                u_xlat15 = (u_xlatb15) ? u_xlat25.x : (-u_xlat25.x);
                u_xlat15 = (u_xlati5 != 0) ? u_xlat6.y : u_xlat15;
                u_xlatb5.xz = equal(ivec4(u_xlati5), ivec4(1, 0, 2, 0)).xz;
                u_xlat35 = u_xlat15;
                u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
                u_xlat5.x = (u_xlatb5.x) ? u_xlat35 : u_xlat15;
                u_xlat15 = u_xlat5.x * 0.5;
                u_xlatb35 = u_xlat15>=(-u_xlat15);
                u_xlat15 = fract(abs(u_xlat15));
                u_xlat15 = (u_xlatb35) ? u_xlat15 : (-u_xlat15);
                u_xlat35 = u_xlat15 + u_xlat15;
                u_xlatb15 = 0.5<u_xlat15;
                u_xlatb16 = u_xlat35>=(-u_xlat35);
                u_xlat36 = fract(abs(u_xlat35));
                u_xlat16.x = (u_xlatb16) ? u_xlat36 : (-u_xlat36);
                u_xlat16.x = (-u_xlat16.x) + 1.0;
                u_xlat15 = (u_xlatb15) ? u_xlat16.x : u_xlat35;
                u_xlat6.x = (u_xlatb5.z) ? u_xlat15 : u_xlat5.x;
                u_xlat24.x = _GradientSettingsTex_TexelSize.x;
                u_xlat4.xy = u_xlat4.xy * _GradientSettingsTex_TexelSize.xy + u_xlat24.xy;
                u_xlat16_5 = texture(_GradientSettingsTex, u_xlat4.xy);
                u_xlat4.xy = u_xlat16_5.yw * vec2(255.0, 255.0);
                u_xlat16_11.xy = u_xlat16_5.xz * vec2(65025.0, 65025.0) + u_xlat4.xy;
                u_xlat4.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
                u_xlat20.xy = u_xlat24.xy * vec2(2.0, 2.0) + u_xlat20.xy;
                u_xlat16_5 = texture(_GradientSettingsTex, u_xlat20.xy);
                u_xlat20.xy = u_xlat16_5.yw * vec2(255.0, 255.0);
                u_xlat16_11.xy = u_xlat16_5.xz * vec2(65025.0, 65025.0) + u_xlat20.xy;
                u_xlat20.xy = u_xlat4.xy * _TextureInfo[int(u_xlatu10)].yz;
                u_xlat4.xy = u_xlat16_11.xy * _TextureInfo[int(u_xlatu10)].yz;
                u_xlat10.xy = u_xlat6.xz * u_xlat4.xy + u_xlat20.xy;
                u_xlatb30 = vs_TEXCOORD1.y<2.0;
                if(u_xlatb30){
                    u_xlatb30 = vs_TEXCOORD1.y<1.0;
                    if(u_xlatb30){
                        u_xlat4 = texture(_Texture0, u_xlat10.xy);
                    } else {
                        u_xlat4 = texture(_Texture1, u_xlat10.xy);
                    }
                } else {
                    u_xlatb30 = vs_TEXCOORD1.y<3.0;
                    if(u_xlatb30){
                        u_xlat4 = texture(_Texture2, u_xlat10.xy);
                    } else {
                        u_xlat4 = texture(_Texture3, u_xlat10.xy);
                    }
                }
                u_xlat16_3 = u_xlat4;
            } else {
                u_xlatb10 = vs_TEXCOORD1.x==1.0;
                u_xlat16_3 = (bool(u_xlatb10)) ? vec4(1.0, 1.0, 1.0, 1.0) : vec4(0.0, 0.0, 0.0, 0.0);
            }
        }
    }
    u_xlatb10 = 0.0<_FontTexSDFScale;
    u_xlati0.x = u_xlatb10 ? u_xlati0.x : int(0);
    u_xlat16_2 = u_xlat16_2 * u_xlat16_3;
    u_xlat16_0 = (u_xlati0.x != 0) ? u_xlat16_3 : u_xlat16_2;
    u_xlatb4 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(u_xlat16_1);
    u_xlatb14.xy = lessThan(vec4(-9999.0, -9999.0, 0.0, 0.0), vs_TEXCOORD5.xzxx).xy;
    u_xlat34 = dot(vs_TEXCOORD5.xy, vs_TEXCOORD5.xy);
    u_xlat34 = sqrt(u_xlat34);
    u_xlat34 = u_xlat34 + -1.0;
    u_xlat5.x = dFdx(u_xlat34);
    u_xlat15 = dFdy(u_xlat34);
    u_xlat5.x = abs(u_xlat15) + abs(u_xlat5.x);
    u_xlat34 = u_xlat34 / u_xlat5.x;
    u_xlat34 = (-u_xlat34) + 0.5;
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat34 = u_xlat16_0.w * u_xlat34;
    u_xlat16_1 = (u_xlatb14.x) ? u_xlat34 : u_xlat16_0.w;
    u_xlat14 = dot(vs_TEXCOORD5.zw, vs_TEXCOORD5.zw);
    u_xlat14 = sqrt(u_xlat14);
    u_xlat14 = u_xlat14 + -1.0;
    u_xlat34 = dFdx(u_xlat14);
    u_xlat5.x = dFdy(u_xlat14);
    u_xlat34 = abs(u_xlat34) + abs(u_xlat5.x);
    u_xlat14 = u_xlat14 / u_xlat34;
    u_xlat14 = (-u_xlat14) + 0.5;
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat14 = (-u_xlat14) + 1.0;
    u_xlat14 = u_xlat16_1 * u_xlat14;
    u_xlat16_1 = (u_xlatb14.y) ? u_xlat14 : u_xlat16_1;
    u_xlat14 = u_xlat16_1 + -0.00300000003;
    u_xlatb14.x = u_xlat14<0.0;
    u_xlatb14.x = u_xlatb4 && u_xlatb14.x;
    if(u_xlatb14.x){discard;}
    SV_Target0.w = (u_xlatb4) ? u_xlat16_1 : u_xlat16_0.w;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FontTexSDFScale;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[4];
uniform 	vec4 _PixelClipInvView;
uniform 	vec4 _Transforms[60];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
in highp vec4 in_TEXCOORD4;
in highp vec4 in_TEXCOORD5;
in highp float in_TEXCOORD6;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec2 u_xlat1;
ivec2 u_xlati1;
vec3 u_xlat2;
int u_xlati2;
uint u_xlatu2;
bvec4 u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
bool u_xlatb7;
float u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
int u_xlati15;
vec2 u_xlat19;
float u_xlat22;
int u_xlati22;
void main()
{
    u_xlat0 = in_TEXCOORD2.xzzw * vec4(765.0, 255.0, 8160.0, 255.0);
    u_xlati0 = int(u_xlat0.x);
    u_xlati1.xy = ivec2(u_xlati0) + ivec2(1, 2);
    u_xlat15.x = in_TEXCOORD3.x * 255.0;
    u_xlat15.x = roundEven(u_xlat15.x);
    u_xlatb2 = equal(u_xlat15.xxxx, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat3.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat3.z = u_xlatb2.z ? float(1.0) : 0.0;
    u_xlat3.w = u_xlatb2.w ? float(1.0) : 0.0;
;
    u_xlat15.xy = u_xlat3.zz + u_xlat3.wy;
    u_xlat15.x = u_xlat3.y + u_xlat15.x;
    u_xlat15.x = u_xlat3.x + u_xlat15.x;
    u_xlat15.x = min(u_xlat15.x, 1.0);
    u_xlat15.x = (-u_xlat15.x) + 1.0;
    u_xlat3.z = dot(_Transforms[u_xlati0], in_POSITION0);
    u_xlat3.w = dot(_Transforms[u_xlati1.x], in_POSITION0);
    u_xlat0.x = dot(_Transforms[u_xlati1.y], in_POSITION0);
    u_xlat4 = u_xlat3.wwww * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat3.zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat5 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat5;
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat4.wwww + u_xlat5;
    u_xlatb0 = _FontTexSDFScale==0.0;
    u_xlatb0 = u_xlatb0 && u_xlatb2.w;
    u_xlat1.xy = u_xlat4.xy + vec2(1.0, 1.0);
    u_xlat1.xy = u_xlat1.xy / _PixelClipInvView.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.152700007, 0.152700007);
    u_xlat1.xy = roundEven(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * _PixelClipInvView.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = (bool(u_xlatb0)) ? u_xlat1.xy : u_xlat4.xy;
    vs_TEXCOORD4.xy = u_xlat1.xy / u_xlat4.ww;
    u_xlat2.x = u_xlatb2.w ? float(2.0) : 0.0;
    u_xlat2.z = u_xlatb2.x ? float(4.0) : 0.0;
;
    u_xlat0.x = u_xlat15.x + u_xlat2.x;
    u_xlat0.x = u_xlat15.y * 3.0 + u_xlat0.x;
    u_xlat0.x = u_xlat2.z + u_xlat0.x;
    u_xlat15.x = (-in_TEXCOORD6) + _TextureInfo[1].x;
    u_xlati22 = int((0.0<u_xlat15.x) ? 0xFFFFFFFFu : uint(0));
    u_xlati15 = int((u_xlat15.x<0.0) ? 0xFFFFFFFFu : uint(0));
    u_xlati15 = (-u_xlati22) + u_xlati15;
    u_xlati15 = max((-u_xlati15), u_xlati15);
    u_xlat15.x = float(u_xlati15);
    u_xlat22 = (-in_TEXCOORD6) + _TextureInfo[2].x;
    u_xlati2 = int((0.0<u_xlat22) ? 0xFFFFFFFFu : uint(0));
    u_xlati22 = int((u_xlat22<0.0) ? 0xFFFFFFFFu : uint(0));
    u_xlati22 = (-u_xlati2) + u_xlati22;
    u_xlati22 = max((-u_xlati22), u_xlati22);
    u_xlat15.y = float(u_xlati22);
    u_xlat15.xy = (-u_xlat15.xy) + vec2(1.0, 1.0);
    u_xlat15.x = u_xlat15.y * 2.0 + u_xlat15.x;
    u_xlat22 = (-in_TEXCOORD6) + _TextureInfo[3].x;
    u_xlati2 = int((0.0<u_xlat22) ? 0xFFFFFFFFu : uint(0));
    u_xlati22 = int((u_xlat22<0.0) ? 0xFFFFFFFFu : uint(0));
    u_xlati22 = (-u_xlati2) + u_xlati22;
    u_xlati22 = max((-u_xlati22), u_xlati22);
    u_xlat22 = float(u_xlati22);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat15.x = u_xlat22 * 3.0 + u_xlat15.x;
    u_xlat15.y = dot(in_TEXCOORD4.zw, vec2(65025.0, 255.0));
    u_xlatb2.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_TEXCOORD3.zzwz).xz;
    u_xlat4.x = u_xlatb2.x ? 1.0 : float(0.0);
    u_xlat2.x = (u_xlatb2.x) ? 3.0 : 2.0;
    vs_TEXCOORD1.w = (u_xlatb2.z) ? u_xlat2.x : u_xlat4.x;
    if(u_xlatb2.y){
        u_xlatu2 = uint(u_xlat15.x);
        u_xlat3.xy = in_TEXCOORD0.xy * _TextureInfo[int(u_xlatu2)].yz;
    } else {
        u_xlat3.xy = in_TEXCOORD0.xy;
    }
    u_xlatb14 = u_xlat0.z>=(-u_xlat0.z);
    u_xlat2.xy = (bool(u_xlatb14)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat7.x = u_xlat0.y * u_xlat2.y;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * u_xlat2.x;
    u_xlat14 = in_TEXCOORD2.z * 255.0 + (-u_xlat7.x);
    u_xlat2.xy = in_TEXCOORD4.yw * vec2(2040.0, 2040.0);
    u_xlat19.x = in_TEXCOORD4.x * 8160.0 + u_xlat7.x;
    u_xlat19.y = u_xlat14 * 0.03125 + u_xlat2.x;
    u_xlat7.xy = u_xlat19.xy + vec2(0.5, 0.5);
    u_xlat5.zw = u_xlat7.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat7.x = in_TEXCOORD2.w * 8160.0;
    u_xlatb7 = u_xlat7.x>=(-u_xlat7.x);
    u_xlat7.xy = (bool(u_xlatb7)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat14 = u_xlat7.y * u_xlat0.w;
    u_xlat14 = fract(u_xlat14);
    u_xlat7.x = u_xlat14 * u_xlat7.x;
    u_xlat14 = in_TEXCOORD2.w * 255.0 + (-u_xlat7.x);
    u_xlat6.x = in_TEXCOORD4.z * 8160.0 + u_xlat7.x;
    u_xlat6.yz = vec2(u_xlat14) * vec2(0.03125, 0.125) + u_xlat2.yy;
    u_xlat7.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _ShaderInfoTex_TexelSize.xy;
    vs_TEXCOORD3.xy = (u_xlatb2.w) ? u_xlat6.xz : u_xlat7.xy;
    gl_Position.zw = u_xlat4.zw;
    gl_Position.xy = u_xlat1.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = u_xlat3;
    vs_TEXCOORD1.x = u_xlat0.x;
    vs_TEXCOORD1.yz = u_xlat15.xy;
    u_xlat5.x = in_TEXCOORD2.y * 255.0;
    u_xlat5.y = 0.0;
    vs_TEXCOORD2 = u_xlat5;
    vs_TEXCOORD4.z = 0.0;
    vs_TEXCOORD4.w = in_TEXCOORD3.y;
    vs_TEXCOORD5 = in_TEXCOORD5;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _FontTex_TexelSize;
uniform 	float _FontTexSDFScale;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[4];
uniform 	vec4 _ScreenClipRect;
uniform 	vec4 _ClipRects[20];
UNITY_LOCATION(0) uniform mediump sampler2D _ShaderInfoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(2) uniform mediump sampler2D _Texture1;
UNITY_LOCATION(3) uniform mediump sampler2D _Texture2;
UNITY_LOCATION(4) uniform mediump sampler2D _Texture3;
UNITY_LOCATION(5) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(6) uniform mediump sampler2D _GradientSettingsTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec2 u_xlati0;
uint u_xlatu0;
bvec4 u_xlatb0;
mediump float u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
int u_xlati5;
bvec3 u_xlatb5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
vec2 u_xlat10;
mediump float u_xlat16_10;
uint u_xlatu10;
bool u_xlatb10;
mediump vec2 u_xlat16_11;
float u_xlat14;
bvec2 u_xlatb14;
float u_xlat15;
bool u_xlatb15;
vec2 u_xlat16;
bool u_xlatb16;
bool u_xlatb17;
vec2 u_xlat20;
bvec2 u_xlatb20;
vec2 u_xlat24;
vec2 u_xlat25;
vec2 u_xlat26;
bool u_xlatb26;
float u_xlat30;
mediump float u_xlat16_30;
int u_xlati30;
bool u_xlatb30;
float u_xlat32;
float u_xlat34;
float u_xlat35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

void main()
{
    u_xlatu0 = uint(vs_TEXCOORD2.x);
    u_xlatb0.yz = greaterThanEqual(vs_TEXCOORD0.zzwz, _ClipRects[int(u_xlatu0)].xxyx).yz;
    u_xlatb0.xw = greaterThanEqual(_ClipRects[int(u_xlatu0)].zzzw, vs_TEXCOORD0.zzzw).xw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xw + u_xlat0.yz;
    u_xlatb20.xy = greaterThanEqual(vs_TEXCOORD4.xyxy, _ScreenClipRect.xyxy).xy;
    u_xlat20.x = u_xlatb20.x ? float(1.0) : 0.0;
    u_xlat20.y = u_xlatb20.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat20.xy + u_xlat0.xy;
    u_xlatb20.xy = greaterThanEqual(_ScreenClipRect.zwzw, vs_TEXCOORD4.xyxy).xy;
    u_xlat20.x = u_xlatb20.x ? float(1.0) : 0.0;
    u_xlat20.y = u_xlatb20.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat20.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
    u_xlatb0.x = u_xlat0.x<0.0;
    if(u_xlatb0.x){discard;}
    u_xlati0.xy = ivec2(uvec2(equal(vs_TEXCOORD1.xxxx, vec4(2.0, 3.0, 0.0, 0.0)).xy) * 0xFFFFFFFFu);
    u_xlatb20.x = vs_TEXCOORD1.w>=2.0;
    u_xlat30 = vs_TEXCOORD1.w + -2.0;
    u_xlat16_1 = (u_xlatb20.x) ? u_xlat30 : vs_TEXCOORD1.w;
    u_xlati30 = op_not(u_xlati0.x);
    u_xlati30 = u_xlatb20.x ? u_xlati30 : int(0);
    if(u_xlati30 != 0) {
        u_xlat16_2 = texture(_ShaderInfoTex, vs_TEXCOORD3.xy);
        u_xlat16_2 = u_xlat16_2;
    } else {
        u_xlat16_30 = texture(_ShaderInfoTex, vs_TEXCOORD2.zw).w;
        u_xlat32 = u_xlat16_30 * vs_COLOR0.w;
        u_xlat16_2.xyz = vs_COLOR0.xyz;
        u_xlat16_2.w = u_xlat32;
    }
    if(u_xlati0.y != 0) {
        u_xlatb10 = vs_TEXCOORD1.y<2.0;
        if(u_xlatb10){
            u_xlatb10 = vs_TEXCOORD1.y<1.0;
            if(u_xlatb10){
                u_xlat3 = texture(_Texture0, vs_TEXCOORD0.xy);
            } else {
                u_xlat3 = texture(_Texture1, vs_TEXCOORD0.xy);
            }
        } else {
            u_xlatb10 = vs_TEXCOORD1.y<3.0;
            if(u_xlatb10){
                u_xlat3 = texture(_Texture2, vs_TEXCOORD0.xy);
            } else {
                u_xlat3 = texture(_Texture3, vs_TEXCOORD0.xy);
            }
        }
        u_xlat16_3 = u_xlat3;
    } else {
        if(u_xlati0.x != 0) {
            u_xlat16_10 = texture(_FontTex, vs_TEXCOORD0.xy).w;
            u_xlatb30 = 0.0<_FontTexSDFScale;
            if(u_xlatb30){
                u_xlat4 = vs_TEXCOORD3.xyxy + vec4(0.5, 1.5, 0.5, 2.5);
                u_xlat4 = u_xlat4 * _ShaderInfoTex_TexelSize.xyxy;
                u_xlat5.xy = vs_TEXCOORD3.xy + vec2(0.5, 3.5);
                u_xlat5.xy = u_xlat5.xy * _ShaderInfoTex_TexelSize.xy;
                u_xlat6 = textureLod(_ShaderInfoTex, u_xlat4.xy, 0.0);
                u_xlat16_4 = textureLod(_ShaderInfoTex, u_xlat4.zw, 0.0);
                u_xlat16_5 = textureLod(_ShaderInfoTex, u_xlat5.xy, 0.0);
                if(u_xlatb20.x){
                    u_xlat20.xy = vs_TEXCOORD3.xy + vec2(0.5, 0.5);
                    u_xlat20.xy = u_xlat20.xy * _ShaderInfoTex_TexelSize.xy;
                    u_xlat7 = textureLod(_ShaderInfoTex, u_xlat20.xy, 0.0);
                } else {
                    u_xlat7 = u_xlat16_2;
                }
                u_xlat5 = u_xlat16_5 * vec4(_FontTexSDFScale);
                u_xlat8.y = u_xlat5.w * 0.25;
                u_xlat20.xy = u_xlat5.xy * _FontTex_TexelSize.xx + vs_TEXCOORD0.xy;
                u_xlat9.z = texture(_FontTex, u_xlat20.xy).w;
                u_xlat8.x = (-u_xlat8.y);
                u_xlat8.z = 0.0;
                u_xlat8.xyz = u_xlat8.xyz + vs_TEXCOORD4.www;
                u_xlat20.x = dFdx(vs_TEXCOORD0.y);
                u_xlat30 = dFdy(vs_TEXCOORD0.y);
                u_xlat20.x = abs(u_xlat30) + abs(u_xlat20.x);
                u_xlat9.xy = vec2(u_xlat16_10);
                u_xlat9.xyz = u_xlat9.xyz + vec3(-0.5, -0.5, -0.5);
                u_xlat8.xyz = u_xlat9.xyz * vec3(_FontTexSDFScale) + u_xlat8.xyz;
                u_xlat8.xyz = u_xlat8.xyz + u_xlat8.xyz;
                u_xlat5.x = float(0.0);
                u_xlat5.y = float(0.0);
                u_xlat5.xyz = _FontTex_TexelSize.www * u_xlat20.xxx + u_xlat5.xyz;
                u_xlat5.xyz = u_xlat8.xyz / u_xlat5.xyz;
                u_xlat5.xyz = u_xlat5.xyz + vec3(0.5, 0.5, 0.5);
                u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
                u_xlat8.w = u_xlat16_4.w * u_xlat5.z;
                u_xlat7.xyz = u_xlat7.www * u_xlat7.xyz;
                u_xlat6.xyz = u_xlat6.www * u_xlat6.xyz;
                u_xlat8.xyz = u_xlat16_4.xyz * u_xlat8.www;
                u_xlat4 = (-u_xlat8) + u_xlat6;
                u_xlat4 = u_xlat5.yyyy * u_xlat4 + u_xlat8;
                u_xlat6 = (-u_xlat4) + u_xlat7;
                u_xlat4 = u_xlat5.xxxx * u_xlat6 + u_xlat4;
                u_xlatb20.x = 0.0<u_xlat4.w;
                u_xlat20.x = (u_xlatb20.x) ? u_xlat4.w : 1.0;
                u_xlat4.xyz = u_xlat4.xyz / u_xlat20.xxx;
                u_xlat16_3 = u_xlat4;
            } else {
                u_xlat16_3.x = float(1.0);
                u_xlat16_3.y = float(1.0);
                u_xlat16_3.z = float(1.0);
                u_xlat16_3.w = u_xlat16_10;
            }
        } else {
            u_xlatb10 = vs_TEXCOORD1.x==4.0;
            if(u_xlatb10){
                u_xlatu10 = uint(vs_TEXCOORD1.y);
                u_xlat4.y = vs_TEXCOORD1.z + 0.5;
                u_xlat4.x = float(0.5);
                u_xlat24.y = float(0.0);
                u_xlat20.xy = u_xlat4.xy * _GradientSettingsTex_TexelSize.xy;
                u_xlat16_5 = texture(_GradientSettingsTex, u_xlat20.xy);
                u_xlatb5.x = 0.0<u_xlat16_5.x;
                u_xlat25.xy = u_xlat16_5.zw + vec2(-0.5, -0.5);
                u_xlat25.xy = u_xlat25.xy + u_xlat25.xy;
                u_xlat6.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
                u_xlat6.xy = u_xlat6.xy * vec2(2.0, 2.0) + (-u_xlat25.xy);
                u_xlat26.x = dot(u_xlat6.xy, u_xlat6.xy);
                u_xlat26.x = inversesqrt(u_xlat26.x);
                u_xlat26.xy = u_xlat26.xx * u_xlat6.xy;
                u_xlat7.x = dot((-u_xlat25.xy), u_xlat26.xy);
                u_xlat25.x = dot(u_xlat25.xy, u_xlat25.xy);
                u_xlat25.x = (-u_xlat7.x) * u_xlat7.x + u_xlat25.x;
                u_xlat25.x = (-u_xlat25.x) + 1.0;
                u_xlat25.x = sqrt(u_xlat25.x);
                u_xlat35 = (-u_xlat25.x) + u_xlat7.x;
                u_xlat25.x = u_xlat25.x + u_xlat7.x;
                u_xlat7.x = min(u_xlat25.x, u_xlat35);
                u_xlatb17 = u_xlat7.x<0.0;
                u_xlat25.x = max(u_xlat25.x, u_xlat35);
                u_xlat25.x = (u_xlatb17) ? u_xlat25.x : u_xlat7.x;
                u_xlat25.xy = u_xlat25.xx * u_xlat26.xy;
                u_xlatb26 = 9.99999975e-05>=abs(u_xlat25.x);
                u_xlatb36 = 9.99999975e-05<abs(u_xlat25.y);
                u_xlat25.xy = u_xlat6.xy / u_xlat25.xy;
                u_xlat35 = u_xlatb36 ? u_xlat25.y : float(0.0);
                u_xlat16.x = (u_xlatb26) ? u_xlat35 : u_xlat25.x;
                u_xlat16.y = 0.0;
                u_xlat6.yz = (u_xlatb5.x) ? u_xlat16.xy : vs_TEXCOORD0.xy;
                u_xlat16_11.x = u_xlat16_5.y * 255.0;
                u_xlat16_11.x = roundEven(u_xlat16_11.x);
                u_xlati5 = int(u_xlat16_11.x);
                u_xlatb15 = u_xlat6.y>=(-u_xlat6.y);
                u_xlat25.x = fract(abs(u_xlat6.y));
                u_xlat15 = (u_xlatb15) ? u_xlat25.x : (-u_xlat25.x);
                u_xlat15 = (u_xlati5 != 0) ? u_xlat6.y : u_xlat15;
                u_xlatb5.xz = equal(ivec4(u_xlati5), ivec4(1, 0, 2, 0)).xz;
                u_xlat35 = u_xlat15;
                u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
                u_xlat5.x = (u_xlatb5.x) ? u_xlat35 : u_xlat15;
                u_xlat15 = u_xlat5.x * 0.5;
                u_xlatb35 = u_xlat15>=(-u_xlat15);
                u_xlat15 = fract(abs(u_xlat15));
                u_xlat15 = (u_xlatb35) ? u_xlat15 : (-u_xlat15);
                u_xlat35 = u_xlat15 + u_xlat15;
                u_xlatb15 = 0.5<u_xlat15;
                u_xlatb16 = u_xlat35>=(-u_xlat35);
                u_xlat36 = fract(abs(u_xlat35));
                u_xlat16.x = (u_xlatb16) ? u_xlat36 : (-u_xlat36);
                u_xlat16.x = (-u_xlat16.x) + 1.0;
                u_xlat15 = (u_xlatb15) ? u_xlat16.x : u_xlat35;
                u_xlat6.x = (u_xlatb5.z) ? u_xlat15 : u_xlat5.x;
                u_xlat24.x = _GradientSettingsTex_TexelSize.x;
                u_xlat4.xy = u_xlat4.xy * _GradientSettingsTex_TexelSize.xy + u_xlat24.xy;
                u_xlat16_5 = texture(_GradientSettingsTex, u_xlat4.xy);
                u_xlat4.xy = u_xlat16_5.yw * vec2(255.0, 255.0);
                u_xlat16_11.xy = u_xlat16_5.xz * vec2(65025.0, 65025.0) + u_xlat4.xy;
                u_xlat4.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
                u_xlat20.xy = u_xlat24.xy * vec2(2.0, 2.0) + u_xlat20.xy;
                u_xlat16_5 = texture(_GradientSettingsTex, u_xlat20.xy);
                u_xlat20.xy = u_xlat16_5.yw * vec2(255.0, 255.0);
                u_xlat16_11.xy = u_xlat16_5.xz * vec2(65025.0, 65025.0) + u_xlat20.xy;
                u_xlat20.xy = u_xlat4.xy * _TextureInfo[int(u_xlatu10)].yz;
                u_xlat4.xy = u_xlat16_11.xy * _TextureInfo[int(u_xlatu10)].yz;
                u_xlat10.xy = u_xlat6.xz * u_xlat4.xy + u_xlat20.xy;
                u_xlatb30 = vs_TEXCOORD1.y<2.0;
                if(u_xlatb30){
                    u_xlatb30 = vs_TEXCOORD1.y<1.0;
                    if(u_xlatb30){
                        u_xlat4 = texture(_Texture0, u_xlat10.xy);
                    } else {
                        u_xlat4 = texture(_Texture1, u_xlat10.xy);
                    }
                } else {
                    u_xlatb30 = vs_TEXCOORD1.y<3.0;
                    if(u_xlatb30){
                        u_xlat4 = texture(_Texture2, u_xlat10.xy);
                    } else {
                        u_xlat4 = texture(_Texture3, u_xlat10.xy);
                    }
                }
                u_xlat16_3 = u_xlat4;
            } else {
                u_xlatb10 = vs_TEXCOORD1.x==1.0;
                u_xlat16_3 = (bool(u_xlatb10)) ? vec4(1.0, 1.0, 1.0, 1.0) : vec4(0.0, 0.0, 0.0, 0.0);
            }
        }
    }
    u_xlatb10 = 0.0<_FontTexSDFScale;
    u_xlati0.x = u_xlatb10 ? u_xlati0.x : int(0);
    u_xlat16_2 = u_xlat16_2 * u_xlat16_3;
    u_xlat16_0 = (u_xlati0.x != 0) ? u_xlat16_3 : u_xlat16_2;
    u_xlatb4 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(u_xlat16_1);
    u_xlatb14.xy = lessThan(vec4(-9999.0, -9999.0, 0.0, 0.0), vs_TEXCOORD5.xzxx).xy;
    u_xlat34 = dot(vs_TEXCOORD5.xy, vs_TEXCOORD5.xy);
    u_xlat34 = sqrt(u_xlat34);
    u_xlat34 = u_xlat34 + -1.0;
    u_xlat5.x = dFdx(u_xlat34);
    u_xlat15 = dFdy(u_xlat34);
    u_xlat5.x = abs(u_xlat15) + abs(u_xlat5.x);
    u_xlat34 = u_xlat34 / u_xlat5.x;
    u_xlat34 = (-u_xlat34) + 0.5;
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat34 = u_xlat16_0.w * u_xlat34;
    u_xlat16_1 = (u_xlatb14.x) ? u_xlat34 : u_xlat16_0.w;
    u_xlat14 = dot(vs_TEXCOORD5.zw, vs_TEXCOORD5.zw);
    u_xlat14 = sqrt(u_xlat14);
    u_xlat14 = u_xlat14 + -1.0;
    u_xlat34 = dFdx(u_xlat14);
    u_xlat5.x = dFdy(u_xlat14);
    u_xlat34 = abs(u_xlat34) + abs(u_xlat5.x);
    u_xlat14 = u_xlat14 / u_xlat34;
    u_xlat14 = (-u_xlat14) + 0.5;
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat14 = (-u_xlat14) + 1.0;
    u_xlat14 = u_xlat16_1 * u_xlat14;
    u_xlat16_1 = (u_xlatb14.y) ? u_xlat14 : u_xlat16_1;
    u_xlat14 = u_xlat16_1 + -0.00300000003;
    u_xlatb14.x = u_xlat14<0.0;
    u_xlatb14.x = u_xlatb4 && u_xlatb14.x;
    if(u_xlatb14.x){discard;}
    SV_Target0.w = (u_xlatb4) ? u_xlat16_1 : u_xlat16_0.w;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FontTexSDFScale;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[4];
uniform 	vec4 _PixelClipInvView;
uniform 	vec4 _Transforms[60];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
in highp vec4 in_TEXCOORD4;
in highp vec4 in_TEXCOORD5;
in highp float in_TEXCOORD6;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec2 u_xlat1;
ivec2 u_xlati1;
vec3 u_xlat2;
int u_xlati2;
uint u_xlatu2;
bvec4 u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
bool u_xlatb7;
float u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
int u_xlati15;
vec2 u_xlat19;
float u_xlat22;
int u_xlati22;
void main()
{
    u_xlat0 = in_TEXCOORD2.xzzw * vec4(765.0, 255.0, 8160.0, 255.0);
    u_xlati0 = int(u_xlat0.x);
    u_xlati1.xy = ivec2(u_xlati0) + ivec2(1, 2);
    u_xlat15.x = in_TEXCOORD3.x * 255.0;
    u_xlat15.x = roundEven(u_xlat15.x);
    u_xlatb2 = equal(u_xlat15.xxxx, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat3.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat3.z = u_xlatb2.z ? float(1.0) : 0.0;
    u_xlat3.w = u_xlatb2.w ? float(1.0) : 0.0;
;
    u_xlat15.xy = u_xlat3.zz + u_xlat3.wy;
    u_xlat15.x = u_xlat3.y + u_xlat15.x;
    u_xlat15.x = u_xlat3.x + u_xlat15.x;
    u_xlat15.x = min(u_xlat15.x, 1.0);
    u_xlat15.x = (-u_xlat15.x) + 1.0;
    u_xlat3.z = dot(_Transforms[u_xlati0], in_POSITION0);
    u_xlat3.w = dot(_Transforms[u_xlati1.x], in_POSITION0);
    u_xlat0.x = dot(_Transforms[u_xlati1.y], in_POSITION0);
    u_xlat4 = u_xlat3.wwww * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat3.zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat5 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat5;
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat4.wwww + u_xlat5;
    u_xlatb0 = _FontTexSDFScale==0.0;
    u_xlatb0 = u_xlatb0 && u_xlatb2.w;
    u_xlat1.xy = u_xlat4.xy + vec2(1.0, 1.0);
    u_xlat1.xy = u_xlat1.xy / _PixelClipInvView.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.152700007, 0.152700007);
    u_xlat1.xy = roundEven(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * _PixelClipInvView.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = (bool(u_xlatb0)) ? u_xlat1.xy : u_xlat4.xy;
    vs_TEXCOORD4.xy = u_xlat1.xy / u_xlat4.ww;
    u_xlat2.x = u_xlatb2.w ? float(2.0) : 0.0;
    u_xlat2.z = u_xlatb2.x ? float(4.0) : 0.0;
;
    u_xlat0.x = u_xlat15.x + u_xlat2.x;
    u_xlat0.x = u_xlat15.y * 3.0 + u_xlat0.x;
    u_xlat0.x = u_xlat2.z + u_xlat0.x;
    u_xlat15.x = (-in_TEXCOORD6) + _TextureInfo[1].x;
    u_xlati22 = int((0.0<u_xlat15.x) ? 0xFFFFFFFFu : uint(0));
    u_xlati15 = int((u_xlat15.x<0.0) ? 0xFFFFFFFFu : uint(0));
    u_xlati15 = (-u_xlati22) + u_xlati15;
    u_xlati15 = max((-u_xlati15), u_xlati15);
    u_xlat15.x = float(u_xlati15);
    u_xlat22 = (-in_TEXCOORD6) + _TextureInfo[2].x;
    u_xlati2 = int((0.0<u_xlat22) ? 0xFFFFFFFFu : uint(0));
    u_xlati22 = int((u_xlat22<0.0) ? 0xFFFFFFFFu : uint(0));
    u_xlati22 = (-u_xlati2) + u_xlati22;
    u_xlati22 = max((-u_xlati22), u_xlati22);
    u_xlat15.y = float(u_xlati22);
    u_xlat15.xy = (-u_xlat15.xy) + vec2(1.0, 1.0);
    u_xlat15.x = u_xlat15.y * 2.0 + u_xlat15.x;
    u_xlat22 = (-in_TEXCOORD6) + _TextureInfo[3].x;
    u_xlati2 = int((0.0<u_xlat22) ? 0xFFFFFFFFu : uint(0));
    u_xlati22 = int((u_xlat22<0.0) ? 0xFFFFFFFFu : uint(0));
    u_xlati22 = (-u_xlati2) + u_xlati22;
    u_xlati22 = max((-u_xlati22), u_xlati22);
    u_xlat22 = float(u_xlati22);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat15.x = u_xlat22 * 3.0 + u_xlat15.x;
    u_xlat15.y = dot(in_TEXCOORD4.zw, vec2(65025.0, 255.0));
    u_xlatb2.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_TEXCOORD3.zzwz).xz;
    u_xlat4.x = u_xlatb2.x ? 1.0 : float(0.0);
    u_xlat2.x = (u_xlatb2.x) ? 3.0 : 2.0;
    vs_TEXCOORD1.w = (u_xlatb2.z) ? u_xlat2.x : u_xlat4.x;
    if(u_xlatb2.y){
        u_xlatu2 = uint(u_xlat15.x);
        u_xlat3.xy = in_TEXCOORD0.xy * _TextureInfo[int(u_xlatu2)].yz;
    } else {
        u_xlat3.xy = in_TEXCOORD0.xy;
    }
    u_xlatb14 = u_xlat0.z>=(-u_xlat0.z);
    u_xlat2.xy = (bool(u_xlatb14)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat7.x = u_xlat0.y * u_xlat2.y;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * u_xlat2.x;
    u_xlat14 = in_TEXCOORD2.z * 255.0 + (-u_xlat7.x);
    u_xlat2.xy = in_TEXCOORD4.yw * vec2(2040.0, 2040.0);
    u_xlat19.x = in_TEXCOORD4.x * 8160.0 + u_xlat7.x;
    u_xlat19.y = u_xlat14 * 0.03125 + u_xlat2.x;
    u_xlat7.xy = u_xlat19.xy + vec2(0.5, 0.5);
    u_xlat5.zw = u_xlat7.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat7.x = in_TEXCOORD2.w * 8160.0;
    u_xlatb7 = u_xlat7.x>=(-u_xlat7.x);
    u_xlat7.xy = (bool(u_xlatb7)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat14 = u_xlat7.y * u_xlat0.w;
    u_xlat14 = fract(u_xlat14);
    u_xlat7.x = u_xlat14 * u_xlat7.x;
    u_xlat14 = in_TEXCOORD2.w * 255.0 + (-u_xlat7.x);
    u_xlat6.x = in_TEXCOORD4.z * 8160.0 + u_xlat7.x;
    u_xlat6.yz = vec2(u_xlat14) * vec2(0.03125, 0.125) + u_xlat2.yy;
    u_xlat7.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _ShaderInfoTex_TexelSize.xy;
    vs_TEXCOORD3.xy = (u_xlatb2.w) ? u_xlat6.xz : u_xlat7.xy;
    gl_Position.zw = u_xlat4.zw;
    gl_Position.xy = u_xlat1.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = u_xlat3;
    vs_TEXCOORD1.x = u_xlat0.x;
    vs_TEXCOORD1.yz = u_xlat15.xy;
    u_xlat5.x = in_TEXCOORD2.y * 255.0;
    u_xlat5.y = 0.0;
    vs_TEXCOORD2 = u_xlat5;
    vs_TEXCOORD4.z = 0.0;
    vs_TEXCOORD4.w = in_TEXCOORD3.y;
    vs_TEXCOORD5 = in_TEXCOORD5;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _FontTex_TexelSize;
uniform 	float _FontTexSDFScale;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[4];
uniform 	vec4 _ScreenClipRect;
uniform 	vec4 _ClipRects[20];
UNITY_LOCATION(0) uniform mediump sampler2D _ShaderInfoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(2) uniform mediump sampler2D _Texture1;
UNITY_LOCATION(3) uniform mediump sampler2D _Texture2;
UNITY_LOCATION(4) uniform mediump sampler2D _Texture3;
UNITY_LOCATION(5) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(6) uniform mediump sampler2D _GradientSettingsTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec2 u_xlati0;
uint u_xlatu0;
bvec4 u_xlatb0;
mediump float u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
int u_xlati5;
bvec3 u_xlatb5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
vec2 u_xlat10;
mediump float u_xlat16_10;
uint u_xlatu10;
bool u_xlatb10;
mediump vec2 u_xlat16_11;
float u_xlat14;
bvec2 u_xlatb14;
float u_xlat15;
bool u_xlatb15;
vec2 u_xlat16;
bool u_xlatb16;
bool u_xlatb17;
vec2 u_xlat20;
bvec2 u_xlatb20;
vec2 u_xlat24;
vec2 u_xlat25;
vec2 u_xlat26;
bool u_xlatb26;
float u_xlat30;
mediump float u_xlat16_30;
int u_xlati30;
bool u_xlatb30;
float u_xlat32;
float u_xlat34;
float u_xlat35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

void main()
{
    u_xlatu0 = uint(vs_TEXCOORD2.x);
    u_xlatb0.yz = greaterThanEqual(vs_TEXCOORD0.zzwz, _ClipRects[int(u_xlatu0)].xxyx).yz;
    u_xlatb0.xw = greaterThanEqual(_ClipRects[int(u_xlatu0)].zzzw, vs_TEXCOORD0.zzzw).xw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xw + u_xlat0.yz;
    u_xlatb20.xy = greaterThanEqual(vs_TEXCOORD4.xyxy, _ScreenClipRect.xyxy).xy;
    u_xlat20.x = u_xlatb20.x ? float(1.0) : 0.0;
    u_xlat20.y = u_xlatb20.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat20.xy + u_xlat0.xy;
    u_xlatb20.xy = greaterThanEqual(_ScreenClipRect.zwzw, vs_TEXCOORD4.xyxy).xy;
    u_xlat20.x = u_xlatb20.x ? float(1.0) : 0.0;
    u_xlat20.y = u_xlatb20.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat20.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
    u_xlatb0.x = u_xlat0.x<0.0;
    if(u_xlatb0.x){discard;}
    u_xlati0.xy = ivec2(uvec2(equal(vs_TEXCOORD1.xxxx, vec4(2.0, 3.0, 0.0, 0.0)).xy) * 0xFFFFFFFFu);
    u_xlatb20.x = vs_TEXCOORD1.w>=2.0;
    u_xlat30 = vs_TEXCOORD1.w + -2.0;
    u_xlat16_1 = (u_xlatb20.x) ? u_xlat30 : vs_TEXCOORD1.w;
    u_xlati30 = op_not(u_xlati0.x);
    u_xlati30 = u_xlatb20.x ? u_xlati30 : int(0);
    if(u_xlati30 != 0) {
        u_xlat16_2 = texture(_ShaderInfoTex, vs_TEXCOORD3.xy);
        u_xlat16_2 = u_xlat16_2;
    } else {
        u_xlat16_30 = texture(_ShaderInfoTex, vs_TEXCOORD2.zw).w;
        u_xlat32 = u_xlat16_30 * vs_COLOR0.w;
        u_xlat16_2.xyz = vs_COLOR0.xyz;
        u_xlat16_2.w = u_xlat32;
    }
    if(u_xlati0.y != 0) {
        u_xlatb10 = vs_TEXCOORD1.y<2.0;
        if(u_xlatb10){
            u_xlatb10 = vs_TEXCOORD1.y<1.0;
            if(u_xlatb10){
                u_xlat3 = texture(_Texture0, vs_TEXCOORD0.xy);
            } else {
                u_xlat3 = texture(_Texture1, vs_TEXCOORD0.xy);
            }
        } else {
            u_xlatb10 = vs_TEXCOORD1.y<3.0;
            if(u_xlatb10){
                u_xlat3 = texture(_Texture2, vs_TEXCOORD0.xy);
            } else {
                u_xlat3 = texture(_Texture3, vs_TEXCOORD0.xy);
            }
        }
        u_xlat16_3 = u_xlat3;
    } else {
        if(u_xlati0.x != 0) {
            u_xlat16_10 = texture(_FontTex, vs_TEXCOORD0.xy).w;
            u_xlatb30 = 0.0<_FontTexSDFScale;
            if(u_xlatb30){
                u_xlat4 = vs_TEXCOORD3.xyxy + vec4(0.5, 1.5, 0.5, 2.5);
                u_xlat4 = u_xlat4 * _ShaderInfoTex_TexelSize.xyxy;
                u_xlat5.xy = vs_TEXCOORD3.xy + vec2(0.5, 3.5);
                u_xlat5.xy = u_xlat5.xy * _ShaderInfoTex_TexelSize.xy;
                u_xlat6 = textureLod(_ShaderInfoTex, u_xlat4.xy, 0.0);
                u_xlat16_4 = textureLod(_ShaderInfoTex, u_xlat4.zw, 0.0);
                u_xlat16_5 = textureLod(_ShaderInfoTex, u_xlat5.xy, 0.0);
                if(u_xlatb20.x){
                    u_xlat20.xy = vs_TEXCOORD3.xy + vec2(0.5, 0.5);
                    u_xlat20.xy = u_xlat20.xy * _ShaderInfoTex_TexelSize.xy;
                    u_xlat7 = textureLod(_ShaderInfoTex, u_xlat20.xy, 0.0);
                } else {
                    u_xlat7 = u_xlat16_2;
                }
                u_xlat5 = u_xlat16_5 * vec4(_FontTexSDFScale);
                u_xlat8.y = u_xlat5.w * 0.25;
                u_xlat20.xy = u_xlat5.xy * _FontTex_TexelSize.xx + vs_TEXCOORD0.xy;
                u_xlat9.z = texture(_FontTex, u_xlat20.xy).w;
                u_xlat8.x = (-u_xlat8.y);
                u_xlat8.z = 0.0;
                u_xlat8.xyz = u_xlat8.xyz + vs_TEXCOORD4.www;
                u_xlat20.x = dFdx(vs_TEXCOORD0.y);
                u_xlat30 = dFdy(vs_TEXCOORD0.y);
                u_xlat20.x = abs(u_xlat30) + abs(u_xlat20.x);
                u_xlat9.xy = vec2(u_xlat16_10);
                u_xlat9.xyz = u_xlat9.xyz + vec3(-0.5, -0.5, -0.5);
                u_xlat8.xyz = u_xlat9.xyz * vec3(_FontTexSDFScale) + u_xlat8.xyz;
                u_xlat8.xyz = u_xlat8.xyz + u_xlat8.xyz;
                u_xlat5.x = float(0.0);
                u_xlat5.y = float(0.0);
                u_xlat5.xyz = _FontTex_TexelSize.www * u_xlat20.xxx + u_xlat5.xyz;
                u_xlat5.xyz = u_xlat8.xyz / u_xlat5.xyz;
                u_xlat5.xyz = u_xlat5.xyz + vec3(0.5, 0.5, 0.5);
                u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
                u_xlat8.w = u_xlat16_4.w * u_xlat5.z;
                u_xlat7.xyz = u_xlat7.www * u_xlat7.xyz;
                u_xlat6.xyz = u_xlat6.www * u_xlat6.xyz;
                u_xlat8.xyz = u_xlat16_4.xyz * u_xlat8.www;
                u_xlat4 = (-u_xlat8) + u_xlat6;
                u_xlat4 = u_xlat5.yyyy * u_xlat4 + u_xlat8;
                u_xlat6 = (-u_xlat4) + u_xlat7;
                u_xlat4 = u_xlat5.xxxx * u_xlat6 + u_xlat4;
                u_xlatb20.x = 0.0<u_xlat4.w;
                u_xlat20.x = (u_xlatb20.x) ? u_xlat4.w : 1.0;
                u_xlat4.xyz = u_xlat4.xyz / u_xlat20.xxx;
                u_xlat16_3 = u_xlat4;
            } else {
                u_xlat16_3.x = float(1.0);
                u_xlat16_3.y = float(1.0);
                u_xlat16_3.z = float(1.0);
                u_xlat16_3.w = u_xlat16_10;
            }
        } else {
            u_xlatb10 = vs_TEXCOORD1.x==4.0;
            if(u_xlatb10){
                u_xlatu10 = uint(vs_TEXCOORD1.y);
                u_xlat4.y = vs_TEXCOORD1.z + 0.5;
                u_xlat4.x = float(0.5);
                u_xlat24.y = float(0.0);
                u_xlat20.xy = u_xlat4.xy * _GradientSettingsTex_TexelSize.xy;
                u_xlat16_5 = texture(_GradientSettingsTex, u_xlat20.xy);
                u_xlatb5.x = 0.0<u_xlat16_5.x;
                u_xlat25.xy = u_xlat16_5.zw + vec2(-0.5, -0.5);
                u_xlat25.xy = u_xlat25.xy + u_xlat25.xy;
                u_xlat6.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
                u_xlat6.xy = u_xlat6.xy * vec2(2.0, 2.0) + (-u_xlat25.xy);
                u_xlat26.x = dot(u_xlat6.xy, u_xlat6.xy);
                u_xlat26.x = inversesqrt(u_xlat26.x);
                u_xlat26.xy = u_xlat26.xx * u_xlat6.xy;
                u_xlat7.x = dot((-u_xlat25.xy), u_xlat26.xy);
                u_xlat25.x = dot(u_xlat25.xy, u_xlat25.xy);
                u_xlat25.x = (-u_xlat7.x) * u_xlat7.x + u_xlat25.x;
                u_xlat25.x = (-u_xlat25.x) + 1.0;
                u_xlat25.x = sqrt(u_xlat25.x);
                u_xlat35 = (-u_xlat25.x) + u_xlat7.x;
                u_xlat25.x = u_xlat25.x + u_xlat7.x;
                u_xlat7.x = min(u_xlat25.x, u_xlat35);
                u_xlatb17 = u_xlat7.x<0.0;
                u_xlat25.x = max(u_xlat25.x, u_xlat35);
                u_xlat25.x = (u_xlatb17) ? u_xlat25.x : u_xlat7.x;
                u_xlat25.xy = u_xlat25.xx * u_xlat26.xy;
                u_xlatb26 = 9.99999975e-05>=abs(u_xlat25.x);
                u_xlatb36 = 9.99999975e-05<abs(u_xlat25.y);
                u_xlat25.xy = u_xlat6.xy / u_xlat25.xy;
                u_xlat35 = u_xlatb36 ? u_xlat25.y : float(0.0);
                u_xlat16.x = (u_xlatb26) ? u_xlat35 : u_xlat25.x;
                u_xlat16.y = 0.0;
                u_xlat6.yz = (u_xlatb5.x) ? u_xlat16.xy : vs_TEXCOORD0.xy;
                u_xlat16_11.x = u_xlat16_5.y * 255.0;
                u_xlat16_11.x = roundEven(u_xlat16_11.x);
                u_xlati5 = int(u_xlat16_11.x);
                u_xlatb15 = u_xlat6.y>=(-u_xlat6.y);
                u_xlat25.x = fract(abs(u_xlat6.y));
                u_xlat15 = (u_xlatb15) ? u_xlat25.x : (-u_xlat25.x);
                u_xlat15 = (u_xlati5 != 0) ? u_xlat6.y : u_xlat15;
                u_xlatb5.xz = equal(ivec4(u_xlati5), ivec4(1, 0, 2, 0)).xz;
                u_xlat35 = u_xlat15;
                u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
                u_xlat5.x = (u_xlatb5.x) ? u_xlat35 : u_xlat15;
                u_xlat15 = u_xlat5.x * 0.5;
                u_xlatb35 = u_xlat15>=(-u_xlat15);
                u_xlat15 = fract(abs(u_xlat15));
                u_xlat15 = (u_xlatb35) ? u_xlat15 : (-u_xlat15);
                u_xlat35 = u_xlat15 + u_xlat15;
                u_xlatb15 = 0.5<u_xlat15;
                u_xlatb16 = u_xlat35>=(-u_xlat35);
                u_xlat36 = fract(abs(u_xlat35));
                u_xlat16.x = (u_xlatb16) ? u_xlat36 : (-u_xlat36);
                u_xlat16.x = (-u_xlat16.x) + 1.0;
                u_xlat15 = (u_xlatb15) ? u_xlat16.x : u_xlat35;
                u_xlat6.x = (u_xlatb5.z) ? u_xlat15 : u_xlat5.x;
                u_xlat24.x = _GradientSettingsTex_TexelSize.x;
                u_xlat4.xy = u_xlat4.xy * _GradientSettingsTex_TexelSize.xy + u_xlat24.xy;
                u_xlat16_5 = texture(_GradientSettingsTex, u_xlat4.xy);
                u_xlat4.xy = u_xlat16_5.yw * vec2(255.0, 255.0);
                u_xlat16_11.xy = u_xlat16_5.xz * vec2(65025.0, 65025.0) + u_xlat4.xy;
                u_xlat4.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
                u_xlat20.xy = u_xlat24.xy * vec2(2.0, 2.0) + u_xlat20.xy;
                u_xlat16_5 = texture(_GradientSettingsTex, u_xlat20.xy);
                u_xlat20.xy = u_xlat16_5.yw * vec2(255.0, 255.0);
                u_xlat16_11.xy = u_xlat16_5.xz * vec2(65025.0, 65025.0) + u_xlat20.xy;
                u_xlat20.xy = u_xlat4.xy * _TextureInfo[int(u_xlatu10)].yz;
                u_xlat4.xy = u_xlat16_11.xy * _TextureInfo[int(u_xlatu10)].yz;
                u_xlat10.xy = u_xlat6.xz * u_xlat4.xy + u_xlat20.xy;
                u_xlatb30 = vs_TEXCOORD1.y<2.0;
                if(u_xlatb30){
                    u_xlatb30 = vs_TEXCOORD1.y<1.0;
                    if(u_xlatb30){
                        u_xlat4 = texture(_Texture0, u_xlat10.xy);
                    } else {
                        u_xlat4 = texture(_Texture1, u_xlat10.xy);
                    }
                } else {
                    u_xlatb30 = vs_TEXCOORD1.y<3.0;
                    if(u_xlatb30){
                        u_xlat4 = texture(_Texture2, u_xlat10.xy);
                    } else {
                        u_xlat4 = texture(_Texture3, u_xlat10.xy);
                    }
                }
                u_xlat16_3 = u_xlat4;
            } else {
                u_xlatb10 = vs_TEXCOORD1.x==1.0;
                u_xlat16_3 = (bool(u_xlatb10)) ? vec4(1.0, 1.0, 1.0, 1.0) : vec4(0.0, 0.0, 0.0, 0.0);
            }
        }
    }
    u_xlatb10 = 0.0<_FontTexSDFScale;
    u_xlati0.x = u_xlatb10 ? u_xlati0.x : int(0);
    u_xlat16_2 = u_xlat16_2 * u_xlat16_3;
    u_xlat16_0 = (u_xlati0.x != 0) ? u_xlat16_3 : u_xlat16_2;
    u_xlatb4 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(u_xlat16_1);
    u_xlatb14.xy = lessThan(vec4(-9999.0, -9999.0, 0.0, 0.0), vs_TEXCOORD5.xzxx).xy;
    u_xlat34 = dot(vs_TEXCOORD5.xy, vs_TEXCOORD5.xy);
    u_xlat34 = sqrt(u_xlat34);
    u_xlat34 = u_xlat34 + -1.0;
    u_xlat5.x = dFdx(u_xlat34);
    u_xlat15 = dFdy(u_xlat34);
    u_xlat5.x = abs(u_xlat15) + abs(u_xlat5.x);
    u_xlat34 = u_xlat34 / u_xlat5.x;
    u_xlat34 = (-u_xlat34) + 0.5;
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat34 = u_xlat16_0.w * u_xlat34;
    u_xlat16_1 = (u_xlatb14.x) ? u_xlat34 : u_xlat16_0.w;
    u_xlat14 = dot(vs_TEXCOORD5.zw, vs_TEXCOORD5.zw);
    u_xlat14 = sqrt(u_xlat14);
    u_xlat14 = u_xlat14 + -1.0;
    u_xlat34 = dFdx(u_xlat14);
    u_xlat5.x = dFdy(u_xlat14);
    u_xlat34 = abs(u_xlat34) + abs(u_xlat5.x);
    u_xlat14 = u_xlat14 / u_xlat34;
    u_xlat14 = (-u_xlat14) + 0.5;
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat14 = (-u_xlat14) + 1.0;
    u_xlat14 = u_xlat16_1 * u_xlat14;
    u_xlat16_1 = (u_xlatb14.y) ? u_xlat14 : u_xlat16_1;
    u_xlat14 = u_xlat16_1 + -0.00300000003;
    u_xlatb14.x = u_xlat14<0.0;
    u_xlatb14.x = u_xlatb4 && u_xlatb14.x;
    if(u_xlatb14.x){discard;}
    SV_Target0.w = (u_xlatb4) ? u_xlat16_1 : u_xlat16_0.w;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
"// disassembly error Unable to decode SMOL-V shader
"
}
}
}
}
}