//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/TextCore/Distance Field SSD" {
Properties {
_FaceColor ("Face Color", Color) = (1,1,1,1)
_FaceDilate ("Face Dilate", Range(-1, 1)) = 0
_OutlineColor ("Outline Color", Color) = (0,0,0,1)
_OutlineWidth ("Outline Thickness", Range(0, 1)) = 0
_OutlineSoftness ("Outline Softness", Range(0, 1)) = 0
_UnderlayColor ("Border Color", Color) = (0,0,0,0.5)
_UnderlayOffsetX ("Border OffsetX", Range(-1, 1)) = 0
_UnderlayOffsetY ("Border OffsetY", Range(-1, 1)) = 0
_UnderlayDilate ("Border Dilate", Range(-1, 1)) = 0
_UnderlaySoftness ("Border Softness", Range(0, 1)) = 0
_WeightNormal ("Weight Normal", Float) = 0
_WeightBold ("Weight Bold", Float) = 0.5
_ShaderFlags ("Flags", Float) = 0
_ScaleRatioA ("Scale RatioA", Float) = 1
_ScaleRatioB ("Scale RatioB", Float) = 1
_ScaleRatioC ("Scale RatioC", Float) = 1
_MainTex ("Font Atlas", 2D) = "white" { }
_TextureWidth ("Texture Width", Float) = 1024
_TextureHeight ("Texture Height", Float) = 1024
_GradientScale ("Gradient Scale", Float) = 1
_ScaleX ("Scale X", Float) = 1
_ScaleY ("Scale Y", Float) = 1
_PerspectiveFilter ("Perspective Correction", Range(0, 1)) = 0.875
_Sharpness ("Sharpness", Range(-1, 1)) = 0
_VertexOffsetX ("Vertex OffsetX", Float) = 0
_VertexOffsetY ("Vertex OffsetY", Float) = 0
}
SubShader {
 Tags { "ForceSupported" = "true" }
 Pass {
  Tags { "ForceSupported" = "true" }
  Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 3471
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _FaceColor;
uniform 	float _FaceDilate;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _Sharpness;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
uniform 	vec4 _MainTex_TexelSize;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_COLOR0;
out highp vec4 vs_COLOR1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _FaceColor;
    vs_COLOR0.xyz = u_xlat0.www * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat0.w;
    u_xlat0.x = in_COLOR0.w * _OutlineColor.w;
    vs_COLOR1.xyz = u_xlat0.xxx * _OutlineColor.xyz;
    vs_COLOR1.w = u_xlat0.x;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat2.x = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat2.x + _WeightNormal;
    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
    vs_TEXCOORD1.x = (-u_xlat0.x) * 0.5 + 0.5;
    u_xlat0.x = _GradientScale * 1.33329999;
    u_xlat2.x = _Sharpness + 1.0;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    vs_TEXCOORD1.y = u_xlat0.x / _MainTex_TexelSize.z;
    u_xlat0.x = _OutlineWidth * _ScaleRatioA;
    vs_TEXCOORD1.z = u_xlat0.x * 0.5;
    vs_TEXCOORD1.w = 0.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

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
uniform 	float _OutlineSoftness;
uniform 	float _ScaleRatioA;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in highp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_1;
float u_xlat2;
mediump float u_xlat16_2;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = dFdx(vs_TEXCOORD0.xy);
    u_xlat4.xy = dFdy(vs_TEXCOORD0.yx);
    u_xlat2 = u_xlat4.y * u_xlat0.y;
    u_xlat0.x = u_xlat0.x * u_xlat4.x + (-u_xlat2);
    u_xlat0.x = inversesqrt(abs(u_xlat0.x));
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD1.y;
    u_xlat2 = _OutlineSoftness * _ScaleRatioA;
    u_xlat2 = u_xlat2 * u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat0.x / u_xlat2;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat2 = u_xlat16_2 + (-vs_TEXCOORD1.x);
    u_xlat0.x = u_xlat2 * u_xlat0.x + 0.5;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0 = u_xlat0.xxxx * vs_COLOR0;
    u_xlat16_1 = texture(_GUIClipTexture, vs_TEXCOORD2.xy).w;
    SV_Target0 = u_xlat0 * vec4(u_xlat16_1);
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _FaceColor;
uniform 	float _FaceDilate;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _Sharpness;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
uniform 	vec4 _MainTex_TexelSize;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_COLOR0;
out highp vec4 vs_COLOR1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _FaceColor;
    vs_COLOR0.xyz = u_xlat0.www * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat0.w;
    u_xlat0.x = in_COLOR0.w * _OutlineColor.w;
    vs_COLOR1.xyz = u_xlat0.xxx * _OutlineColor.xyz;
    vs_COLOR1.w = u_xlat0.x;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat2.x = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat2.x + _WeightNormal;
    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
    vs_TEXCOORD1.x = (-u_xlat0.x) * 0.5 + 0.5;
    u_xlat0.x = _GradientScale * 1.33329999;
    u_xlat2.x = _Sharpness + 1.0;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    vs_TEXCOORD1.y = u_xlat0.x / _MainTex_TexelSize.z;
    u_xlat0.x = _OutlineWidth * _ScaleRatioA;
    vs_TEXCOORD1.z = u_xlat0.x * 0.5;
    vs_TEXCOORD1.w = 0.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

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
uniform 	float _OutlineSoftness;
uniform 	float _ScaleRatioA;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in highp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_1;
float u_xlat2;
mediump float u_xlat16_2;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = dFdx(vs_TEXCOORD0.xy);
    u_xlat4.xy = dFdy(vs_TEXCOORD0.yx);
    u_xlat2 = u_xlat4.y * u_xlat0.y;
    u_xlat0.x = u_xlat0.x * u_xlat4.x + (-u_xlat2);
    u_xlat0.x = inversesqrt(abs(u_xlat0.x));
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD1.y;
    u_xlat2 = _OutlineSoftness * _ScaleRatioA;
    u_xlat2 = u_xlat2 * u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat0.x / u_xlat2;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat2 = u_xlat16_2 + (-vs_TEXCOORD1.x);
    u_xlat0.x = u_xlat2 * u_xlat0.x + 0.5;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0 = u_xlat0.xxxx * vs_COLOR0;
    u_xlat16_1 = texture(_GUIClipTexture, vs_TEXCOORD2.xy).w;
    SV_Target0 = u_xlat0 * vec4(u_xlat16_1);
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _FaceColor;
uniform 	float _FaceDilate;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _Sharpness;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
uniform 	vec4 _MainTex_TexelSize;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_COLOR0;
out highp vec4 vs_COLOR1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _FaceColor;
    vs_COLOR0.xyz = u_xlat0.www * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat0.w;
    u_xlat0.x = in_COLOR0.w * _OutlineColor.w;
    vs_COLOR1.xyz = u_xlat0.xxx * _OutlineColor.xyz;
    vs_COLOR1.w = u_xlat0.x;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat2.x = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat2.x + _WeightNormal;
    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
    vs_TEXCOORD1.x = (-u_xlat0.x) * 0.5 + 0.5;
    u_xlat0.x = _GradientScale * 1.33329999;
    u_xlat2.x = _Sharpness + 1.0;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    vs_TEXCOORD1.y = u_xlat0.x / _MainTex_TexelSize.z;
    u_xlat0.x = _OutlineWidth * _ScaleRatioA;
    vs_TEXCOORD1.z = u_xlat0.x * 0.5;
    vs_TEXCOORD1.w = 0.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

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
uniform 	float _OutlineSoftness;
uniform 	float _ScaleRatioA;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in highp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_1;
float u_xlat2;
mediump float u_xlat16_2;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = dFdx(vs_TEXCOORD0.xy);
    u_xlat4.xy = dFdy(vs_TEXCOORD0.yx);
    u_xlat2 = u_xlat4.y * u_xlat0.y;
    u_xlat0.x = u_xlat0.x * u_xlat4.x + (-u_xlat2);
    u_xlat0.x = inversesqrt(abs(u_xlat0.x));
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD1.y;
    u_xlat2 = _OutlineSoftness * _ScaleRatioA;
    u_xlat2 = u_xlat2 * u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat0.x / u_xlat2;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat2 = u_xlat16_2 + (-vs_TEXCOORD1.x);
    u_xlat0.x = u_xlat2 * u_xlat0.x + 0.5;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0 = u_xlat0.xxxx * vs_COLOR0;
    u_xlat16_1 = texture(_GUIClipTexture, vs_TEXCOORD2.xy).w;
    SV_Target0 = u_xlat0 * vec4(u_xlat16_1);
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
CustomEditor "TextCore.Text.TextCoreShaderGUISDF"
}