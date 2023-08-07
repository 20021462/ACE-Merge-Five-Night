//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "EGA/Particles/FireSphere" {
Properties {
_MainTex ("Main Tex", 2D) = "white" { }
_Color ("Color", Color) = (1,1,1,1)
_Emission ("Emission", Float) = 2
_StartFrequency ("Start Frequency", Float) = 4
_Frequency ("Frequency", Float) = 10
_Amplitude ("Amplitude", Float) = 1
[Toggle] _Usedepth ("Use depth?", Float) = 0
_Depthpower ("Depth power", Float) = 1
[Toggle] _Useblack ("Use black", Float) = 0
_Opacity ("Opacity", Float) = 1
_tex3coord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent+0" "RenderType" = "Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "PreviewType" = "Plane" "QUEUE" = "Transparent+0" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  GpuProgramID 64237
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _Useblack;
uniform 	float _Emission;
uniform 	vec4 _Color;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
float u_xlat4;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat6.xy = floor(u_xlat0.xy);
    u_xlat6.x = u_xlat6.y * 57.0 + u_xlat6.x;
    u_xlat1.xyz = u_xlat6.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat0.z = u_xlat6.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat9 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat7.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat7.xy;
    u_xlat9 = u_xlat0.x * u_xlat9 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat6.x = (-u_xlat0.x) + u_xlat9;
    u_xlat0.x = u_xlat0.y * u_xlat6.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat3.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat3.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat6.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat6.xy * u_xlat6.xy;
    u_xlat3.xy = (-u_xlat6.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat3.xy = u_xlat3.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat9 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat9 = u_xlat3.x * u_xlat9 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat3.x * u_xlat1.x + u_xlat0.x;
    u_xlat3.x = (-u_xlat0.x) + u_xlat9;
    u_xlat0.x = u_xlat3.y * u_xlat3.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat9 = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat9 = u_xlat9 * _Opacity;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat1.xyz = vs_TEXCOORD3.xyz / u_xlat1.xxx;
    u_xlat1.x = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat4 = u_xlat1.z * 0.5 + 0.5;
    u_xlat4 = _ZBufferParams.z * u_xlat4 + _ZBufferParams.w;
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = (-u_xlat4) + u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _Depthpower;
    u_xlat1.x = min(abs(u_xlat1.x), 1.0);
    u_xlat1.x = u_xlat9 * u_xlat1.x + (-u_xlat9);
    u_xlat1.w = _Usedepth * u_xlat1.x + u_xlat9;
    u_xlat2.xyz = vec3(vec3(_Emission, _Emission, _Emission)) * _Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat16_0.xyz + (-u_xlat2.xyz);
    u_xlat1.xyz = vec3(_Useblack) * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _Useblack;
uniform 	float _Emission;
uniform 	vec4 _Color;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
float u_xlat4;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat6.xy = floor(u_xlat0.xy);
    u_xlat6.x = u_xlat6.y * 57.0 + u_xlat6.x;
    u_xlat1.xyz = u_xlat6.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat0.z = u_xlat6.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat9 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat7.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat7.xy;
    u_xlat9 = u_xlat0.x * u_xlat9 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat6.x = (-u_xlat0.x) + u_xlat9;
    u_xlat0.x = u_xlat0.y * u_xlat6.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat3.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat3.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat6.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat6.xy * u_xlat6.xy;
    u_xlat3.xy = (-u_xlat6.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat3.xy = u_xlat3.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat9 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat9 = u_xlat3.x * u_xlat9 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat3.x * u_xlat1.x + u_xlat0.x;
    u_xlat3.x = (-u_xlat0.x) + u_xlat9;
    u_xlat0.x = u_xlat3.y * u_xlat3.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat9 = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat9 = u_xlat9 * _Opacity;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat1.xyz = vs_TEXCOORD3.xyz / u_xlat1.xxx;
    u_xlat1.x = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat4 = u_xlat1.z * 0.5 + 0.5;
    u_xlat4 = _ZBufferParams.z * u_xlat4 + _ZBufferParams.w;
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = (-u_xlat4) + u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _Depthpower;
    u_xlat1.x = min(abs(u_xlat1.x), 1.0);
    u_xlat1.x = u_xlat9 * u_xlat1.x + (-u_xlat9);
    u_xlat1.w = _Usedepth * u_xlat1.x + u_xlat9;
    u_xlat2.xyz = vec3(vec3(_Emission, _Emission, _Emission)) * _Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat16_0.xyz + (-u_xlat2.xyz);
    u_xlat1.xyz = vec3(_Useblack) * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _Useblack;
uniform 	float _Emission;
uniform 	vec4 _Color;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
float u_xlat4;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat6.xy = floor(u_xlat0.xy);
    u_xlat6.x = u_xlat6.y * 57.0 + u_xlat6.x;
    u_xlat1.xyz = u_xlat6.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat0.z = u_xlat6.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat9 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat7.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat7.xy;
    u_xlat9 = u_xlat0.x * u_xlat9 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat6.x = (-u_xlat0.x) + u_xlat9;
    u_xlat0.x = u_xlat0.y * u_xlat6.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat3.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat3.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat6.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat6.xy * u_xlat6.xy;
    u_xlat3.xy = (-u_xlat6.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat3.xy = u_xlat3.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat9 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat9 = u_xlat3.x * u_xlat9 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat3.x * u_xlat1.x + u_xlat0.x;
    u_xlat3.x = (-u_xlat0.x) + u_xlat9;
    u_xlat0.x = u_xlat3.y * u_xlat3.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat9 = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat9 = u_xlat9 * _Opacity;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat1.xyz = vs_TEXCOORD3.xyz / u_xlat1.xxx;
    u_xlat1.x = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat4 = u_xlat1.z * 0.5 + 0.5;
    u_xlat4 = _ZBufferParams.z * u_xlat4 + _ZBufferParams.w;
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = (-u_xlat4) + u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _Depthpower;
    u_xlat1.x = min(abs(u_xlat1.x), 1.0);
    u_xlat1.x = u_xlat9 * u_xlat1.x + (-u_xlat9);
    u_xlat1.w = _Usedepth * u_xlat1.x + u_xlat9;
    u_xlat2.xyz = vec3(vec3(_Emission, _Emission, _Emission)) * _Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat16_0.xyz + (-u_xlat2.xyz);
    u_xlat1.xyz = vec3(_Useblack) * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "DIRECTIONAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "DIRECTIONAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "DIRECTIONAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
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
uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_0 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_0);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _Useblack;
uniform 	float _Emission;
uniform 	vec4 _Color;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
float u_xlat4;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat6.xy = floor(u_xlat0.xy);
    u_xlat6.x = u_xlat6.y * 57.0 + u_xlat6.x;
    u_xlat1.xyz = u_xlat6.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat0.z = u_xlat6.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat9 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat7.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat7.xy;
    u_xlat9 = u_xlat0.x * u_xlat9 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat6.x = (-u_xlat0.x) + u_xlat9;
    u_xlat0.x = u_xlat0.y * u_xlat6.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat3.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat3.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat6.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat6.xy * u_xlat6.xy;
    u_xlat3.xy = (-u_xlat6.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat3.xy = u_xlat3.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat9 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat9 = u_xlat3.x * u_xlat9 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat3.x * u_xlat1.x + u_xlat0.x;
    u_xlat3.x = (-u_xlat0.x) + u_xlat9;
    u_xlat0.x = u_xlat3.y * u_xlat3.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat9 = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat9 = u_xlat9 * _Opacity;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat1.xyz = vs_TEXCOORD3.xyz / u_xlat1.xxx;
    u_xlat1.x = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat4 = u_xlat1.z * 0.5 + 0.5;
    u_xlat4 = _ZBufferParams.z * u_xlat4 + _ZBufferParams.w;
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = (-u_xlat4) + u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _Depthpower;
    u_xlat1.x = min(abs(u_xlat1.x), 1.0);
    u_xlat1.x = u_xlat9 * u_xlat1.x + (-u_xlat9);
    u_xlat1.w = _Usedepth * u_xlat1.x + u_xlat9;
    u_xlat2.xyz = vec3(vec3(_Emission, _Emission, _Emission)) * _Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat16_0.xyz + (-u_xlat2.xyz);
    u_xlat1.xyz = vec3(_Useblack) * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
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
uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_0 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_0);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _Useblack;
uniform 	float _Emission;
uniform 	vec4 _Color;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
float u_xlat4;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat6.xy = floor(u_xlat0.xy);
    u_xlat6.x = u_xlat6.y * 57.0 + u_xlat6.x;
    u_xlat1.xyz = u_xlat6.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat0.z = u_xlat6.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat9 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat7.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat7.xy;
    u_xlat9 = u_xlat0.x * u_xlat9 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat6.x = (-u_xlat0.x) + u_xlat9;
    u_xlat0.x = u_xlat0.y * u_xlat6.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat3.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat3.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat6.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat6.xy * u_xlat6.xy;
    u_xlat3.xy = (-u_xlat6.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat3.xy = u_xlat3.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat9 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat9 = u_xlat3.x * u_xlat9 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat3.x * u_xlat1.x + u_xlat0.x;
    u_xlat3.x = (-u_xlat0.x) + u_xlat9;
    u_xlat0.x = u_xlat3.y * u_xlat3.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat9 = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat9 = u_xlat9 * _Opacity;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat1.xyz = vs_TEXCOORD3.xyz / u_xlat1.xxx;
    u_xlat1.x = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat4 = u_xlat1.z * 0.5 + 0.5;
    u_xlat4 = _ZBufferParams.z * u_xlat4 + _ZBufferParams.w;
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = (-u_xlat4) + u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _Depthpower;
    u_xlat1.x = min(abs(u_xlat1.x), 1.0);
    u_xlat1.x = u_xlat9 * u_xlat1.x + (-u_xlat9);
    u_xlat1.w = _Usedepth * u_xlat1.x + u_xlat9;
    u_xlat2.xyz = vec3(vec3(_Emission, _Emission, _Emission)) * _Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat16_0.xyz + (-u_xlat2.xyz);
    u_xlat1.xyz = vec3(_Useblack) * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
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
uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_0 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_0);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _Useblack;
uniform 	float _Emission;
uniform 	vec4 _Color;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
float u_xlat4;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat6.xy = floor(u_xlat0.xy);
    u_xlat6.x = u_xlat6.y * 57.0 + u_xlat6.x;
    u_xlat1.xyz = u_xlat6.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat0.z = u_xlat6.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat9 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat7.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat7.xy;
    u_xlat9 = u_xlat0.x * u_xlat9 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat6.x = (-u_xlat0.x) + u_xlat9;
    u_xlat0.x = u_xlat0.y * u_xlat6.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat3.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat3.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat6.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat6.xy * u_xlat6.xy;
    u_xlat3.xy = (-u_xlat6.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat3.xy = u_xlat3.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat9 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat9 = u_xlat3.x * u_xlat9 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat3.x * u_xlat1.x + u_xlat0.x;
    u_xlat3.x = (-u_xlat0.x) + u_xlat9;
    u_xlat0.x = u_xlat3.y * u_xlat3.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat9 = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat9 = u_xlat9 * _Opacity;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat1.xyz = vs_TEXCOORD3.xyz / u_xlat1.xxx;
    u_xlat1.x = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat4 = u_xlat1.z * 0.5 + 0.5;
    u_xlat4 = _ZBufferParams.z * u_xlat4 + _ZBufferParams.w;
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = (-u_xlat4) + u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _Depthpower;
    u_xlat1.x = min(abs(u_xlat1.x), 1.0);
    u_xlat1.x = u_xlat9 * u_xlat1.x + (-u_xlat9);
    u_xlat1.w = _Usedepth * u_xlat1.x + u_xlat9;
    u_xlat2.xyz = vec3(vec3(_Emission, _Emission, _Emission)) * _Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat16_0.xyz + (-u_xlat2.xyz);
    u_xlat1.xyz = vec3(_Useblack) * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
float u_xlat18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    vs_TEXCOORD1.xyz = u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat18 = u_xlat1.y * _ProjectionParams.x;
    u_xlat3.w = u_xlat18 * 0.5;
    u_xlat3.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat3.zz + u_xlat3.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat16_4.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_4.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_4.x);
    u_xlat16_1 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat16_5.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_5.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_5.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_4.xyz = unity_SHC.xyz * u_xlat16_4.xxx + u_xlat16_5.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_5.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_5.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_5.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat16_4.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat2.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat2.zzzz + u_xlat4;
    u_xlat1 = u_xlat5 * u_xlat5 + u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat1;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _Useblack;
uniform 	float _Emission;
uniform 	vec4 _Color;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
float u_xlat4;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat6.xy = floor(u_xlat0.xy);
    u_xlat6.x = u_xlat6.y * 57.0 + u_xlat6.x;
    u_xlat1.xyz = u_xlat6.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat0.z = u_xlat6.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat9 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat7.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat7.xy;
    u_xlat9 = u_xlat0.x * u_xlat9 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat6.x = (-u_xlat0.x) + u_xlat9;
    u_xlat0.x = u_xlat0.y * u_xlat6.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat3.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat3.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat6.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat6.xy * u_xlat6.xy;
    u_xlat3.xy = (-u_xlat6.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat3.xy = u_xlat3.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat9 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat9 = u_xlat3.x * u_xlat9 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat3.x * u_xlat1.x + u_xlat0.x;
    u_xlat3.x = (-u_xlat0.x) + u_xlat9;
    u_xlat0.x = u_xlat3.y * u_xlat3.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat9 = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat9 = u_xlat9 * _Opacity;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat1.xyz = vs_TEXCOORD3.xyz / u_xlat1.xxx;
    u_xlat1.x = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat4 = u_xlat1.z * 0.5 + 0.5;
    u_xlat4 = _ZBufferParams.z * u_xlat4 + _ZBufferParams.w;
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = (-u_xlat4) + u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _Depthpower;
    u_xlat1.x = min(abs(u_xlat1.x), 1.0);
    u_xlat1.x = u_xlat9 * u_xlat1.x + (-u_xlat9);
    u_xlat1.w = _Usedepth * u_xlat1.x + u_xlat9;
    u_xlat2.xyz = vec3(vec3(_Emission, _Emission, _Emission)) * _Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat16_0.xyz + (-u_xlat2.xyz);
    u_xlat1.xyz = vec3(_Useblack) * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
float u_xlat18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    vs_TEXCOORD1.xyz = u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat18 = u_xlat1.y * _ProjectionParams.x;
    u_xlat3.w = u_xlat18 * 0.5;
    u_xlat3.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat3.zz + u_xlat3.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat16_4.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_4.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_4.x);
    u_xlat16_1 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat16_5.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_5.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_5.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_4.xyz = unity_SHC.xyz * u_xlat16_4.xxx + u_xlat16_5.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_5.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_5.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_5.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat16_4.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat2.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat2.zzzz + u_xlat4;
    u_xlat1 = u_xlat5 * u_xlat5 + u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat1;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _Useblack;
uniform 	float _Emission;
uniform 	vec4 _Color;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
float u_xlat4;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat6.xy = floor(u_xlat0.xy);
    u_xlat6.x = u_xlat6.y * 57.0 + u_xlat6.x;
    u_xlat1.xyz = u_xlat6.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat0.z = u_xlat6.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat9 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat7.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat7.xy;
    u_xlat9 = u_xlat0.x * u_xlat9 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat6.x = (-u_xlat0.x) + u_xlat9;
    u_xlat0.x = u_xlat0.y * u_xlat6.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat3.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat3.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat6.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat6.xy * u_xlat6.xy;
    u_xlat3.xy = (-u_xlat6.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat3.xy = u_xlat3.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat9 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat9 = u_xlat3.x * u_xlat9 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat3.x * u_xlat1.x + u_xlat0.x;
    u_xlat3.x = (-u_xlat0.x) + u_xlat9;
    u_xlat0.x = u_xlat3.y * u_xlat3.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat9 = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat9 = u_xlat9 * _Opacity;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat1.xyz = vs_TEXCOORD3.xyz / u_xlat1.xxx;
    u_xlat1.x = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat4 = u_xlat1.z * 0.5 + 0.5;
    u_xlat4 = _ZBufferParams.z * u_xlat4 + _ZBufferParams.w;
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = (-u_xlat4) + u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _Depthpower;
    u_xlat1.x = min(abs(u_xlat1.x), 1.0);
    u_xlat1.x = u_xlat9 * u_xlat1.x + (-u_xlat9);
    u_xlat1.w = _Usedepth * u_xlat1.x + u_xlat9;
    u_xlat2.xyz = vec3(vec3(_Emission, _Emission, _Emission)) * _Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat16_0.xyz + (-u_xlat2.xyz);
    u_xlat1.xyz = vec3(_Useblack) * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
float u_xlat18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    vs_TEXCOORD1.xyz = u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat18 = u_xlat1.y * _ProjectionParams.x;
    u_xlat3.w = u_xlat18 * 0.5;
    u_xlat3.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat3.zz + u_xlat3.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat16_4.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_4.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_4.x);
    u_xlat16_1 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat16_5.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_5.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_5.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_4.xyz = unity_SHC.xyz * u_xlat16_4.xxx + u_xlat16_5.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_5.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_5.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_5.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat16_4.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat2.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat2.zzzz + u_xlat4;
    u_xlat1 = u_xlat5 * u_xlat5 + u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat1;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _Useblack;
uniform 	float _Emission;
uniform 	vec4 _Color;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
float u_xlat4;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat6.xy = floor(u_xlat0.xy);
    u_xlat6.x = u_xlat6.y * 57.0 + u_xlat6.x;
    u_xlat1.xyz = u_xlat6.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat0.z = u_xlat6.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat9 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat7.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat7.xy;
    u_xlat9 = u_xlat0.x * u_xlat9 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat6.x = (-u_xlat0.x) + u_xlat9;
    u_xlat0.x = u_xlat0.y * u_xlat6.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat3.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat3.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat6.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat6.xy * u_xlat6.xy;
    u_xlat3.xy = (-u_xlat6.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat3.xy = u_xlat3.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat9 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat9 = u_xlat3.x * u_xlat9 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat3.x * u_xlat1.x + u_xlat0.x;
    u_xlat3.x = (-u_xlat0.x) + u_xlat9;
    u_xlat0.x = u_xlat3.y * u_xlat3.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat9 = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat9 = u_xlat9 * _Opacity;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat1.xyz = vs_TEXCOORD3.xyz / u_xlat1.xxx;
    u_xlat1.x = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat4 = u_xlat1.z * 0.5 + 0.5;
    u_xlat4 = _ZBufferParams.z * u_xlat4 + _ZBufferParams.w;
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = (-u_xlat4) + u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _Depthpower;
    u_xlat1.x = min(abs(u_xlat1.x), 1.0);
    u_xlat1.x = u_xlat9 * u_xlat1.x + (-u_xlat9);
    u_xlat1.w = _Usedepth * u_xlat1.x + u_xlat9;
    u_xlat2.xyz = vec3(vec3(_Emission, _Emission, _Emission)) * _Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat16_0.xyz + (-u_xlat2.xyz);
    u_xlat1.xyz = vec3(_Useblack) * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"// disassembly error Unable to decode SMOL-V shader
"
}
}
}
 Pass {
  Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "LIGHTMODE" = "FORWARDADD" "PreviewType" = "Plane" "QUEUE" = "Transparent+0" "RenderType" = "Transparent" }
  Blend SrcAlpha One, SrcAlpha One
  ColorMask RGB 0
  ZWrite Off
  GpuProgramID 119242
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat11;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat11 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat11 = inversesqrt(u_xlat11);
    vs_TEXCOORD1.xyz = vec3(u_xlat11) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat4.xy = floor(u_xlat0.xy);
    u_xlat4.x = u_xlat4.y * 57.0 + u_xlat4.x;
    u_xlat1.xyz = u_xlat4.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat0.z = u_xlat4.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat5.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat5.xy;
    u_xlat6 = u_xlat0.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat4.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat0.y * u_xlat4.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat2.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat2.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat4.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat2.xy = (-u_xlat4.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat2.xy = u_xlat2.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat6 = u_xlat2.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat2.x * u_xlat1.x + u_xlat0.x;
    u_xlat2.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat2.y * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _Opacity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat2.xyz = vs_TEXCOORD3.xyz / u_xlat2.xxx;
    u_xlat2.x = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat4.x = u_xlat2.z * 0.5 + 0.5;
    u_xlat4.x = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) + u_xlat2.x;
    u_xlat2.x = u_xlat2.x / _Depthpower;
    u_xlat2.x = min(abs(u_xlat2.x), 1.0);
    u_xlat2.x = u_xlat0.x * u_xlat2.x + (-u_xlat0.x);
    u_xlat0.x = _Usedepth * u_xlat2.x + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat11;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat11 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat11 = inversesqrt(u_xlat11);
    vs_TEXCOORD1.xyz = vec3(u_xlat11) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat4.xy = floor(u_xlat0.xy);
    u_xlat4.x = u_xlat4.y * 57.0 + u_xlat4.x;
    u_xlat1.xyz = u_xlat4.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat0.z = u_xlat4.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat5.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat5.xy;
    u_xlat6 = u_xlat0.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat4.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat0.y * u_xlat4.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat2.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat2.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat4.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat2.xy = (-u_xlat4.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat2.xy = u_xlat2.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat6 = u_xlat2.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat2.x * u_xlat1.x + u_xlat0.x;
    u_xlat2.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat2.y * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _Opacity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat2.xyz = vs_TEXCOORD3.xyz / u_xlat2.xxx;
    u_xlat2.x = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat4.x = u_xlat2.z * 0.5 + 0.5;
    u_xlat4.x = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) + u_xlat2.x;
    u_xlat2.x = u_xlat2.x / _Depthpower;
    u_xlat2.x = min(abs(u_xlat2.x), 1.0);
    u_xlat2.x = u_xlat0.x * u_xlat2.x + (-u_xlat0.x);
    u_xlat0.x = _Usedepth * u_xlat2.x + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat11;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat11 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat11 = inversesqrt(u_xlat11);
    vs_TEXCOORD1.xyz = vec3(u_xlat11) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat4.xy = floor(u_xlat0.xy);
    u_xlat4.x = u_xlat4.y * 57.0 + u_xlat4.x;
    u_xlat1.xyz = u_xlat4.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat0.z = u_xlat4.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat5.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat5.xy;
    u_xlat6 = u_xlat0.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat4.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat0.y * u_xlat4.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat2.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat2.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat4.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat2.xy = (-u_xlat4.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat2.xy = u_xlat2.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat6 = u_xlat2.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat2.x * u_xlat1.x + u_xlat0.x;
    u_xlat2.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat2.y * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _Opacity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat2.xyz = vs_TEXCOORD3.xyz / u_xlat2.xxx;
    u_xlat2.x = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat4.x = u_xlat2.z * 0.5 + 0.5;
    u_xlat4.x = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) + u_xlat2.x;
    u_xlat2.x = u_xlat2.x / _Depthpower;
    u_xlat2.x = min(abs(u_xlat2.x), 1.0);
    u_xlat2.x = u_xlat0.x * u_xlat2.x + (-u_xlat0.x);
    u_xlat0.x = _Usedepth * u_xlat2.x + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "POINT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "POINT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "POINT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat4.xy = floor(u_xlat0.xy);
    u_xlat4.x = u_xlat4.y * 57.0 + u_xlat4.x;
    u_xlat1.xyz = u_xlat4.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat0.z = u_xlat4.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat5.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat5.xy;
    u_xlat6 = u_xlat0.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat4.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat0.y * u_xlat4.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat2.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat2.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat4.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat2.xy = (-u_xlat4.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat2.xy = u_xlat2.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat6 = u_xlat2.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat2.x * u_xlat1.x + u_xlat0.x;
    u_xlat2.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat2.y * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _Opacity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat2.xyz = vs_TEXCOORD3.xyz / u_xlat2.xxx;
    u_xlat2.x = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat4.x = u_xlat2.z * 0.5 + 0.5;
    u_xlat4.x = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) + u_xlat2.x;
    u_xlat2.x = u_xlat2.x / _Depthpower;
    u_xlat2.x = min(abs(u_xlat2.x), 1.0);
    u_xlat2.x = u_xlat0.x * u_xlat2.x + (-u_xlat0.x);
    u_xlat0.x = _Usedepth * u_xlat2.x + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat4.xy = floor(u_xlat0.xy);
    u_xlat4.x = u_xlat4.y * 57.0 + u_xlat4.x;
    u_xlat1.xyz = u_xlat4.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat0.z = u_xlat4.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat5.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat5.xy;
    u_xlat6 = u_xlat0.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat4.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat0.y * u_xlat4.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat2.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat2.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat4.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat2.xy = (-u_xlat4.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat2.xy = u_xlat2.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat6 = u_xlat2.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat2.x * u_xlat1.x + u_xlat0.x;
    u_xlat2.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat2.y * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _Opacity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat2.xyz = vs_TEXCOORD3.xyz / u_xlat2.xxx;
    u_xlat2.x = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat4.x = u_xlat2.z * 0.5 + 0.5;
    u_xlat4.x = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) + u_xlat2.x;
    u_xlat2.x = u_xlat2.x / _Depthpower;
    u_xlat2.x = min(abs(u_xlat2.x), 1.0);
    u_xlat2.x = u_xlat0.x * u_xlat2.x + (-u_xlat0.x);
    u_xlat0.x = _Usedepth * u_xlat2.x + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat4.xy = floor(u_xlat0.xy);
    u_xlat4.x = u_xlat4.y * 57.0 + u_xlat4.x;
    u_xlat1.xyz = u_xlat4.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat0.z = u_xlat4.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat5.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat5.xy;
    u_xlat6 = u_xlat0.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat4.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat0.y * u_xlat4.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat2.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat2.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat4.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat2.xy = (-u_xlat4.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat2.xy = u_xlat2.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat6 = u_xlat2.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat2.x * u_xlat1.x + u_xlat0.x;
    u_xlat2.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat2.y * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _Opacity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat2.xyz = vs_TEXCOORD3.xyz / u_xlat2.xxx;
    u_xlat2.x = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat4.x = u_xlat2.z * 0.5 + 0.5;
    u_xlat4.x = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) + u_xlat2.x;
    u_xlat2.x = u_xlat2.x / _Depthpower;
    u_xlat2.x = min(abs(u_xlat2.x), 1.0);
    u_xlat2.x = u_xlat0.x * u_xlat2.x + (-u_xlat0.x);
    u_xlat0.x = _Usedepth * u_xlat2.x + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "DIRECTIONAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "DIRECTIONAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "DIRECTIONAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SPOT" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat11;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat11 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat11 = inversesqrt(u_xlat11);
    vs_TEXCOORD1.xyz = vec3(u_xlat11) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD4 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat4.xy = floor(u_xlat0.xy);
    u_xlat4.x = u_xlat4.y * 57.0 + u_xlat4.x;
    u_xlat1.xyz = u_xlat4.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat0.z = u_xlat4.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat5.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat5.xy;
    u_xlat6 = u_xlat0.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat4.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat0.y * u_xlat4.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat2.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat2.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat4.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat2.xy = (-u_xlat4.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat2.xy = u_xlat2.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat6 = u_xlat2.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat2.x * u_xlat1.x + u_xlat0.x;
    u_xlat2.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat2.y * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _Opacity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat2.xyz = vs_TEXCOORD3.xyz / u_xlat2.xxx;
    u_xlat2.x = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat4.x = u_xlat2.z * 0.5 + 0.5;
    u_xlat4.x = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) + u_xlat2.x;
    u_xlat2.x = u_xlat2.x / _Depthpower;
    u_xlat2.x = min(abs(u_xlat2.x), 1.0);
    u_xlat2.x = u_xlat0.x * u_xlat2.x + (-u_xlat0.x);
    u_xlat0.x = _Usedepth * u_xlat2.x + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat11;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat11 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat11 = inversesqrt(u_xlat11);
    vs_TEXCOORD1.xyz = vec3(u_xlat11) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD4 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat4.xy = floor(u_xlat0.xy);
    u_xlat4.x = u_xlat4.y * 57.0 + u_xlat4.x;
    u_xlat1.xyz = u_xlat4.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat0.z = u_xlat4.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat5.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat5.xy;
    u_xlat6 = u_xlat0.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat4.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat0.y * u_xlat4.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat2.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat2.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat4.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat2.xy = (-u_xlat4.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat2.xy = u_xlat2.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat6 = u_xlat2.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat2.x * u_xlat1.x + u_xlat0.x;
    u_xlat2.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat2.y * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _Opacity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat2.xyz = vs_TEXCOORD3.xyz / u_xlat2.xxx;
    u_xlat2.x = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat4.x = u_xlat2.z * 0.5 + 0.5;
    u_xlat4.x = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) + u_xlat2.x;
    u_xlat2.x = u_xlat2.x / _Depthpower;
    u_xlat2.x = min(abs(u_xlat2.x), 1.0);
    u_xlat2.x = u_xlat0.x * u_xlat2.x + (-u_xlat0.x);
    u_xlat0.x = _Usedepth * u_xlat2.x + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat11;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat11 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat11 = inversesqrt(u_xlat11);
    vs_TEXCOORD1.xyz = vec3(u_xlat11) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD4 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat4.xy = floor(u_xlat0.xy);
    u_xlat4.x = u_xlat4.y * 57.0 + u_xlat4.x;
    u_xlat1.xyz = u_xlat4.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat0.z = u_xlat4.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat5.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat5.xy;
    u_xlat6 = u_xlat0.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat4.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat0.y * u_xlat4.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat2.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat2.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat4.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat2.xy = (-u_xlat4.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat2.xy = u_xlat2.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat6 = u_xlat2.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat2.x * u_xlat1.x + u_xlat0.x;
    u_xlat2.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat2.y * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _Opacity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat2.xyz = vs_TEXCOORD3.xyz / u_xlat2.xxx;
    u_xlat2.x = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat4.x = u_xlat2.z * 0.5 + 0.5;
    u_xlat4.x = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) + u_xlat2.x;
    u_xlat2.x = u_xlat2.x / _Depthpower;
    u_xlat2.x = min(abs(u_xlat2.x), 1.0);
    u_xlat2.x = u_xlat0.x * u_xlat2.x + (-u_xlat0.x);
    u_xlat0.x = _Usedepth * u_xlat2.x + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "SPOT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "SPOT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "SPOT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT_COOKIE" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat11;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat11 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat11 = inversesqrt(u_xlat11);
    vs_TEXCOORD1.xyz = vec3(u_xlat11) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat4.xy = floor(u_xlat0.xy);
    u_xlat4.x = u_xlat4.y * 57.0 + u_xlat4.x;
    u_xlat1.xyz = u_xlat4.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat0.z = u_xlat4.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat5.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat5.xy;
    u_xlat6 = u_xlat0.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat4.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat0.y * u_xlat4.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat2.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat2.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat4.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat2.xy = (-u_xlat4.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat2.xy = u_xlat2.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat6 = u_xlat2.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat2.x * u_xlat1.x + u_xlat0.x;
    u_xlat2.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat2.y * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _Opacity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat2.xyz = vs_TEXCOORD3.xyz / u_xlat2.xxx;
    u_xlat2.x = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat4.x = u_xlat2.z * 0.5 + 0.5;
    u_xlat4.x = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) + u_xlat2.x;
    u_xlat2.x = u_xlat2.x / _Depthpower;
    u_xlat2.x = min(abs(u_xlat2.x), 1.0);
    u_xlat2.x = u_xlat0.x * u_xlat2.x + (-u_xlat0.x);
    u_xlat0.x = _Usedepth * u_xlat2.x + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT_COOKIE" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat11;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat11 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat11 = inversesqrt(u_xlat11);
    vs_TEXCOORD1.xyz = vec3(u_xlat11) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat4.xy = floor(u_xlat0.xy);
    u_xlat4.x = u_xlat4.y * 57.0 + u_xlat4.x;
    u_xlat1.xyz = u_xlat4.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat0.z = u_xlat4.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat5.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat5.xy;
    u_xlat6 = u_xlat0.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat4.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat0.y * u_xlat4.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat2.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat2.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat4.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat2.xy = (-u_xlat4.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat2.xy = u_xlat2.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat6 = u_xlat2.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat2.x * u_xlat1.x + u_xlat0.x;
    u_xlat2.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat2.y * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _Opacity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat2.xyz = vs_TEXCOORD3.xyz / u_xlat2.xxx;
    u_xlat2.x = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat4.x = u_xlat2.z * 0.5 + 0.5;
    u_xlat4.x = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) + u_xlat2.x;
    u_xlat2.x = u_xlat2.x / _Depthpower;
    u_xlat2.x = min(abs(u_xlat2.x), 1.0);
    u_xlat2.x = u_xlat0.x * u_xlat2.x + (-u_xlat0.x);
    u_xlat0.x = _Usedepth * u_xlat2.x + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT_COOKIE" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat11;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat11 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat11 = inversesqrt(u_xlat11);
    vs_TEXCOORD1.xyz = vec3(u_xlat11) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat4.xy = floor(u_xlat0.xy);
    u_xlat4.x = u_xlat4.y * 57.0 + u_xlat4.x;
    u_xlat1.xyz = u_xlat4.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat0.z = u_xlat4.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat5.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat5.xy;
    u_xlat6 = u_xlat0.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat4.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat0.y * u_xlat4.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat2.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat2.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat4.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat2.xy = (-u_xlat4.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat2.xy = u_xlat2.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat6 = u_xlat2.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat2.x * u_xlat1.x + u_xlat0.x;
    u_xlat2.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat2.y * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _Opacity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat2.xyz = vs_TEXCOORD3.xyz / u_xlat2.xxx;
    u_xlat2.x = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat4.x = u_xlat2.z * 0.5 + 0.5;
    u_xlat4.x = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) + u_xlat2.x;
    u_xlat2.x = u_xlat2.x / _Depthpower;
    u_xlat2.x = min(abs(u_xlat2.x), 1.0);
    u_xlat2.x = u_xlat0.x * u_xlat2.x + (-u_xlat0.x);
    u_xlat0.x = _Usedepth * u_xlat2.x + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "POINT_COOKIE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "POINT_COOKIE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "POINT_COOKIE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat11;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat11 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat11 = inversesqrt(u_xlat11);
    vs_TEXCOORD1.xyz = vec3(u_xlat11) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat0.xy;
    vs_TEXCOORD4.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat0.ww + u_xlat0.xy;
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat4.xy = floor(u_xlat0.xy);
    u_xlat4.x = u_xlat4.y * 57.0 + u_xlat4.x;
    u_xlat1.xyz = u_xlat4.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat0.z = u_xlat4.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat5.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat5.xy;
    u_xlat6 = u_xlat0.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat4.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat0.y * u_xlat4.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat2.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat2.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat4.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat2.xy = (-u_xlat4.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat2.xy = u_xlat2.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat6 = u_xlat2.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat2.x * u_xlat1.x + u_xlat0.x;
    u_xlat2.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat2.y * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _Opacity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat2.xyz = vs_TEXCOORD3.xyz / u_xlat2.xxx;
    u_xlat2.x = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat4.x = u_xlat2.z * 0.5 + 0.5;
    u_xlat4.x = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) + u_xlat2.x;
    u_xlat2.x = u_xlat2.x / _Depthpower;
    u_xlat2.x = min(abs(u_xlat2.x), 1.0);
    u_xlat2.x = u_xlat0.x * u_xlat2.x + (-u_xlat0.x);
    u_xlat0.x = _Usedepth * u_xlat2.x + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat11;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat11 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat11 = inversesqrt(u_xlat11);
    vs_TEXCOORD1.xyz = vec3(u_xlat11) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat0.xy;
    vs_TEXCOORD4.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat0.ww + u_xlat0.xy;
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat4.xy = floor(u_xlat0.xy);
    u_xlat4.x = u_xlat4.y * 57.0 + u_xlat4.x;
    u_xlat1.xyz = u_xlat4.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat0.z = u_xlat4.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat5.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat5.xy;
    u_xlat6 = u_xlat0.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat4.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat0.y * u_xlat4.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat2.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat2.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat4.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat2.xy = (-u_xlat4.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat2.xy = u_xlat2.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat6 = u_xlat2.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat2.x * u_xlat1.x + u_xlat0.x;
    u_xlat2.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat2.y * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _Opacity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat2.xyz = vs_TEXCOORD3.xyz / u_xlat2.xxx;
    u_xlat2.x = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat4.x = u_xlat2.z * 0.5 + 0.5;
    u_xlat4.x = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) + u_xlat2.x;
    u_xlat2.x = u_xlat2.x / _Depthpower;
    u_xlat2.x = min(abs(u_xlat2.x), 1.0);
    u_xlat2.x = u_xlat0.x * u_xlat2.x + (-u_xlat0.x);
    u_xlat0.x = _Usedepth * u_xlat2.x + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _tex3coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat11;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex3coord_ST.xy + _tex3coord_ST.zw;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat11 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat11 = inversesqrt(u_xlat11);
    vs_TEXCOORD1.xyz = vec3(u_xlat11) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat0.xy;
    vs_TEXCOORD4.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat0.ww + u_xlat0.xy;
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _StartFrequency;
uniform 	float _Amplitude;
uniform 	float _Frequency;
uniform 	float _Usedepth;
uniform 	float _Opacity;
uniform 	float _Depthpower;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.200000003, 0.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(_StartFrequency);
    u_xlat4.xy = floor(u_xlat0.xy);
    u_xlat4.x = u_xlat4.y * 57.0 + u_xlat4.x;
    u_xlat1.xyz = u_xlat4.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat0.z = u_xlat4.x * 473.5;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat5.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat5.xy;
    u_xlat6 = u_xlat0.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat0.z;
    u_xlat4.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat0.y * u_xlat4.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat2.x = _Time.y * 0.5;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xx + u_xlat2.xx;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.zz;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Frequency, _Frequency));
    u_xlat4.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y * 57.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat2.xy = (-u_xlat4.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat2.xy = u_xlat2.xy * u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.xxx + vec3(1.0, 57.0, 58.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 473.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(473.5, 473.5, 473.5);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
    u_xlat6 = u_xlat2.x * u_xlat6 + u_xlat1.y;
    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat2.x * u_xlat1.x + u_xlat0.x;
    u_xlat2.x = (-u_xlat0.x) + u_xlat6;
    u_xlat0.x = u_xlat2.y * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Amplitude;
    u_xlat0.xy = u_xlat0.xx * vec2(0.200000003, 0.200000003) + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _Opacity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat2.xyz = vs_TEXCOORD3.xyz / u_xlat2.xxx;
    u_xlat2.x = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat4.x = u_xlat2.z * 0.5 + 0.5;
    u_xlat4.x = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) + u_xlat2.x;
    u_xlat2.x = u_xlat2.x / _Depthpower;
    u_xlat2.x = min(abs(u_xlat2.x), 1.0);
    u_xlat2.x = u_xlat0.x * u_xlat2.x + (-u_xlat0.x);
    u_xlat0.x = _Usedepth * u_xlat2.x + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
}
}
}
}