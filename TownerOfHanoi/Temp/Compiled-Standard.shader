// Compiled shader for Android

//////////////////////////////////////////////////////////////////////////
// 
// NOTE: This is *not* a valid shader file, the contents are provided just
// for information and for debugging purposes only.
// 
//////////////////////////////////////////////////////////////////////////
// Skipping shader variants that would not be included into build of current scene.

Shader "Standard" {
Properties {
 _Color ("Color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _MainTex ("Albedo", 2D) = "white" { }
 _Cutoff ("Alpha Cutoff", Range(0.000000,1.000000)) = 0.500000
 _Glossiness ("Smoothness", Range(0.000000,1.000000)) = 0.500000
 _GlossMapScale ("Smoothness Scale", Range(0.000000,1.000000)) = 1.000000
[Enum(Metallic Alpha,0,Albedo Alpha,1)]  _SmoothnessTextureChannel ("Smoothness texture channel", Float) = 0.000000
[Gamma]  _Metallic ("Metallic", Range(0.000000,1.000000)) = 0.000000
 _MetallicGlossMap ("Metallic", 2D) = "white" { }
[ToggleOff]  _SpecularHighlights ("Specular Highlights", Float) = 1.000000
[ToggleOff]  _GlossyReflections ("Glossy Reflections", Float) = 1.000000
 _BumpScale ("Scale", Float) = 1.000000
 _BumpMap ("Normal Map", 2D) = "bump" { }
 _Parallax ("Height Scale", Range(0.005000,0.080000)) = 0.020000
 _ParallaxMap ("Height Map", 2D) = "black" { }
 _OcclusionStrength ("Strength", Range(0.000000,1.000000)) = 1.000000
 _OcclusionMap ("Occlusion", 2D) = "white" { }
 _EmissionColor ("Color", Color) = (0.000000,0.000000,0.000000,1.000000)
 _EmissionMap ("Emission", 2D) = "white" { }
 _DetailMask ("Detail Mask", 2D) = "white" { }
 _DetailAlbedoMap ("Detail Albedo x2", 2D) = "grey" { }
 _DetailNormalMapScale ("Scale", Float) = 1.000000
 _DetailNormalMap ("Normal Map", 2D) = "bump" { }
[Enum(UV0,0,UV1,1)]  _UVSec ("UV Set for secondary textures", Float) = 0.000000
[HideInInspector]  _Mode ("__mode", Float) = 0.000000
[HideInInspector]  _SrcBlend ("__src", Float) = 1.000000
[HideInInspector]  _DstBlend ("__dst", Float) = 0.000000
[HideInInspector]  _ZWrite ("__zw", Float) = 1.000000
}
SubShader { 
 LOD 300
 Tags { "RenderType"="Opaque" "PerformanceChecks"="False" }


 // Stats for Vertex shader:
 //         gles: 76 avg math (38..104), 4 avg texture (3..6)
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="FORWARDBASE" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite [_ZWrite]
  Blend [_SrcBlend] [_DstBlend]
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 38 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  normalWorld_4 = tmpvar_17;
  tmpvar_8.xyz = normalWorld_4;
  tmpvar_6.xyz = eyeVec_5;
  mediump vec4 ambientOrLightmapUV_18;
  ambientOrLightmapUV_18.w = 0.0;
  mediump vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = normalWorld_4;
  mediump vec3 res_20;
  mediump vec3 x_21;
  x_21.x = dot (unity_SHAr, tmpvar_19);
  x_21.y = dot (unity_SHAg, tmpvar_19);
  x_21.z = dot (unity_SHAb, tmpvar_19);
  mediump vec3 x1_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normalWorld_4.xyzz * normalWorld_4.yzzx);
  x1_22.x = dot (unity_SHBr, tmpvar_23);
  x1_22.y = dot (unity_SHBg, tmpvar_23);
  x1_22.z = dot (unity_SHBb, tmpvar_23);
  res_20 = (x_21 + (x1_22 + (unity_SHC.xyz * 
    ((normalWorld_4.x * normalWorld_4.x) - (normalWorld_4.y * normalWorld_4.y))
  )));
  mediump vec3 tmpvar_24;
  tmpvar_24 = max (((1.055 * 
    pow (max (res_20, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_20 = tmpvar_24;
  ambientOrLightmapUV_18.xyz = max (vec3(0.0, 0.0, 0.0), tmpvar_24);
  tmpvar_7.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  mediump float x_25;
  x_25 = (1.0 - clamp (dot (normalWorld_4, 
    -(eyeVec_5)
  ), 0.0, 1.0));
  tmpvar_8.w = ((x_25 * x_25) * (x_25 * x_25));
  tmpvar_6.w = clamp ((_Glossiness + (1.0 - 
    (0.7790837 - (_Metallic * 0.7790837))
  )), 0.0, 1.0);
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = ambientOrLightmapUV_18;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump float rl_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic));
  tmpvar_4 = (tmpvar_3 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_6;
  tmpvar_6 = _LightColor0.xyz;
  mediump float occ_7;
  lowp float tmpvar_8;
  tmpvar_8 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_7 = tmpvar_8;
  rl_1 = dot (xlv_TEXCOORD4.yzw, _WorldSpaceLightPos0.xyz);
  mediump float occlusion_9;
  occlusion_9 = ((1.0 - _OcclusionStrength) + (occ_7 * _OcclusionStrength));
  highp vec4 tmpvar_10;
  tmpvar_10 = unity_SpecCube0_HDR;
  mediump float tmpvar_11;
  tmpvar_11 = (1.0 - _Glossiness);
  mediump vec4 hdr_12;
  hdr_12 = tmpvar_10;
  mediump vec4 tmpvar_13;
  tmpvar_13.xyz = xlv_TEXCOORD4.yzw;
  tmpvar_13.w = ((tmpvar_11 * (1.7 - 
    (0.7 * tmpvar_11)
  )) * 6.0);
  lowp vec4 tmpvar_14;
  tmpvar_14 = impl_low_textureCubeLodEXT (unity_SpecCube0, xlv_TEXCOORD4.yzw, tmpvar_13.w);
  mediump vec4 tmpvar_15;
  tmpvar_15 = tmpvar_14;
  mediump vec2 tmpvar_16;
  tmpvar_16.x = ((rl_1 * rl_1) * (rl_1 * rl_1));
  tmpvar_16.y = tmpvar_11;
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (unity_NHxRoughness, tmpvar_16);
  mediump vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = (((
    (xlv_TEXCOORD2.xyz * occlusion_9)
   * tmpvar_4) + (
    (((hdr_12.x * (
      (hdr_12.w * (tmpvar_15.w - 1.0))
     + 1.0)) * tmpvar_15.xyz) * occlusion_9)
   * 
    mix (tmpvar_5, xlv_TEXCOORD1.www, xlv_TEXCOORD5.www)
  )) + ((tmpvar_4 + 
    ((tmpvar_17.w * 16.0) * tmpvar_5)
  ) * (tmpvar_6 * 
    clamp (dot (xlv_TEXCOORD5.xyz, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  )));
  mediump vec4 xlat_varoutput_19;
  xlat_varoutput_19.xyz = tmpvar_18.xyz;
  xlat_varoutput_19.w = 1.0;
  gl_FragData[0] = xlat_varoutput_19;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 85 math, 3 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  mediump vec3 x1_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_20.x = dot (unity_SHBr, tmpvar_21);
  x1_20.y = dot (unity_SHBg, tmpvar_21);
  x1_20.z = dot (unity_SHBb, tmpvar_21);
  ambientOrLightmapUV_19.xyz = (x1_20 + (unity_SHC.xyz * (
    (normalWorld_18.x * normalWorld_18.x)
   - 
    (normalWorld_18.y * normalWorld_18.y)
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic));
  mediump float tmpvar_6;
  tmpvar_6 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_4 = (tmpvar_3 * tmpvar_6);
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_9;
  tmpvar_9 = _LightColor0.xyz;
  mediump float occ_10;
  lowp float tmpvar_11;
  tmpvar_11 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_10 = tmpvar_11;
  mediump float occlusion_12;
  occlusion_12 = ((1.0 - _OcclusionStrength) + (occ_10 * _OcclusionStrength));
  highp vec4 tmpvar_13;
  tmpvar_13 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_7;
  mediump vec3 x_15;
  x_15.x = dot (unity_SHAr, tmpvar_14);
  x_15.y = dot (unity_SHAg, tmpvar_14);
  x_15.z = dot (unity_SHAb, tmpvar_14);
  mediump vec3 tmpvar_16;
  mediump float tmpvar_17;
  tmpvar_17 = (1.0 - _Glossiness);
  tmpvar_16 = (tmpvar_8 - (2.0 * (
    dot (tmpvar_7, tmpvar_8)
   * tmpvar_7)));
  mediump vec4 hdr_18;
  hdr_18 = tmpvar_13;
  mediump vec4 tmpvar_19;
  tmpvar_19.xyz = tmpvar_16;
  tmpvar_19.w = ((tmpvar_17 * (1.7 - 
    (0.7 * tmpvar_17)
  )) * 6.0);
  lowp vec4 tmpvar_20;
  tmpvar_20 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_16, tmpvar_19.w);
  mediump vec4 tmpvar_21;
  tmpvar_21 = tmpvar_20;
  mediump vec3 viewDir_22;
  viewDir_22 = -(tmpvar_8);
  mediump float specularTerm_23;
  mediump vec3 tmpvar_24;
  mediump vec3 inVec_25;
  inVec_25 = (_WorldSpaceLightPos0.xyz + viewDir_22);
  tmpvar_24 = (inVec_25 * inversesqrt(max (0.001, 
    dot (inVec_25, inVec_25)
  )));
  mediump float tmpvar_26;
  tmpvar_26 = clamp (dot (tmpvar_7, tmpvar_24), 0.0, 1.0);
  mediump float tmpvar_27;
  tmpvar_27 = (tmpvar_17 * tmpvar_17);
  specularTerm_23 = ((tmpvar_27 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_24), 0.0, 1.0)) * (1.5 + tmpvar_27))
   * 
    (((tmpvar_26 * tmpvar_26) * ((tmpvar_27 * tmpvar_27) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_28;
  tmpvar_28 = clamp (specularTerm_23, 0.0, 100.0);
  specularTerm_23 = tmpvar_28;
  mediump float x_29;
  x_29 = (1.0 - clamp (dot (tmpvar_7, viewDir_22), 0.0, 1.0));
  mediump vec3 tmpvar_30;
  tmpvar_30 = (((
    ((tmpvar_4 + (tmpvar_28 * tmpvar_5)) * tmpvar_9)
   * 
    clamp (dot (tmpvar_7, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_15)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_12)
   * tmpvar_4)) + ((
    (1.0 - ((tmpvar_27 * tmpvar_17) * 0.28))
   * 
    (((hdr_18.x * (
      (hdr_18.w * (tmpvar_21.w - 1.0))
     + 1.0)) * tmpvar_21.xyz) * occlusion_12)
  ) * mix (tmpvar_5, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_6)), 0.0, 1.0)
  ), vec3(
    ((x_29 * x_29) * (x_29 * x_29))
  ))));
  mediump vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = tmpvar_30;
  c_1.w = tmpvar_31.w;
  c_1.xyz = tmpvar_30;
  mediump vec4 xlat_varoutput_32;
  xlat_varoutput_32.xyz = c_1.xyz;
  xlat_varoutput_32.w = 1.0;
  gl_FragData[0] = xlat_varoutput_32;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 85 math, 3 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  mediump vec3 x1_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_20.x = dot (unity_SHBr, tmpvar_21);
  x1_20.y = dot (unity_SHBg, tmpvar_21);
  x1_20.z = dot (unity_SHBb, tmpvar_21);
  ambientOrLightmapUV_19.xyz = (x1_20 + (unity_SHC.xyz * (
    (normalWorld_18.x * normalWorld_18.x)
   - 
    (normalWorld_18.y * normalWorld_18.y)
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic));
  mediump float tmpvar_6;
  tmpvar_6 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_4 = (tmpvar_3 * tmpvar_6);
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_9;
  tmpvar_9 = _LightColor0.xyz;
  mediump float occ_10;
  lowp float tmpvar_11;
  tmpvar_11 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_10 = tmpvar_11;
  mediump float occlusion_12;
  occlusion_12 = ((1.0 - _OcclusionStrength) + (occ_10 * _OcclusionStrength));
  highp vec4 tmpvar_13;
  tmpvar_13 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_7;
  mediump vec3 x_15;
  x_15.x = dot (unity_SHAr, tmpvar_14);
  x_15.y = dot (unity_SHAg, tmpvar_14);
  x_15.z = dot (unity_SHAb, tmpvar_14);
  mediump vec3 tmpvar_16;
  mediump float tmpvar_17;
  tmpvar_17 = (1.0 - _Glossiness);
  tmpvar_16 = (tmpvar_8 - (2.0 * (
    dot (tmpvar_7, tmpvar_8)
   * tmpvar_7)));
  mediump vec4 hdr_18;
  hdr_18 = tmpvar_13;
  mediump vec4 tmpvar_19;
  tmpvar_19.xyz = tmpvar_16;
  tmpvar_19.w = ((tmpvar_17 * (1.7 - 
    (0.7 * tmpvar_17)
  )) * 6.0);
  lowp vec4 tmpvar_20;
  tmpvar_20 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_16, tmpvar_19.w);
  mediump vec4 tmpvar_21;
  tmpvar_21 = tmpvar_20;
  mediump vec3 viewDir_22;
  viewDir_22 = -(tmpvar_8);
  mediump float specularTerm_23;
  mediump vec3 tmpvar_24;
  mediump vec3 inVec_25;
  inVec_25 = (_WorldSpaceLightPos0.xyz + viewDir_22);
  tmpvar_24 = (inVec_25 * inversesqrt(max (0.001, 
    dot (inVec_25, inVec_25)
  )));
  mediump float tmpvar_26;
  tmpvar_26 = clamp (dot (tmpvar_7, tmpvar_24), 0.0, 1.0);
  mediump float tmpvar_27;
  tmpvar_27 = (tmpvar_17 * tmpvar_17);
  specularTerm_23 = ((tmpvar_27 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_24), 0.0, 1.0)) * (1.5 + tmpvar_27))
   * 
    (((tmpvar_26 * tmpvar_26) * ((tmpvar_27 * tmpvar_27) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_28;
  tmpvar_28 = clamp (specularTerm_23, 0.0, 100.0);
  specularTerm_23 = tmpvar_28;
  mediump float x_29;
  x_29 = (1.0 - clamp (dot (tmpvar_7, viewDir_22), 0.0, 1.0));
  mediump vec3 tmpvar_30;
  tmpvar_30 = (((
    ((tmpvar_4 + (tmpvar_28 * tmpvar_5)) * tmpvar_9)
   * 
    clamp (dot (tmpvar_7, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_15)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_12)
   * tmpvar_4)) + ((
    (1.0 - ((tmpvar_27 * tmpvar_17) * 0.28))
   * 
    (((hdr_18.x * (
      (hdr_18.w * (tmpvar_21.w - 1.0))
     + 1.0)) * tmpvar_21.xyz) * occlusion_12)
  ) * mix (tmpvar_5, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_6)), 0.0, 1.0)
  ), vec3(
    ((x_29 * x_29) * (x_29 * x_29))
  ))));
  mediump vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = tmpvar_30;
  c_1.w = tmpvar_31.w;
  c_1.xyz = tmpvar_30;
  mediump vec4 xlat_varoutput_32;
  xlat_varoutput_32.xyz = c_1.xyz;
  xlat_varoutput_32.w = 1.0;
  gl_FragData[0] = xlat_varoutput_32;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 42 math, 5 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  normalWorld_4 = tmpvar_17;
  tmpvar_8.xyz = normalWorld_4;
  tmpvar_6.xyz = eyeVec_5;
  mediump vec4 ambientOrLightmapUV_18;
  ambientOrLightmapUV_18.w = 0.0;
  mediump vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = normalWorld_4;
  mediump vec3 res_20;
  mediump vec3 x_21;
  x_21.x = dot (unity_SHAr, tmpvar_19);
  x_21.y = dot (unity_SHAg, tmpvar_19);
  x_21.z = dot (unity_SHAb, tmpvar_19);
  mediump vec3 x1_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normalWorld_4.xyzz * normalWorld_4.yzzx);
  x1_22.x = dot (unity_SHBr, tmpvar_23);
  x1_22.y = dot (unity_SHBg, tmpvar_23);
  x1_22.z = dot (unity_SHBb, tmpvar_23);
  res_20 = (x_21 + (x1_22 + (unity_SHC.xyz * 
    ((normalWorld_4.x * normalWorld_4.x) - (normalWorld_4.y * normalWorld_4.y))
  )));
  mediump vec3 tmpvar_24;
  tmpvar_24 = max (((1.055 * 
    pow (max (res_20, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_20 = tmpvar_24;
  ambientOrLightmapUV_18.xyz = max (vec3(0.0, 0.0, 0.0), tmpvar_24);
  tmpvar_7.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  mediump float x_25;
  x_25 = (1.0 - clamp (dot (normalWorld_4, 
    -(eyeVec_5)
  ), 0.0, 1.0));
  tmpvar_8.w = ((x_25 * x_25) * (x_25 * x_25));
  tmpvar_6.w = clamp ((_Glossiness + (1.0 - 
    (0.7790837 - (_Metallic * 0.7790837))
  )), 0.0, 1.0);
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = ambientOrLightmapUV_18;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 _LightShadowData;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump float rl_1;
  mediump float realtimeShadowAttenuation_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic));
  tmpvar_5 = (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_7;
  tmpvar_7 = _LightColor0.xyz;
  lowp float tmpvar_8;
  highp float lightShadowDataX_9;
  mediump float tmpvar_10;
  tmpvar_10 = _LightShadowData.x;
  lightShadowDataX_9 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_9);
  tmpvar_8 = tmpvar_11;
  realtimeShadowAttenuation_2 = tmpvar_8;
  mediump float occ_12;
  lowp float tmpvar_13;
  tmpvar_13 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_12 = tmpvar_13;
  rl_1 = dot (xlv_TEXCOORD4.yzw, _WorldSpaceLightPos0.xyz);
  mediump float occlusion_14;
  occlusion_14 = ((1.0 - _OcclusionStrength) + (occ_12 * _OcclusionStrength));
  highp vec4 tmpvar_15;
  tmpvar_15 = unity_SpecCube0_HDR;
  mediump float tmpvar_16;
  tmpvar_16 = (1.0 - _Glossiness);
  mediump vec4 hdr_17;
  hdr_17 = tmpvar_15;
  mediump vec4 tmpvar_18;
  tmpvar_18.xyz = xlv_TEXCOORD4.yzw;
  tmpvar_18.w = ((tmpvar_16 * (1.7 - 
    (0.7 * tmpvar_16)
  )) * 6.0);
  lowp vec4 tmpvar_19;
  tmpvar_19 = impl_low_textureCubeLodEXT (unity_SpecCube0, xlv_TEXCOORD4.yzw, tmpvar_18.w);
  mediump vec4 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  mediump vec2 tmpvar_21;
  tmpvar_21.x = ((rl_1 * rl_1) * (rl_1 * rl_1));
  tmpvar_21.y = tmpvar_16;
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (unity_NHxRoughness, tmpvar_21);
  mediump vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = (((
    (xlv_TEXCOORD2.xyz * occlusion_14)
   * tmpvar_5) + (
    (((hdr_17.x * (
      (hdr_17.w * (tmpvar_20.w - 1.0))
     + 1.0)) * tmpvar_20.xyz) * occlusion_14)
   * 
    mix (tmpvar_6, xlv_TEXCOORD1.www, xlv_TEXCOORD5.www)
  )) + ((tmpvar_5 + 
    ((tmpvar_22.w * 16.0) * tmpvar_6)
  ) * (
    (tmpvar_7 * realtimeShadowAttenuation_2)
   * 
    clamp (dot (xlv_TEXCOORD5.xyz, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  )));
  mediump vec4 xlat_varoutput_24;
  xlat_varoutput_24.xyz = tmpvar_23.xyz;
  xlat_varoutput_24.w = 1.0;
  gl_FragData[0] = xlat_varoutput_24;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 102 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  mediump vec3 x1_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_20.x = dot (unity_SHBr, tmpvar_21);
  x1_20.y = dot (unity_SHBg, tmpvar_21);
  x1_20.z = dot (unity_SHBb, tmpvar_21);
  ambientOrLightmapUV_19.xyz = (x1_20 + (unity_SHC.xyz * (
    (normalWorld_18.x * normalWorld_18.x)
   - 
    (normalWorld_18.y * normalWorld_18.y)
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp float atten_2;
  mediump vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  mediump float tmpvar_8;
  tmpvar_8 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_6 = (tmpvar_5 * tmpvar_8);
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_10;
  tmpvar_10 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  highp vec3 worldPos_12;
  worldPos_12 = tmpvar_3;
  mediump float realtimeShadowAttenuation_13;
  highp vec4 v_14;
  v_14.x = unity_MatrixV[0].z;
  v_14.y = unity_MatrixV[1].z;
  v_14.z = unity_MatrixV[2].z;
  v_14.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (worldPos_12 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_12), v_14.xyz), sqrt(dot (tmpvar_15, tmpvar_15)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_16 = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = worldPos_12;
  lowp float tmpvar_19;
  highp vec4 shadowCoord_20;
  shadowCoord_20 = (unity_WorldToShadow[0] * tmpvar_18);
  highp float lightShadowDataX_21;
  mediump float tmpvar_22;
  tmpvar_22 = _LightShadowData.x;
  lightShadowDataX_21 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = max (float((texture2D (_ShadowMapTexture, shadowCoord_20.xy).x > shadowCoord_20.z)), lightShadowDataX_21);
  tmpvar_19 = tmpvar_23;
  realtimeShadowAttenuation_13 = tmpvar_19;
  mediump float tmpvar_24;
  tmpvar_24 = clamp ((realtimeShadowAttenuation_13 + tmpvar_16), 0.0, 1.0);
  atten_2 = tmpvar_24;
  mediump float occ_25;
  lowp float tmpvar_26;
  tmpvar_26 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_25 = tmpvar_26;
  mediump float atten_27;
  atten_27 = atten_2;
  mediump float occlusion_28;
  occlusion_28 = ((1.0 - _OcclusionStrength) + (occ_25 * _OcclusionStrength));
  highp vec4 tmpvar_29;
  tmpvar_29 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = tmpvar_9;
  mediump vec3 x_31;
  x_31.x = dot (unity_SHAr, tmpvar_30);
  x_31.y = dot (unity_SHAg, tmpvar_30);
  x_31.z = dot (unity_SHAb, tmpvar_30);
  mediump vec3 tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = (1.0 - _Glossiness);
  tmpvar_32 = (tmpvar_10 - (2.0 * (
    dot (tmpvar_9, tmpvar_10)
   * tmpvar_9)));
  mediump vec4 hdr_34;
  hdr_34 = tmpvar_29;
  mediump vec4 tmpvar_35;
  tmpvar_35.xyz = tmpvar_32;
  tmpvar_35.w = ((tmpvar_33 * (1.7 - 
    (0.7 * tmpvar_33)
  )) * 6.0);
  lowp vec4 tmpvar_36;
  tmpvar_36 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_32, tmpvar_35.w);
  mediump vec4 tmpvar_37;
  tmpvar_37 = tmpvar_36;
  mediump vec3 viewDir_38;
  viewDir_38 = -(tmpvar_10);
  mediump float specularTerm_39;
  mediump vec3 tmpvar_40;
  mediump vec3 inVec_41;
  inVec_41 = (_WorldSpaceLightPos0.xyz + viewDir_38);
  tmpvar_40 = (inVec_41 * inversesqrt(max (0.001, 
    dot (inVec_41, inVec_41)
  )));
  mediump float tmpvar_42;
  tmpvar_42 = clamp (dot (tmpvar_9, tmpvar_40), 0.0, 1.0);
  mediump float tmpvar_43;
  tmpvar_43 = (tmpvar_33 * tmpvar_33);
  specularTerm_39 = ((tmpvar_43 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_40), 0.0, 1.0)) * (1.5 + tmpvar_43))
   * 
    (((tmpvar_42 * tmpvar_42) * ((tmpvar_43 * tmpvar_43) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_44;
  tmpvar_44 = clamp (specularTerm_39, 0.0, 100.0);
  specularTerm_39 = tmpvar_44;
  mediump float x_45;
  x_45 = (1.0 - clamp (dot (tmpvar_9, viewDir_38), 0.0, 1.0));
  mediump vec3 tmpvar_46;
  tmpvar_46 = (((
    ((tmpvar_6 + (tmpvar_44 * tmpvar_7)) * (tmpvar_11 * atten_27))
   * 
    clamp (dot (tmpvar_9, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_31)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_28)
   * tmpvar_6)) + ((
    (1.0 - ((tmpvar_43 * tmpvar_33) * 0.28))
   * 
    (((hdr_34.x * (
      (hdr_34.w * (tmpvar_37.w - 1.0))
     + 1.0)) * tmpvar_37.xyz) * occlusion_28)
  ) * mix (tmpvar_7, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_8)), 0.0, 1.0)
  ), vec3(
    ((x_45 * x_45) * (x_45 * x_45))
  ))));
  mediump vec4 tmpvar_47;
  tmpvar_47.w = 1.0;
  tmpvar_47.xyz = tmpvar_46;
  c_1.w = tmpvar_47.w;
  c_1.xyz = tmpvar_46;
  mediump vec4 xlat_varoutput_48;
  xlat_varoutput_48.xyz = c_1.xyz;
  xlat_varoutput_48.w = 1.0;
  gl_FragData[0] = xlat_varoutput_48;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 102 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  mediump vec3 x1_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_20.x = dot (unity_SHBr, tmpvar_21);
  x1_20.y = dot (unity_SHBg, tmpvar_21);
  x1_20.z = dot (unity_SHBb, tmpvar_21);
  ambientOrLightmapUV_19.xyz = (x1_20 + (unity_SHC.xyz * (
    (normalWorld_18.x * normalWorld_18.x)
   - 
    (normalWorld_18.y * normalWorld_18.y)
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp float atten_2;
  mediump vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  mediump float tmpvar_8;
  tmpvar_8 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_6 = (tmpvar_5 * tmpvar_8);
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_10;
  tmpvar_10 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  highp vec3 worldPos_12;
  worldPos_12 = tmpvar_3;
  mediump float realtimeShadowAttenuation_13;
  highp vec4 v_14;
  v_14.x = unity_MatrixV[0].z;
  v_14.y = unity_MatrixV[1].z;
  v_14.z = unity_MatrixV[2].z;
  v_14.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (worldPos_12 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_12), v_14.xyz), sqrt(dot (tmpvar_15, tmpvar_15)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_16 = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = worldPos_12;
  lowp float tmpvar_19;
  highp vec4 shadowCoord_20;
  shadowCoord_20 = (unity_WorldToShadow[0] * tmpvar_18);
  highp float lightShadowDataX_21;
  mediump float tmpvar_22;
  tmpvar_22 = _LightShadowData.x;
  lightShadowDataX_21 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = max (float((texture2D (_ShadowMapTexture, shadowCoord_20.xy).x > shadowCoord_20.z)), lightShadowDataX_21);
  tmpvar_19 = tmpvar_23;
  realtimeShadowAttenuation_13 = tmpvar_19;
  mediump float tmpvar_24;
  tmpvar_24 = clamp ((realtimeShadowAttenuation_13 + tmpvar_16), 0.0, 1.0);
  atten_2 = tmpvar_24;
  mediump float occ_25;
  lowp float tmpvar_26;
  tmpvar_26 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_25 = tmpvar_26;
  mediump float atten_27;
  atten_27 = atten_2;
  mediump float occlusion_28;
  occlusion_28 = ((1.0 - _OcclusionStrength) + (occ_25 * _OcclusionStrength));
  highp vec4 tmpvar_29;
  tmpvar_29 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = tmpvar_9;
  mediump vec3 x_31;
  x_31.x = dot (unity_SHAr, tmpvar_30);
  x_31.y = dot (unity_SHAg, tmpvar_30);
  x_31.z = dot (unity_SHAb, tmpvar_30);
  mediump vec3 tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = (1.0 - _Glossiness);
  tmpvar_32 = (tmpvar_10 - (2.0 * (
    dot (tmpvar_9, tmpvar_10)
   * tmpvar_9)));
  mediump vec4 hdr_34;
  hdr_34 = tmpvar_29;
  mediump vec4 tmpvar_35;
  tmpvar_35.xyz = tmpvar_32;
  tmpvar_35.w = ((tmpvar_33 * (1.7 - 
    (0.7 * tmpvar_33)
  )) * 6.0);
  lowp vec4 tmpvar_36;
  tmpvar_36 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_32, tmpvar_35.w);
  mediump vec4 tmpvar_37;
  tmpvar_37 = tmpvar_36;
  mediump vec3 viewDir_38;
  viewDir_38 = -(tmpvar_10);
  mediump float specularTerm_39;
  mediump vec3 tmpvar_40;
  mediump vec3 inVec_41;
  inVec_41 = (_WorldSpaceLightPos0.xyz + viewDir_38);
  tmpvar_40 = (inVec_41 * inversesqrt(max (0.001, 
    dot (inVec_41, inVec_41)
  )));
  mediump float tmpvar_42;
  tmpvar_42 = clamp (dot (tmpvar_9, tmpvar_40), 0.0, 1.0);
  mediump float tmpvar_43;
  tmpvar_43 = (tmpvar_33 * tmpvar_33);
  specularTerm_39 = ((tmpvar_43 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_40), 0.0, 1.0)) * (1.5 + tmpvar_43))
   * 
    (((tmpvar_42 * tmpvar_42) * ((tmpvar_43 * tmpvar_43) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_44;
  tmpvar_44 = clamp (specularTerm_39, 0.0, 100.0);
  specularTerm_39 = tmpvar_44;
  mediump float x_45;
  x_45 = (1.0 - clamp (dot (tmpvar_9, viewDir_38), 0.0, 1.0));
  mediump vec3 tmpvar_46;
  tmpvar_46 = (((
    ((tmpvar_6 + (tmpvar_44 * tmpvar_7)) * (tmpvar_11 * atten_27))
   * 
    clamp (dot (tmpvar_9, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_31)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_28)
   * tmpvar_6)) + ((
    (1.0 - ((tmpvar_43 * tmpvar_33) * 0.28))
   * 
    (((hdr_34.x * (
      (hdr_34.w * (tmpvar_37.w - 1.0))
     + 1.0)) * tmpvar_37.xyz) * occlusion_28)
  ) * mix (tmpvar_7, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_8)), 0.0, 1.0)
  ), vec3(
    ((x_45 * x_45) * (x_45 * x_45))
  ))));
  mediump vec4 tmpvar_47;
  tmpvar_47.w = 1.0;
  tmpvar_47.xyz = tmpvar_46;
  c_1.w = tmpvar_47.w;
  c_1.xyz = tmpvar_46;
  mediump vec4 xlat_varoutput_48;
  xlat_varoutput_48.xyz = c_1.xyz;
  xlat_varoutput_48.w = 1.0;
  gl_FragData[0] = xlat_varoutput_48;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL _EMISSION 
-- Vertex shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Vertex shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Vertex shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN _EMISSION 
-- Vertex shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Vertex shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Vertex shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 38 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  normalWorld_4 = tmpvar_17;
  tmpvar_8.xyz = normalWorld_4;
  tmpvar_6.xyz = eyeVec_5;
  mediump vec4 ambientOrLightmapUV_18;
  ambientOrLightmapUV_18.w = 0.0;
  highp vec3 lightColor0_19;
  lightColor0_19 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_20;
  lightColor1_20 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_21;
  lightColor2_21 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_22;
  lightColor3_22 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_23;
  lightAttenSq_23 = unity_4LightAtten0;
  highp vec3 normal_24;
  normal_24 = normalWorld_4;
  highp vec3 col_25;
  highp vec4 ndotl_26;
  highp vec4 lengthSq_27;
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosX0 - tmpvar_9.x);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosY0 - tmpvar_9.y);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosZ0 - tmpvar_9.z);
  lengthSq_27 = (tmpvar_28 * tmpvar_28);
  lengthSq_27 = (lengthSq_27 + (tmpvar_29 * tmpvar_29));
  lengthSq_27 = (lengthSq_27 + (tmpvar_30 * tmpvar_30));
  highp vec4 tmpvar_31;
  tmpvar_31 = max (lengthSq_27, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_27 = tmpvar_31;
  ndotl_26 = (tmpvar_28 * normal_24.x);
  ndotl_26 = (ndotl_26 + (tmpvar_29 * normal_24.y));
  ndotl_26 = (ndotl_26 + (tmpvar_30 * normal_24.z));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_26 * inversesqrt(tmpvar_31)));
  ndotl_26 = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33 = (tmpvar_32 * (1.0/((1.0 + 
    (tmpvar_31 * lightAttenSq_23)
  ))));
  col_25 = (lightColor0_19 * tmpvar_33.x);
  col_25 = (col_25 + (lightColor1_20 * tmpvar_33.y));
  col_25 = (col_25 + (lightColor2_21 * tmpvar_33.z));
  col_25 = (col_25 + (lightColor3_22 * tmpvar_33.w));
  ambientOrLightmapUV_18.xyz = col_25;
  mediump vec4 tmpvar_34;
  tmpvar_34.w = 1.0;
  tmpvar_34.xyz = normalWorld_4;
  mediump vec3 res_35;
  mediump vec3 x_36;
  x_36.x = dot (unity_SHAr, tmpvar_34);
  x_36.y = dot (unity_SHAg, tmpvar_34);
  x_36.z = dot (unity_SHAb, tmpvar_34);
  mediump vec3 x1_37;
  mediump vec4 tmpvar_38;
  tmpvar_38 = (normalWorld_4.xyzz * normalWorld_4.yzzx);
  x1_37.x = dot (unity_SHBr, tmpvar_38);
  x1_37.y = dot (unity_SHBg, tmpvar_38);
  x1_37.z = dot (unity_SHBb, tmpvar_38);
  res_35 = (x_36 + (x1_37 + (unity_SHC.xyz * 
    ((normalWorld_4.x * normalWorld_4.x) - (normalWorld_4.y * normalWorld_4.y))
  )));
  mediump vec3 tmpvar_39;
  tmpvar_39 = max (((1.055 * 
    pow (max (res_35, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_35 = tmpvar_39;
  ambientOrLightmapUV_18.xyz = (ambientOrLightmapUV_18.xyz + max (vec3(0.0, 0.0, 0.0), tmpvar_39));
  tmpvar_7.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  mediump float x_40;
  x_40 = (1.0 - clamp (dot (normalWorld_4, 
    -(eyeVec_5)
  ), 0.0, 1.0));
  tmpvar_8.w = ((x_40 * x_40) * (x_40 * x_40));
  tmpvar_6.w = clamp ((_Glossiness + (1.0 - 
    (0.7790837 - (_Metallic * 0.7790837))
  )), 0.0, 1.0);
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = ambientOrLightmapUV_18;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump float rl_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic));
  tmpvar_4 = (tmpvar_3 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_6;
  tmpvar_6 = _LightColor0.xyz;
  mediump float occ_7;
  lowp float tmpvar_8;
  tmpvar_8 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_7 = tmpvar_8;
  rl_1 = dot (xlv_TEXCOORD4.yzw, _WorldSpaceLightPos0.xyz);
  mediump float occlusion_9;
  occlusion_9 = ((1.0 - _OcclusionStrength) + (occ_7 * _OcclusionStrength));
  highp vec4 tmpvar_10;
  tmpvar_10 = unity_SpecCube0_HDR;
  mediump float tmpvar_11;
  tmpvar_11 = (1.0 - _Glossiness);
  mediump vec4 hdr_12;
  hdr_12 = tmpvar_10;
  mediump vec4 tmpvar_13;
  tmpvar_13.xyz = xlv_TEXCOORD4.yzw;
  tmpvar_13.w = ((tmpvar_11 * (1.7 - 
    (0.7 * tmpvar_11)
  )) * 6.0);
  lowp vec4 tmpvar_14;
  tmpvar_14 = impl_low_textureCubeLodEXT (unity_SpecCube0, xlv_TEXCOORD4.yzw, tmpvar_13.w);
  mediump vec4 tmpvar_15;
  tmpvar_15 = tmpvar_14;
  mediump vec2 tmpvar_16;
  tmpvar_16.x = ((rl_1 * rl_1) * (rl_1 * rl_1));
  tmpvar_16.y = tmpvar_11;
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (unity_NHxRoughness, tmpvar_16);
  mediump vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = (((
    (xlv_TEXCOORD2.xyz * occlusion_9)
   * tmpvar_4) + (
    (((hdr_12.x * (
      (hdr_12.w * (tmpvar_15.w - 1.0))
     + 1.0)) * tmpvar_15.xyz) * occlusion_9)
   * 
    mix (tmpvar_5, xlv_TEXCOORD1.www, xlv_TEXCOORD5.www)
  )) + ((tmpvar_4 + 
    ((tmpvar_17.w * 16.0) * tmpvar_5)
  ) * (tmpvar_6 * 
    clamp (dot (xlv_TEXCOORD5.xyz, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  )));
  mediump vec4 xlat_varoutput_19;
  xlat_varoutput_19.xyz = tmpvar_18.xyz;
  xlat_varoutput_19.w = 1.0;
  gl_FragData[0] = xlat_varoutput_19;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 85 math, 3 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  highp vec3 lightColor0_20;
  lightColor0_20 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_21;
  lightColor1_21 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_22;
  lightColor2_22 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_23;
  lightColor3_23 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_24;
  lightAttenSq_24 = unity_4LightAtten0;
  highp vec3 normal_25;
  normal_25 = normalWorld_18;
  highp vec3 col_26;
  highp vec4 ndotl_27;
  highp vec4 lengthSq_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_28 = (tmpvar_29 * tmpvar_29);
  lengthSq_28 = (lengthSq_28 + (tmpvar_30 * tmpvar_30));
  lengthSq_28 = (lengthSq_28 + (tmpvar_31 * tmpvar_31));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (lengthSq_28, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_28 = tmpvar_32;
  ndotl_27 = (tmpvar_29 * normal_25.x);
  ndotl_27 = (ndotl_27 + (tmpvar_30 * normal_25.y));
  ndotl_27 = (ndotl_27 + (tmpvar_31 * normal_25.z));
  highp vec4 tmpvar_33;
  tmpvar_33 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_27 * inversesqrt(tmpvar_32)));
  ndotl_27 = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34 = (tmpvar_33 * (1.0/((1.0 + 
    (tmpvar_32 * lightAttenSq_24)
  ))));
  col_26 = (lightColor0_20 * tmpvar_34.x);
  col_26 = (col_26 + (lightColor1_21 * tmpvar_34.y));
  col_26 = (col_26 + (lightColor2_22 * tmpvar_34.z));
  col_26 = (col_26 + (lightColor3_23 * tmpvar_34.w));
  ambientOrLightmapUV_19.xyz = col_26;
  mediump vec3 x1_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_35.x = dot (unity_SHBr, tmpvar_36);
  x1_35.y = dot (unity_SHBg, tmpvar_36);
  x1_35.z = dot (unity_SHBb, tmpvar_36);
  ambientOrLightmapUV_19.xyz = ((ambientOrLightmapUV_19.xyz * (
    (ambientOrLightmapUV_19.xyz * ((ambientOrLightmapUV_19.xyz * 0.305306) + 0.6821711))
   + 0.01252288)) + (x1_35 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic));
  mediump float tmpvar_6;
  tmpvar_6 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_4 = (tmpvar_3 * tmpvar_6);
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_9;
  tmpvar_9 = _LightColor0.xyz;
  mediump float occ_10;
  lowp float tmpvar_11;
  tmpvar_11 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_10 = tmpvar_11;
  mediump float occlusion_12;
  occlusion_12 = ((1.0 - _OcclusionStrength) + (occ_10 * _OcclusionStrength));
  highp vec4 tmpvar_13;
  tmpvar_13 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_7;
  mediump vec3 x_15;
  x_15.x = dot (unity_SHAr, tmpvar_14);
  x_15.y = dot (unity_SHAg, tmpvar_14);
  x_15.z = dot (unity_SHAb, tmpvar_14);
  mediump vec3 tmpvar_16;
  mediump float tmpvar_17;
  tmpvar_17 = (1.0 - _Glossiness);
  tmpvar_16 = (tmpvar_8 - (2.0 * (
    dot (tmpvar_7, tmpvar_8)
   * tmpvar_7)));
  mediump vec4 hdr_18;
  hdr_18 = tmpvar_13;
  mediump vec4 tmpvar_19;
  tmpvar_19.xyz = tmpvar_16;
  tmpvar_19.w = ((tmpvar_17 * (1.7 - 
    (0.7 * tmpvar_17)
  )) * 6.0);
  lowp vec4 tmpvar_20;
  tmpvar_20 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_16, tmpvar_19.w);
  mediump vec4 tmpvar_21;
  tmpvar_21 = tmpvar_20;
  mediump vec3 viewDir_22;
  viewDir_22 = -(tmpvar_8);
  mediump float specularTerm_23;
  mediump vec3 tmpvar_24;
  mediump vec3 inVec_25;
  inVec_25 = (_WorldSpaceLightPos0.xyz + viewDir_22);
  tmpvar_24 = (inVec_25 * inversesqrt(max (0.001, 
    dot (inVec_25, inVec_25)
  )));
  mediump float tmpvar_26;
  tmpvar_26 = clamp (dot (tmpvar_7, tmpvar_24), 0.0, 1.0);
  mediump float tmpvar_27;
  tmpvar_27 = (tmpvar_17 * tmpvar_17);
  specularTerm_23 = ((tmpvar_27 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_24), 0.0, 1.0)) * (1.5 + tmpvar_27))
   * 
    (((tmpvar_26 * tmpvar_26) * ((tmpvar_27 * tmpvar_27) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_28;
  tmpvar_28 = clamp (specularTerm_23, 0.0, 100.0);
  specularTerm_23 = tmpvar_28;
  mediump float x_29;
  x_29 = (1.0 - clamp (dot (tmpvar_7, viewDir_22), 0.0, 1.0));
  mediump vec3 tmpvar_30;
  tmpvar_30 = (((
    ((tmpvar_4 + (tmpvar_28 * tmpvar_5)) * tmpvar_9)
   * 
    clamp (dot (tmpvar_7, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_15)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_12)
   * tmpvar_4)) + ((
    (1.0 - ((tmpvar_27 * tmpvar_17) * 0.28))
   * 
    (((hdr_18.x * (
      (hdr_18.w * (tmpvar_21.w - 1.0))
     + 1.0)) * tmpvar_21.xyz) * occlusion_12)
  ) * mix (tmpvar_5, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_6)), 0.0, 1.0)
  ), vec3(
    ((x_29 * x_29) * (x_29 * x_29))
  ))));
  mediump vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = tmpvar_30;
  c_1.w = tmpvar_31.w;
  c_1.xyz = tmpvar_30;
  mediump vec4 xlat_varoutput_32;
  xlat_varoutput_32.xyz = c_1.xyz;
  xlat_varoutput_32.w = 1.0;
  gl_FragData[0] = xlat_varoutput_32;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 85 math, 3 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  highp vec3 lightColor0_20;
  lightColor0_20 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_21;
  lightColor1_21 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_22;
  lightColor2_22 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_23;
  lightColor3_23 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_24;
  lightAttenSq_24 = unity_4LightAtten0;
  highp vec3 normal_25;
  normal_25 = normalWorld_18;
  highp vec3 col_26;
  highp vec4 ndotl_27;
  highp vec4 lengthSq_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_28 = (tmpvar_29 * tmpvar_29);
  lengthSq_28 = (lengthSq_28 + (tmpvar_30 * tmpvar_30));
  lengthSq_28 = (lengthSq_28 + (tmpvar_31 * tmpvar_31));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (lengthSq_28, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_28 = tmpvar_32;
  ndotl_27 = (tmpvar_29 * normal_25.x);
  ndotl_27 = (ndotl_27 + (tmpvar_30 * normal_25.y));
  ndotl_27 = (ndotl_27 + (tmpvar_31 * normal_25.z));
  highp vec4 tmpvar_33;
  tmpvar_33 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_27 * inversesqrt(tmpvar_32)));
  ndotl_27 = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34 = (tmpvar_33 * (1.0/((1.0 + 
    (tmpvar_32 * lightAttenSq_24)
  ))));
  col_26 = (lightColor0_20 * tmpvar_34.x);
  col_26 = (col_26 + (lightColor1_21 * tmpvar_34.y));
  col_26 = (col_26 + (lightColor2_22 * tmpvar_34.z));
  col_26 = (col_26 + (lightColor3_23 * tmpvar_34.w));
  ambientOrLightmapUV_19.xyz = col_26;
  mediump vec3 x1_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_35.x = dot (unity_SHBr, tmpvar_36);
  x1_35.y = dot (unity_SHBg, tmpvar_36);
  x1_35.z = dot (unity_SHBb, tmpvar_36);
  ambientOrLightmapUV_19.xyz = ((ambientOrLightmapUV_19.xyz * (
    (ambientOrLightmapUV_19.xyz * ((ambientOrLightmapUV_19.xyz * 0.305306) + 0.6821711))
   + 0.01252288)) + (x1_35 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic));
  mediump float tmpvar_6;
  tmpvar_6 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_4 = (tmpvar_3 * tmpvar_6);
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_9;
  tmpvar_9 = _LightColor0.xyz;
  mediump float occ_10;
  lowp float tmpvar_11;
  tmpvar_11 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_10 = tmpvar_11;
  mediump float occlusion_12;
  occlusion_12 = ((1.0 - _OcclusionStrength) + (occ_10 * _OcclusionStrength));
  highp vec4 tmpvar_13;
  tmpvar_13 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_7;
  mediump vec3 x_15;
  x_15.x = dot (unity_SHAr, tmpvar_14);
  x_15.y = dot (unity_SHAg, tmpvar_14);
  x_15.z = dot (unity_SHAb, tmpvar_14);
  mediump vec3 tmpvar_16;
  mediump float tmpvar_17;
  tmpvar_17 = (1.0 - _Glossiness);
  tmpvar_16 = (tmpvar_8 - (2.0 * (
    dot (tmpvar_7, tmpvar_8)
   * tmpvar_7)));
  mediump vec4 hdr_18;
  hdr_18 = tmpvar_13;
  mediump vec4 tmpvar_19;
  tmpvar_19.xyz = tmpvar_16;
  tmpvar_19.w = ((tmpvar_17 * (1.7 - 
    (0.7 * tmpvar_17)
  )) * 6.0);
  lowp vec4 tmpvar_20;
  tmpvar_20 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_16, tmpvar_19.w);
  mediump vec4 tmpvar_21;
  tmpvar_21 = tmpvar_20;
  mediump vec3 viewDir_22;
  viewDir_22 = -(tmpvar_8);
  mediump float specularTerm_23;
  mediump vec3 tmpvar_24;
  mediump vec3 inVec_25;
  inVec_25 = (_WorldSpaceLightPos0.xyz + viewDir_22);
  tmpvar_24 = (inVec_25 * inversesqrt(max (0.001, 
    dot (inVec_25, inVec_25)
  )));
  mediump float tmpvar_26;
  tmpvar_26 = clamp (dot (tmpvar_7, tmpvar_24), 0.0, 1.0);
  mediump float tmpvar_27;
  tmpvar_27 = (tmpvar_17 * tmpvar_17);
  specularTerm_23 = ((tmpvar_27 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_24), 0.0, 1.0)) * (1.5 + tmpvar_27))
   * 
    (((tmpvar_26 * tmpvar_26) * ((tmpvar_27 * tmpvar_27) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_28;
  tmpvar_28 = clamp (specularTerm_23, 0.0, 100.0);
  specularTerm_23 = tmpvar_28;
  mediump float x_29;
  x_29 = (1.0 - clamp (dot (tmpvar_7, viewDir_22), 0.0, 1.0));
  mediump vec3 tmpvar_30;
  tmpvar_30 = (((
    ((tmpvar_4 + (tmpvar_28 * tmpvar_5)) * tmpvar_9)
   * 
    clamp (dot (tmpvar_7, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_15)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_12)
   * tmpvar_4)) + ((
    (1.0 - ((tmpvar_27 * tmpvar_17) * 0.28))
   * 
    (((hdr_18.x * (
      (hdr_18.w * (tmpvar_21.w - 1.0))
     + 1.0)) * tmpvar_21.xyz) * occlusion_12)
  ) * mix (tmpvar_5, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_6)), 0.0, 1.0)
  ), vec3(
    ((x_29 * x_29) * (x_29 * x_29))
  ))));
  mediump vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = tmpvar_30;
  c_1.w = tmpvar_31.w;
  c_1.xyz = tmpvar_30;
  mediump vec4 xlat_varoutput_32;
  xlat_varoutput_32.xyz = c_1.xyz;
  xlat_varoutput_32.w = 1.0;
  gl_FragData[0] = xlat_varoutput_32;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 42 math, 5 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  normalWorld_4 = tmpvar_17;
  tmpvar_8.xyz = normalWorld_4;
  tmpvar_6.xyz = eyeVec_5;
  mediump vec4 ambientOrLightmapUV_18;
  ambientOrLightmapUV_18.w = 0.0;
  highp vec3 lightColor0_19;
  lightColor0_19 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_20;
  lightColor1_20 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_21;
  lightColor2_21 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_22;
  lightColor3_22 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_23;
  lightAttenSq_23 = unity_4LightAtten0;
  highp vec3 normal_24;
  normal_24 = normalWorld_4;
  highp vec3 col_25;
  highp vec4 ndotl_26;
  highp vec4 lengthSq_27;
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosX0 - tmpvar_9.x);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosY0 - tmpvar_9.y);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosZ0 - tmpvar_9.z);
  lengthSq_27 = (tmpvar_28 * tmpvar_28);
  lengthSq_27 = (lengthSq_27 + (tmpvar_29 * tmpvar_29));
  lengthSq_27 = (lengthSq_27 + (tmpvar_30 * tmpvar_30));
  highp vec4 tmpvar_31;
  tmpvar_31 = max (lengthSq_27, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_27 = tmpvar_31;
  ndotl_26 = (tmpvar_28 * normal_24.x);
  ndotl_26 = (ndotl_26 + (tmpvar_29 * normal_24.y));
  ndotl_26 = (ndotl_26 + (tmpvar_30 * normal_24.z));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_26 * inversesqrt(tmpvar_31)));
  ndotl_26 = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33 = (tmpvar_32 * (1.0/((1.0 + 
    (tmpvar_31 * lightAttenSq_23)
  ))));
  col_25 = (lightColor0_19 * tmpvar_33.x);
  col_25 = (col_25 + (lightColor1_20 * tmpvar_33.y));
  col_25 = (col_25 + (lightColor2_21 * tmpvar_33.z));
  col_25 = (col_25 + (lightColor3_22 * tmpvar_33.w));
  ambientOrLightmapUV_18.xyz = col_25;
  mediump vec4 tmpvar_34;
  tmpvar_34.w = 1.0;
  tmpvar_34.xyz = normalWorld_4;
  mediump vec3 res_35;
  mediump vec3 x_36;
  x_36.x = dot (unity_SHAr, tmpvar_34);
  x_36.y = dot (unity_SHAg, tmpvar_34);
  x_36.z = dot (unity_SHAb, tmpvar_34);
  mediump vec3 x1_37;
  mediump vec4 tmpvar_38;
  tmpvar_38 = (normalWorld_4.xyzz * normalWorld_4.yzzx);
  x1_37.x = dot (unity_SHBr, tmpvar_38);
  x1_37.y = dot (unity_SHBg, tmpvar_38);
  x1_37.z = dot (unity_SHBb, tmpvar_38);
  res_35 = (x_36 + (x1_37 + (unity_SHC.xyz * 
    ((normalWorld_4.x * normalWorld_4.x) - (normalWorld_4.y * normalWorld_4.y))
  )));
  mediump vec3 tmpvar_39;
  tmpvar_39 = max (((1.055 * 
    pow (max (res_35, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_35 = tmpvar_39;
  ambientOrLightmapUV_18.xyz = (ambientOrLightmapUV_18.xyz + max (vec3(0.0, 0.0, 0.0), tmpvar_39));
  tmpvar_7.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  mediump float x_40;
  x_40 = (1.0 - clamp (dot (normalWorld_4, 
    -(eyeVec_5)
  ), 0.0, 1.0));
  tmpvar_8.w = ((x_40 * x_40) * (x_40 * x_40));
  tmpvar_6.w = clamp ((_Glossiness + (1.0 - 
    (0.7790837 - (_Metallic * 0.7790837))
  )), 0.0, 1.0);
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = ambientOrLightmapUV_18;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 _LightShadowData;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump float rl_1;
  mediump float realtimeShadowAttenuation_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic));
  tmpvar_5 = (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_7;
  tmpvar_7 = _LightColor0.xyz;
  lowp float tmpvar_8;
  highp float lightShadowDataX_9;
  mediump float tmpvar_10;
  tmpvar_10 = _LightShadowData.x;
  lightShadowDataX_9 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_9);
  tmpvar_8 = tmpvar_11;
  realtimeShadowAttenuation_2 = tmpvar_8;
  mediump float occ_12;
  lowp float tmpvar_13;
  tmpvar_13 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_12 = tmpvar_13;
  rl_1 = dot (xlv_TEXCOORD4.yzw, _WorldSpaceLightPos0.xyz);
  mediump float occlusion_14;
  occlusion_14 = ((1.0 - _OcclusionStrength) + (occ_12 * _OcclusionStrength));
  highp vec4 tmpvar_15;
  tmpvar_15 = unity_SpecCube0_HDR;
  mediump float tmpvar_16;
  tmpvar_16 = (1.0 - _Glossiness);
  mediump vec4 hdr_17;
  hdr_17 = tmpvar_15;
  mediump vec4 tmpvar_18;
  tmpvar_18.xyz = xlv_TEXCOORD4.yzw;
  tmpvar_18.w = ((tmpvar_16 * (1.7 - 
    (0.7 * tmpvar_16)
  )) * 6.0);
  lowp vec4 tmpvar_19;
  tmpvar_19 = impl_low_textureCubeLodEXT (unity_SpecCube0, xlv_TEXCOORD4.yzw, tmpvar_18.w);
  mediump vec4 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  mediump vec2 tmpvar_21;
  tmpvar_21.x = ((rl_1 * rl_1) * (rl_1 * rl_1));
  tmpvar_21.y = tmpvar_16;
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (unity_NHxRoughness, tmpvar_21);
  mediump vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = (((
    (xlv_TEXCOORD2.xyz * occlusion_14)
   * tmpvar_5) + (
    (((hdr_17.x * (
      (hdr_17.w * (tmpvar_20.w - 1.0))
     + 1.0)) * tmpvar_20.xyz) * occlusion_14)
   * 
    mix (tmpvar_6, xlv_TEXCOORD1.www, xlv_TEXCOORD5.www)
  )) + ((tmpvar_5 + 
    ((tmpvar_22.w * 16.0) * tmpvar_6)
  ) * (
    (tmpvar_7 * realtimeShadowAttenuation_2)
   * 
    clamp (dot (xlv_TEXCOORD5.xyz, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  )));
  mediump vec4 xlat_varoutput_24;
  xlat_varoutput_24.xyz = tmpvar_23.xyz;
  xlat_varoutput_24.w = 1.0;
  gl_FragData[0] = xlat_varoutput_24;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 102 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  highp vec3 lightColor0_20;
  lightColor0_20 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_21;
  lightColor1_21 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_22;
  lightColor2_22 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_23;
  lightColor3_23 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_24;
  lightAttenSq_24 = unity_4LightAtten0;
  highp vec3 normal_25;
  normal_25 = normalWorld_18;
  highp vec3 col_26;
  highp vec4 ndotl_27;
  highp vec4 lengthSq_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_28 = (tmpvar_29 * tmpvar_29);
  lengthSq_28 = (lengthSq_28 + (tmpvar_30 * tmpvar_30));
  lengthSq_28 = (lengthSq_28 + (tmpvar_31 * tmpvar_31));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (lengthSq_28, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_28 = tmpvar_32;
  ndotl_27 = (tmpvar_29 * normal_25.x);
  ndotl_27 = (ndotl_27 + (tmpvar_30 * normal_25.y));
  ndotl_27 = (ndotl_27 + (tmpvar_31 * normal_25.z));
  highp vec4 tmpvar_33;
  tmpvar_33 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_27 * inversesqrt(tmpvar_32)));
  ndotl_27 = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34 = (tmpvar_33 * (1.0/((1.0 + 
    (tmpvar_32 * lightAttenSq_24)
  ))));
  col_26 = (lightColor0_20 * tmpvar_34.x);
  col_26 = (col_26 + (lightColor1_21 * tmpvar_34.y));
  col_26 = (col_26 + (lightColor2_22 * tmpvar_34.z));
  col_26 = (col_26 + (lightColor3_23 * tmpvar_34.w));
  ambientOrLightmapUV_19.xyz = col_26;
  mediump vec3 x1_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_35.x = dot (unity_SHBr, tmpvar_36);
  x1_35.y = dot (unity_SHBg, tmpvar_36);
  x1_35.z = dot (unity_SHBb, tmpvar_36);
  ambientOrLightmapUV_19.xyz = ((ambientOrLightmapUV_19.xyz * (
    (ambientOrLightmapUV_19.xyz * ((ambientOrLightmapUV_19.xyz * 0.305306) + 0.6821711))
   + 0.01252288)) + (x1_35 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp float atten_2;
  mediump vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  mediump float tmpvar_8;
  tmpvar_8 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_6 = (tmpvar_5 * tmpvar_8);
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_10;
  tmpvar_10 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  highp vec3 worldPos_12;
  worldPos_12 = tmpvar_3;
  mediump float realtimeShadowAttenuation_13;
  highp vec4 v_14;
  v_14.x = unity_MatrixV[0].z;
  v_14.y = unity_MatrixV[1].z;
  v_14.z = unity_MatrixV[2].z;
  v_14.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (worldPos_12 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_12), v_14.xyz), sqrt(dot (tmpvar_15, tmpvar_15)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_16 = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = worldPos_12;
  lowp float tmpvar_19;
  highp vec4 shadowCoord_20;
  shadowCoord_20 = (unity_WorldToShadow[0] * tmpvar_18);
  highp float lightShadowDataX_21;
  mediump float tmpvar_22;
  tmpvar_22 = _LightShadowData.x;
  lightShadowDataX_21 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = max (float((texture2D (_ShadowMapTexture, shadowCoord_20.xy).x > shadowCoord_20.z)), lightShadowDataX_21);
  tmpvar_19 = tmpvar_23;
  realtimeShadowAttenuation_13 = tmpvar_19;
  mediump float tmpvar_24;
  tmpvar_24 = clamp ((realtimeShadowAttenuation_13 + tmpvar_16), 0.0, 1.0);
  atten_2 = tmpvar_24;
  mediump float occ_25;
  lowp float tmpvar_26;
  tmpvar_26 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_25 = tmpvar_26;
  mediump float atten_27;
  atten_27 = atten_2;
  mediump float occlusion_28;
  occlusion_28 = ((1.0 - _OcclusionStrength) + (occ_25 * _OcclusionStrength));
  highp vec4 tmpvar_29;
  tmpvar_29 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = tmpvar_9;
  mediump vec3 x_31;
  x_31.x = dot (unity_SHAr, tmpvar_30);
  x_31.y = dot (unity_SHAg, tmpvar_30);
  x_31.z = dot (unity_SHAb, tmpvar_30);
  mediump vec3 tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = (1.0 - _Glossiness);
  tmpvar_32 = (tmpvar_10 - (2.0 * (
    dot (tmpvar_9, tmpvar_10)
   * tmpvar_9)));
  mediump vec4 hdr_34;
  hdr_34 = tmpvar_29;
  mediump vec4 tmpvar_35;
  tmpvar_35.xyz = tmpvar_32;
  tmpvar_35.w = ((tmpvar_33 * (1.7 - 
    (0.7 * tmpvar_33)
  )) * 6.0);
  lowp vec4 tmpvar_36;
  tmpvar_36 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_32, tmpvar_35.w);
  mediump vec4 tmpvar_37;
  tmpvar_37 = tmpvar_36;
  mediump vec3 viewDir_38;
  viewDir_38 = -(tmpvar_10);
  mediump float specularTerm_39;
  mediump vec3 tmpvar_40;
  mediump vec3 inVec_41;
  inVec_41 = (_WorldSpaceLightPos0.xyz + viewDir_38);
  tmpvar_40 = (inVec_41 * inversesqrt(max (0.001, 
    dot (inVec_41, inVec_41)
  )));
  mediump float tmpvar_42;
  tmpvar_42 = clamp (dot (tmpvar_9, tmpvar_40), 0.0, 1.0);
  mediump float tmpvar_43;
  tmpvar_43 = (tmpvar_33 * tmpvar_33);
  specularTerm_39 = ((tmpvar_43 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_40), 0.0, 1.0)) * (1.5 + tmpvar_43))
   * 
    (((tmpvar_42 * tmpvar_42) * ((tmpvar_43 * tmpvar_43) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_44;
  tmpvar_44 = clamp (specularTerm_39, 0.0, 100.0);
  specularTerm_39 = tmpvar_44;
  mediump float x_45;
  x_45 = (1.0 - clamp (dot (tmpvar_9, viewDir_38), 0.0, 1.0));
  mediump vec3 tmpvar_46;
  tmpvar_46 = (((
    ((tmpvar_6 + (tmpvar_44 * tmpvar_7)) * (tmpvar_11 * atten_27))
   * 
    clamp (dot (tmpvar_9, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_31)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_28)
   * tmpvar_6)) + ((
    (1.0 - ((tmpvar_43 * tmpvar_33) * 0.28))
   * 
    (((hdr_34.x * (
      (hdr_34.w * (tmpvar_37.w - 1.0))
     + 1.0)) * tmpvar_37.xyz) * occlusion_28)
  ) * mix (tmpvar_7, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_8)), 0.0, 1.0)
  ), vec3(
    ((x_45 * x_45) * (x_45 * x_45))
  ))));
  mediump vec4 tmpvar_47;
  tmpvar_47.w = 1.0;
  tmpvar_47.xyz = tmpvar_46;
  c_1.w = tmpvar_47.w;
  c_1.xyz = tmpvar_46;
  mediump vec4 xlat_varoutput_48;
  xlat_varoutput_48.xyz = c_1.xyz;
  xlat_varoutput_48.w = 1.0;
  gl_FragData[0] = xlat_varoutput_48;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 102 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  highp vec3 lightColor0_20;
  lightColor0_20 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_21;
  lightColor1_21 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_22;
  lightColor2_22 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_23;
  lightColor3_23 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_24;
  lightAttenSq_24 = unity_4LightAtten0;
  highp vec3 normal_25;
  normal_25 = normalWorld_18;
  highp vec3 col_26;
  highp vec4 ndotl_27;
  highp vec4 lengthSq_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_28 = (tmpvar_29 * tmpvar_29);
  lengthSq_28 = (lengthSq_28 + (tmpvar_30 * tmpvar_30));
  lengthSq_28 = (lengthSq_28 + (tmpvar_31 * tmpvar_31));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (lengthSq_28, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_28 = tmpvar_32;
  ndotl_27 = (tmpvar_29 * normal_25.x);
  ndotl_27 = (ndotl_27 + (tmpvar_30 * normal_25.y));
  ndotl_27 = (ndotl_27 + (tmpvar_31 * normal_25.z));
  highp vec4 tmpvar_33;
  tmpvar_33 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_27 * inversesqrt(tmpvar_32)));
  ndotl_27 = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34 = (tmpvar_33 * (1.0/((1.0 + 
    (tmpvar_32 * lightAttenSq_24)
  ))));
  col_26 = (lightColor0_20 * tmpvar_34.x);
  col_26 = (col_26 + (lightColor1_21 * tmpvar_34.y));
  col_26 = (col_26 + (lightColor2_22 * tmpvar_34.z));
  col_26 = (col_26 + (lightColor3_23 * tmpvar_34.w));
  ambientOrLightmapUV_19.xyz = col_26;
  mediump vec3 x1_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_35.x = dot (unity_SHBr, tmpvar_36);
  x1_35.y = dot (unity_SHBg, tmpvar_36);
  x1_35.z = dot (unity_SHBb, tmpvar_36);
  ambientOrLightmapUV_19.xyz = ((ambientOrLightmapUV_19.xyz * (
    (ambientOrLightmapUV_19.xyz * ((ambientOrLightmapUV_19.xyz * 0.305306) + 0.6821711))
   + 0.01252288)) + (x1_35 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp float atten_2;
  mediump vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  mediump float tmpvar_8;
  tmpvar_8 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_6 = (tmpvar_5 * tmpvar_8);
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_10;
  tmpvar_10 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  highp vec3 worldPos_12;
  worldPos_12 = tmpvar_3;
  mediump float realtimeShadowAttenuation_13;
  highp vec4 v_14;
  v_14.x = unity_MatrixV[0].z;
  v_14.y = unity_MatrixV[1].z;
  v_14.z = unity_MatrixV[2].z;
  v_14.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (worldPos_12 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_12), v_14.xyz), sqrt(dot (tmpvar_15, tmpvar_15)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_16 = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = worldPos_12;
  lowp float tmpvar_19;
  highp vec4 shadowCoord_20;
  shadowCoord_20 = (unity_WorldToShadow[0] * tmpvar_18);
  highp float lightShadowDataX_21;
  mediump float tmpvar_22;
  tmpvar_22 = _LightShadowData.x;
  lightShadowDataX_21 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = max (float((texture2D (_ShadowMapTexture, shadowCoord_20.xy).x > shadowCoord_20.z)), lightShadowDataX_21);
  tmpvar_19 = tmpvar_23;
  realtimeShadowAttenuation_13 = tmpvar_19;
  mediump float tmpvar_24;
  tmpvar_24 = clamp ((realtimeShadowAttenuation_13 + tmpvar_16), 0.0, 1.0);
  atten_2 = tmpvar_24;
  mediump float occ_25;
  lowp float tmpvar_26;
  tmpvar_26 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_25 = tmpvar_26;
  mediump float atten_27;
  atten_27 = atten_2;
  mediump float occlusion_28;
  occlusion_28 = ((1.0 - _OcclusionStrength) + (occ_25 * _OcclusionStrength));
  highp vec4 tmpvar_29;
  tmpvar_29 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = tmpvar_9;
  mediump vec3 x_31;
  x_31.x = dot (unity_SHAr, tmpvar_30);
  x_31.y = dot (unity_SHAg, tmpvar_30);
  x_31.z = dot (unity_SHAb, tmpvar_30);
  mediump vec3 tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = (1.0 - _Glossiness);
  tmpvar_32 = (tmpvar_10 - (2.0 * (
    dot (tmpvar_9, tmpvar_10)
   * tmpvar_9)));
  mediump vec4 hdr_34;
  hdr_34 = tmpvar_29;
  mediump vec4 tmpvar_35;
  tmpvar_35.xyz = tmpvar_32;
  tmpvar_35.w = ((tmpvar_33 * (1.7 - 
    (0.7 * tmpvar_33)
  )) * 6.0);
  lowp vec4 tmpvar_36;
  tmpvar_36 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_32, tmpvar_35.w);
  mediump vec4 tmpvar_37;
  tmpvar_37 = tmpvar_36;
  mediump vec3 viewDir_38;
  viewDir_38 = -(tmpvar_10);
  mediump float specularTerm_39;
  mediump vec3 tmpvar_40;
  mediump vec3 inVec_41;
  inVec_41 = (_WorldSpaceLightPos0.xyz + viewDir_38);
  tmpvar_40 = (inVec_41 * inversesqrt(max (0.001, 
    dot (inVec_41, inVec_41)
  )));
  mediump float tmpvar_42;
  tmpvar_42 = clamp (dot (tmpvar_9, tmpvar_40), 0.0, 1.0);
  mediump float tmpvar_43;
  tmpvar_43 = (tmpvar_33 * tmpvar_33);
  specularTerm_39 = ((tmpvar_43 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_40), 0.0, 1.0)) * (1.5 + tmpvar_43))
   * 
    (((tmpvar_42 * tmpvar_42) * ((tmpvar_43 * tmpvar_43) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_44;
  tmpvar_44 = clamp (specularTerm_39, 0.0, 100.0);
  specularTerm_39 = tmpvar_44;
  mediump float x_45;
  x_45 = (1.0 - clamp (dot (tmpvar_9, viewDir_38), 0.0, 1.0));
  mediump vec3 tmpvar_46;
  tmpvar_46 = (((
    ((tmpvar_6 + (tmpvar_44 * tmpvar_7)) * (tmpvar_11 * atten_27))
   * 
    clamp (dot (tmpvar_9, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_31)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_28)
   * tmpvar_6)) + ((
    (1.0 - ((tmpvar_43 * tmpvar_33) * 0.28))
   * 
    (((hdr_34.x * (
      (hdr_34.w * (tmpvar_37.w - 1.0))
     + 1.0)) * tmpvar_37.xyz) * occlusion_28)
  ) * mix (tmpvar_7, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_8)), 0.0, 1.0)
  ), vec3(
    ((x_45 * x_45) * (x_45 * x_45))
  ))));
  mediump vec4 tmpvar_47;
  tmpvar_47.w = 1.0;
  tmpvar_47.xyz = tmpvar_46;
  c_1.w = tmpvar_47.w;
  c_1.xyz = tmpvar_46;
  mediump vec4 xlat_varoutput_48;
  xlat_varoutput_48.xyz = c_1.xyz;
  xlat_varoutput_48.w = 1.0;
  gl_FragData[0] = xlat_varoutput_48;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 40 math, 5 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  normalWorld_4 = tmpvar_17;
  tmpvar_8.xyz = normalWorld_4;
  tmpvar_6.xyz = eyeVec_5;
  mediump vec4 ambientOrLightmapUV_18;
  ambientOrLightmapUV_18.w = 0.0;
  mediump vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = normalWorld_4;
  mediump vec3 res_20;
  mediump vec3 x_21;
  x_21.x = dot (unity_SHAr, tmpvar_19);
  x_21.y = dot (unity_SHAg, tmpvar_19);
  x_21.z = dot (unity_SHAb, tmpvar_19);
  mediump vec3 x1_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normalWorld_4.xyzz * normalWorld_4.yzzx);
  x1_22.x = dot (unity_SHBr, tmpvar_23);
  x1_22.y = dot (unity_SHBg, tmpvar_23);
  x1_22.z = dot (unity_SHBb, tmpvar_23);
  res_20 = (x_21 + (x1_22 + (unity_SHC.xyz * 
    ((normalWorld_4.x * normalWorld_4.x) - (normalWorld_4.y * normalWorld_4.y))
  )));
  mediump vec3 tmpvar_24;
  tmpvar_24 = max (((1.055 * 
    pow (max (res_20, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_20 = tmpvar_24;
  ambientOrLightmapUV_18.xyz = max (vec3(0.0, 0.0, 0.0), tmpvar_24);
  tmpvar_7.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  mediump float x_25;
  x_25 = (1.0 - clamp (dot (normalWorld_4, 
    -(eyeVec_5)
  ), 0.0, 1.0));
  tmpvar_8.w = ((x_25 * x_25) * (x_25 * x_25));
  tmpvar_6.w = clamp ((_Glossiness + (1.0 - 
    (0.7790837 - (_Metallic * 0.7790837))
  )), 0.0, 1.0);
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = ambientOrLightmapUV_18;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  mediump float rl_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic));
  tmpvar_5 = (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_7;
  tmpvar_7 = _LightColor0.xyz;
  mediump float occ_8;
  lowp float tmpvar_9;
  tmpvar_9 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_8 = tmpvar_9;
  rl_2 = dot (xlv_TEXCOORD4.yzw, _WorldSpaceLightPos0.xyz);
  mediump float occlusion_10;
  occlusion_10 = ((1.0 - _OcclusionStrength) + (occ_8 * _OcclusionStrength));
  highp vec4 tmpvar_11;
  tmpvar_11 = unity_SpecCube0_HDR;
  mediump float tmpvar_12;
  tmpvar_12 = (1.0 - _Glossiness);
  mediump vec4 hdr_13;
  hdr_13 = tmpvar_11;
  mediump vec4 tmpvar_14;
  tmpvar_14.xyz = xlv_TEXCOORD4.yzw;
  tmpvar_14.w = ((tmpvar_12 * (1.7 - 
    (0.7 * tmpvar_12)
  )) * 6.0);
  lowp vec4 tmpvar_15;
  tmpvar_15 = impl_low_textureCubeLodEXT (unity_SpecCube0, xlv_TEXCOORD4.yzw, tmpvar_14.w);
  mediump vec4 tmpvar_16;
  tmpvar_16 = tmpvar_15;
  mediump vec2 tmpvar_17;
  tmpvar_17.x = ((rl_2 * rl_2) * (rl_2 * rl_2));
  tmpvar_17.y = tmpvar_12;
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (unity_NHxRoughness, tmpvar_17);
  c_1 = (((
    (xlv_TEXCOORD2.xyz * occlusion_10)
   * tmpvar_5) + (
    (((hdr_13.x * (
      (hdr_13.w * (tmpvar_16.w - 1.0))
     + 1.0)) * tmpvar_16.xyz) * occlusion_10)
   * 
    mix (tmpvar_6, xlv_TEXCOORD1.www, xlv_TEXCOORD5.www)
  )) + ((tmpvar_5 + 
    ((tmpvar_18.w * 16.0) * tmpvar_6)
  ) * (tmpvar_7 * 
    clamp (dot (xlv_TEXCOORD5.xyz, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  )));
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1 = (c_1 + (tmpvar_19.xyz * _EmissionColor.xyz));
  mediump vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = c_1;
  mediump vec4 xlat_varoutput_21;
  xlat_varoutput_21.xyz = tmpvar_20.xyz;
  xlat_varoutput_21.w = 1.0;
  gl_FragData[0] = xlat_varoutput_21;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 87 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  mediump vec3 x1_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_20.x = dot (unity_SHBr, tmpvar_21);
  x1_20.y = dot (unity_SHBg, tmpvar_21);
  x1_20.z = dot (unity_SHBb, tmpvar_21);
  ambientOrLightmapUV_19.xyz = (x1_20 + (unity_SHC.xyz * (
    (normalWorld_18.x * normalWorld_18.x)
   - 
    (normalWorld_18.y * normalWorld_18.y)
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic));
  mediump float tmpvar_6;
  tmpvar_6 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_4 = (tmpvar_3 * tmpvar_6);
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_9;
  tmpvar_9 = _LightColor0.xyz;
  mediump float occ_10;
  lowp float tmpvar_11;
  tmpvar_11 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_10 = tmpvar_11;
  mediump float occlusion_12;
  occlusion_12 = ((1.0 - _OcclusionStrength) + (occ_10 * _OcclusionStrength));
  highp vec4 tmpvar_13;
  tmpvar_13 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_7;
  mediump vec3 x_15;
  x_15.x = dot (unity_SHAr, tmpvar_14);
  x_15.y = dot (unity_SHAg, tmpvar_14);
  x_15.z = dot (unity_SHAb, tmpvar_14);
  mediump vec3 tmpvar_16;
  mediump float tmpvar_17;
  tmpvar_17 = (1.0 - _Glossiness);
  tmpvar_16 = (tmpvar_8 - (2.0 * (
    dot (tmpvar_7, tmpvar_8)
   * tmpvar_7)));
  mediump vec4 hdr_18;
  hdr_18 = tmpvar_13;
  mediump vec4 tmpvar_19;
  tmpvar_19.xyz = tmpvar_16;
  tmpvar_19.w = ((tmpvar_17 * (1.7 - 
    (0.7 * tmpvar_17)
  )) * 6.0);
  lowp vec4 tmpvar_20;
  tmpvar_20 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_16, tmpvar_19.w);
  mediump vec4 tmpvar_21;
  tmpvar_21 = tmpvar_20;
  mediump vec3 viewDir_22;
  viewDir_22 = -(tmpvar_8);
  mediump float specularTerm_23;
  mediump vec3 tmpvar_24;
  mediump vec3 inVec_25;
  inVec_25 = (_WorldSpaceLightPos0.xyz + viewDir_22);
  tmpvar_24 = (inVec_25 * inversesqrt(max (0.001, 
    dot (inVec_25, inVec_25)
  )));
  mediump float tmpvar_26;
  tmpvar_26 = clamp (dot (tmpvar_7, tmpvar_24), 0.0, 1.0);
  mediump float tmpvar_27;
  tmpvar_27 = (tmpvar_17 * tmpvar_17);
  specularTerm_23 = ((tmpvar_27 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_24), 0.0, 1.0)) * (1.5 + tmpvar_27))
   * 
    (((tmpvar_26 * tmpvar_26) * ((tmpvar_27 * tmpvar_27) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_28;
  tmpvar_28 = clamp (specularTerm_23, 0.0, 100.0);
  specularTerm_23 = tmpvar_28;
  mediump float x_29;
  x_29 = (1.0 - clamp (dot (tmpvar_7, viewDir_22), 0.0, 1.0));
  mediump vec3 tmpvar_30;
  tmpvar_30 = (((
    ((tmpvar_4 + (tmpvar_28 * tmpvar_5)) * tmpvar_9)
   * 
    clamp (dot (tmpvar_7, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_15)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_12)
   * tmpvar_4)) + ((
    (1.0 - ((tmpvar_27 * tmpvar_17) * 0.28))
   * 
    (((hdr_18.x * (
      (hdr_18.w * (tmpvar_21.w - 1.0))
     + 1.0)) * tmpvar_21.xyz) * occlusion_12)
  ) * mix (tmpvar_5, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_6)), 0.0, 1.0)
  ), vec3(
    ((x_29 * x_29) * (x_29 * x_29))
  ))));
  mediump vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = tmpvar_30;
  c_1.w = tmpvar_31.w;
  lowp vec4 tmpvar_32;
  tmpvar_32 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1.xyz = (tmpvar_30 + (tmpvar_32.xyz * _EmissionColor.xyz));
  mediump vec4 xlat_varoutput_33;
  xlat_varoutput_33.xyz = c_1.xyz;
  xlat_varoutput_33.w = 1.0;
  gl_FragData[0] = xlat_varoutput_33;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 87 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  mediump vec3 x1_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_20.x = dot (unity_SHBr, tmpvar_21);
  x1_20.y = dot (unity_SHBg, tmpvar_21);
  x1_20.z = dot (unity_SHBb, tmpvar_21);
  ambientOrLightmapUV_19.xyz = (x1_20 + (unity_SHC.xyz * (
    (normalWorld_18.x * normalWorld_18.x)
   - 
    (normalWorld_18.y * normalWorld_18.y)
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic));
  mediump float tmpvar_6;
  tmpvar_6 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_4 = (tmpvar_3 * tmpvar_6);
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_9;
  tmpvar_9 = _LightColor0.xyz;
  mediump float occ_10;
  lowp float tmpvar_11;
  tmpvar_11 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_10 = tmpvar_11;
  mediump float occlusion_12;
  occlusion_12 = ((1.0 - _OcclusionStrength) + (occ_10 * _OcclusionStrength));
  highp vec4 tmpvar_13;
  tmpvar_13 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_7;
  mediump vec3 x_15;
  x_15.x = dot (unity_SHAr, tmpvar_14);
  x_15.y = dot (unity_SHAg, tmpvar_14);
  x_15.z = dot (unity_SHAb, tmpvar_14);
  mediump vec3 tmpvar_16;
  mediump float tmpvar_17;
  tmpvar_17 = (1.0 - _Glossiness);
  tmpvar_16 = (tmpvar_8 - (2.0 * (
    dot (tmpvar_7, tmpvar_8)
   * tmpvar_7)));
  mediump vec4 hdr_18;
  hdr_18 = tmpvar_13;
  mediump vec4 tmpvar_19;
  tmpvar_19.xyz = tmpvar_16;
  tmpvar_19.w = ((tmpvar_17 * (1.7 - 
    (0.7 * tmpvar_17)
  )) * 6.0);
  lowp vec4 tmpvar_20;
  tmpvar_20 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_16, tmpvar_19.w);
  mediump vec4 tmpvar_21;
  tmpvar_21 = tmpvar_20;
  mediump vec3 viewDir_22;
  viewDir_22 = -(tmpvar_8);
  mediump float specularTerm_23;
  mediump vec3 tmpvar_24;
  mediump vec3 inVec_25;
  inVec_25 = (_WorldSpaceLightPos0.xyz + viewDir_22);
  tmpvar_24 = (inVec_25 * inversesqrt(max (0.001, 
    dot (inVec_25, inVec_25)
  )));
  mediump float tmpvar_26;
  tmpvar_26 = clamp (dot (tmpvar_7, tmpvar_24), 0.0, 1.0);
  mediump float tmpvar_27;
  tmpvar_27 = (tmpvar_17 * tmpvar_17);
  specularTerm_23 = ((tmpvar_27 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_24), 0.0, 1.0)) * (1.5 + tmpvar_27))
   * 
    (((tmpvar_26 * tmpvar_26) * ((tmpvar_27 * tmpvar_27) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_28;
  tmpvar_28 = clamp (specularTerm_23, 0.0, 100.0);
  specularTerm_23 = tmpvar_28;
  mediump float x_29;
  x_29 = (1.0 - clamp (dot (tmpvar_7, viewDir_22), 0.0, 1.0));
  mediump vec3 tmpvar_30;
  tmpvar_30 = (((
    ((tmpvar_4 + (tmpvar_28 * tmpvar_5)) * tmpvar_9)
   * 
    clamp (dot (tmpvar_7, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_15)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_12)
   * tmpvar_4)) + ((
    (1.0 - ((tmpvar_27 * tmpvar_17) * 0.28))
   * 
    (((hdr_18.x * (
      (hdr_18.w * (tmpvar_21.w - 1.0))
     + 1.0)) * tmpvar_21.xyz) * occlusion_12)
  ) * mix (tmpvar_5, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_6)), 0.0, 1.0)
  ), vec3(
    ((x_29 * x_29) * (x_29 * x_29))
  ))));
  mediump vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = tmpvar_30;
  c_1.w = tmpvar_31.w;
  lowp vec4 tmpvar_32;
  tmpvar_32 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1.xyz = (tmpvar_30 + (tmpvar_32.xyz * _EmissionColor.xyz));
  mediump vec4 xlat_varoutput_33;
  xlat_varoutput_33.xyz = c_1.xyz;
  xlat_varoutput_33.w = 1.0;
  gl_FragData[0] = xlat_varoutput_33;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN _EMISSION 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 44 math, 6 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  normalWorld_4 = tmpvar_17;
  tmpvar_8.xyz = normalWorld_4;
  tmpvar_6.xyz = eyeVec_5;
  mediump vec4 ambientOrLightmapUV_18;
  ambientOrLightmapUV_18.w = 0.0;
  mediump vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = normalWorld_4;
  mediump vec3 res_20;
  mediump vec3 x_21;
  x_21.x = dot (unity_SHAr, tmpvar_19);
  x_21.y = dot (unity_SHAg, tmpvar_19);
  x_21.z = dot (unity_SHAb, tmpvar_19);
  mediump vec3 x1_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normalWorld_4.xyzz * normalWorld_4.yzzx);
  x1_22.x = dot (unity_SHBr, tmpvar_23);
  x1_22.y = dot (unity_SHBg, tmpvar_23);
  x1_22.z = dot (unity_SHBb, tmpvar_23);
  res_20 = (x_21 + (x1_22 + (unity_SHC.xyz * 
    ((normalWorld_4.x * normalWorld_4.x) - (normalWorld_4.y * normalWorld_4.y))
  )));
  mediump vec3 tmpvar_24;
  tmpvar_24 = max (((1.055 * 
    pow (max (res_20, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_20 = tmpvar_24;
  ambientOrLightmapUV_18.xyz = max (vec3(0.0, 0.0, 0.0), tmpvar_24);
  tmpvar_7.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  mediump float x_25;
  x_25 = (1.0 - clamp (dot (normalWorld_4, 
    -(eyeVec_5)
  ), 0.0, 1.0));
  tmpvar_8.w = ((x_25 * x_25) * (x_25 * x_25));
  tmpvar_6.w = clamp ((_Glossiness + (1.0 - 
    (0.7790837 - (_Metallic * 0.7790837))
  )), 0.0, 1.0);
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = ambientOrLightmapUV_18;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 _LightShadowData;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  mediump float rl_2;
  mediump float realtimeShadowAttenuation_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  tmpvar_6 = (tmpvar_5 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_8;
  tmpvar_8 = _LightColor0.xyz;
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  realtimeShadowAttenuation_3 = tmpvar_9;
  mediump float occ_13;
  lowp float tmpvar_14;
  tmpvar_14 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_13 = tmpvar_14;
  rl_2 = dot (xlv_TEXCOORD4.yzw, _WorldSpaceLightPos0.xyz);
  mediump float occlusion_15;
  occlusion_15 = ((1.0 - _OcclusionStrength) + (occ_13 * _OcclusionStrength));
  highp vec4 tmpvar_16;
  tmpvar_16 = unity_SpecCube0_HDR;
  mediump float tmpvar_17;
  tmpvar_17 = (1.0 - _Glossiness);
  mediump vec4 hdr_18;
  hdr_18 = tmpvar_16;
  mediump vec4 tmpvar_19;
  tmpvar_19.xyz = xlv_TEXCOORD4.yzw;
  tmpvar_19.w = ((tmpvar_17 * (1.7 - 
    (0.7 * tmpvar_17)
  )) * 6.0);
  lowp vec4 tmpvar_20;
  tmpvar_20 = impl_low_textureCubeLodEXT (unity_SpecCube0, xlv_TEXCOORD4.yzw, tmpvar_19.w);
  mediump vec4 tmpvar_21;
  tmpvar_21 = tmpvar_20;
  mediump vec2 tmpvar_22;
  tmpvar_22.x = ((rl_2 * rl_2) * (rl_2 * rl_2));
  tmpvar_22.y = tmpvar_17;
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_NHxRoughness, tmpvar_22);
  c_1 = (((
    (xlv_TEXCOORD2.xyz * occlusion_15)
   * tmpvar_6) + (
    (((hdr_18.x * (
      (hdr_18.w * (tmpvar_21.w - 1.0))
     + 1.0)) * tmpvar_21.xyz) * occlusion_15)
   * 
    mix (tmpvar_7, xlv_TEXCOORD1.www, xlv_TEXCOORD5.www)
  )) + ((tmpvar_6 + 
    ((tmpvar_23.w * 16.0) * tmpvar_7)
  ) * (
    (tmpvar_8 * realtimeShadowAttenuation_3)
   * 
    clamp (dot (xlv_TEXCOORD5.xyz, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  )));
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1 = (c_1 + (tmpvar_24.xyz * _EmissionColor.xyz));
  mediump vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = c_1;
  mediump vec4 xlat_varoutput_26;
  xlat_varoutput_26.xyz = tmpvar_25.xyz;
  xlat_varoutput_26.w = 1.0;
  gl_FragData[0] = xlat_varoutput_26;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 104 math, 5 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  mediump vec3 x1_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_20.x = dot (unity_SHBr, tmpvar_21);
  x1_20.y = dot (unity_SHBg, tmpvar_21);
  x1_20.z = dot (unity_SHBb, tmpvar_21);
  ambientOrLightmapUV_19.xyz = (x1_20 + (unity_SHC.xyz * (
    (normalWorld_18.x * normalWorld_18.x)
   - 
    (normalWorld_18.y * normalWorld_18.y)
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp float atten_2;
  mediump vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  mediump float tmpvar_8;
  tmpvar_8 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_6 = (tmpvar_5 * tmpvar_8);
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_10;
  tmpvar_10 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  highp vec3 worldPos_12;
  worldPos_12 = tmpvar_3;
  mediump float realtimeShadowAttenuation_13;
  highp vec4 v_14;
  v_14.x = unity_MatrixV[0].z;
  v_14.y = unity_MatrixV[1].z;
  v_14.z = unity_MatrixV[2].z;
  v_14.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (worldPos_12 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_12), v_14.xyz), sqrt(dot (tmpvar_15, tmpvar_15)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_16 = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = worldPos_12;
  lowp float tmpvar_19;
  highp vec4 shadowCoord_20;
  shadowCoord_20 = (unity_WorldToShadow[0] * tmpvar_18);
  highp float lightShadowDataX_21;
  mediump float tmpvar_22;
  tmpvar_22 = _LightShadowData.x;
  lightShadowDataX_21 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = max (float((texture2D (_ShadowMapTexture, shadowCoord_20.xy).x > shadowCoord_20.z)), lightShadowDataX_21);
  tmpvar_19 = tmpvar_23;
  realtimeShadowAttenuation_13 = tmpvar_19;
  mediump float tmpvar_24;
  tmpvar_24 = clamp ((realtimeShadowAttenuation_13 + tmpvar_16), 0.0, 1.0);
  atten_2 = tmpvar_24;
  mediump float occ_25;
  lowp float tmpvar_26;
  tmpvar_26 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_25 = tmpvar_26;
  mediump float atten_27;
  atten_27 = atten_2;
  mediump float occlusion_28;
  occlusion_28 = ((1.0 - _OcclusionStrength) + (occ_25 * _OcclusionStrength));
  highp vec4 tmpvar_29;
  tmpvar_29 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = tmpvar_9;
  mediump vec3 x_31;
  x_31.x = dot (unity_SHAr, tmpvar_30);
  x_31.y = dot (unity_SHAg, tmpvar_30);
  x_31.z = dot (unity_SHAb, tmpvar_30);
  mediump vec3 tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = (1.0 - _Glossiness);
  tmpvar_32 = (tmpvar_10 - (2.0 * (
    dot (tmpvar_9, tmpvar_10)
   * tmpvar_9)));
  mediump vec4 hdr_34;
  hdr_34 = tmpvar_29;
  mediump vec4 tmpvar_35;
  tmpvar_35.xyz = tmpvar_32;
  tmpvar_35.w = ((tmpvar_33 * (1.7 - 
    (0.7 * tmpvar_33)
  )) * 6.0);
  lowp vec4 tmpvar_36;
  tmpvar_36 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_32, tmpvar_35.w);
  mediump vec4 tmpvar_37;
  tmpvar_37 = tmpvar_36;
  mediump vec3 viewDir_38;
  viewDir_38 = -(tmpvar_10);
  mediump float specularTerm_39;
  mediump vec3 tmpvar_40;
  mediump vec3 inVec_41;
  inVec_41 = (_WorldSpaceLightPos0.xyz + viewDir_38);
  tmpvar_40 = (inVec_41 * inversesqrt(max (0.001, 
    dot (inVec_41, inVec_41)
  )));
  mediump float tmpvar_42;
  tmpvar_42 = clamp (dot (tmpvar_9, tmpvar_40), 0.0, 1.0);
  mediump float tmpvar_43;
  tmpvar_43 = (tmpvar_33 * tmpvar_33);
  specularTerm_39 = ((tmpvar_43 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_40), 0.0, 1.0)) * (1.5 + tmpvar_43))
   * 
    (((tmpvar_42 * tmpvar_42) * ((tmpvar_43 * tmpvar_43) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_44;
  tmpvar_44 = clamp (specularTerm_39, 0.0, 100.0);
  specularTerm_39 = tmpvar_44;
  mediump float x_45;
  x_45 = (1.0 - clamp (dot (tmpvar_9, viewDir_38), 0.0, 1.0));
  mediump vec3 tmpvar_46;
  tmpvar_46 = (((
    ((tmpvar_6 + (tmpvar_44 * tmpvar_7)) * (tmpvar_11 * atten_27))
   * 
    clamp (dot (tmpvar_9, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_31)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_28)
   * tmpvar_6)) + ((
    (1.0 - ((tmpvar_43 * tmpvar_33) * 0.28))
   * 
    (((hdr_34.x * (
      (hdr_34.w * (tmpvar_37.w - 1.0))
     + 1.0)) * tmpvar_37.xyz) * occlusion_28)
  ) * mix (tmpvar_7, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_8)), 0.0, 1.0)
  ), vec3(
    ((x_45 * x_45) * (x_45 * x_45))
  ))));
  mediump vec4 tmpvar_47;
  tmpvar_47.w = 1.0;
  tmpvar_47.xyz = tmpvar_46;
  c_1.w = tmpvar_47.w;
  lowp vec4 tmpvar_48;
  tmpvar_48 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1.xyz = (tmpvar_46 + (tmpvar_48.xyz * _EmissionColor.xyz));
  mediump vec4 xlat_varoutput_49;
  xlat_varoutput_49.xyz = c_1.xyz;
  xlat_varoutput_49.w = 1.0;
  gl_FragData[0] = xlat_varoutput_49;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 104 math, 5 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  mediump vec3 x1_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_20.x = dot (unity_SHBr, tmpvar_21);
  x1_20.y = dot (unity_SHBg, tmpvar_21);
  x1_20.z = dot (unity_SHBb, tmpvar_21);
  ambientOrLightmapUV_19.xyz = (x1_20 + (unity_SHC.xyz * (
    (normalWorld_18.x * normalWorld_18.x)
   - 
    (normalWorld_18.y * normalWorld_18.y)
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp float atten_2;
  mediump vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  mediump float tmpvar_8;
  tmpvar_8 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_6 = (tmpvar_5 * tmpvar_8);
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_10;
  tmpvar_10 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  highp vec3 worldPos_12;
  worldPos_12 = tmpvar_3;
  mediump float realtimeShadowAttenuation_13;
  highp vec4 v_14;
  v_14.x = unity_MatrixV[0].z;
  v_14.y = unity_MatrixV[1].z;
  v_14.z = unity_MatrixV[2].z;
  v_14.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (worldPos_12 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_12), v_14.xyz), sqrt(dot (tmpvar_15, tmpvar_15)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_16 = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = worldPos_12;
  lowp float tmpvar_19;
  highp vec4 shadowCoord_20;
  shadowCoord_20 = (unity_WorldToShadow[0] * tmpvar_18);
  highp float lightShadowDataX_21;
  mediump float tmpvar_22;
  tmpvar_22 = _LightShadowData.x;
  lightShadowDataX_21 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = max (float((texture2D (_ShadowMapTexture, shadowCoord_20.xy).x > shadowCoord_20.z)), lightShadowDataX_21);
  tmpvar_19 = tmpvar_23;
  realtimeShadowAttenuation_13 = tmpvar_19;
  mediump float tmpvar_24;
  tmpvar_24 = clamp ((realtimeShadowAttenuation_13 + tmpvar_16), 0.0, 1.0);
  atten_2 = tmpvar_24;
  mediump float occ_25;
  lowp float tmpvar_26;
  tmpvar_26 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_25 = tmpvar_26;
  mediump float atten_27;
  atten_27 = atten_2;
  mediump float occlusion_28;
  occlusion_28 = ((1.0 - _OcclusionStrength) + (occ_25 * _OcclusionStrength));
  highp vec4 tmpvar_29;
  tmpvar_29 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = tmpvar_9;
  mediump vec3 x_31;
  x_31.x = dot (unity_SHAr, tmpvar_30);
  x_31.y = dot (unity_SHAg, tmpvar_30);
  x_31.z = dot (unity_SHAb, tmpvar_30);
  mediump vec3 tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = (1.0 - _Glossiness);
  tmpvar_32 = (tmpvar_10 - (2.0 * (
    dot (tmpvar_9, tmpvar_10)
   * tmpvar_9)));
  mediump vec4 hdr_34;
  hdr_34 = tmpvar_29;
  mediump vec4 tmpvar_35;
  tmpvar_35.xyz = tmpvar_32;
  tmpvar_35.w = ((tmpvar_33 * (1.7 - 
    (0.7 * tmpvar_33)
  )) * 6.0);
  lowp vec4 tmpvar_36;
  tmpvar_36 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_32, tmpvar_35.w);
  mediump vec4 tmpvar_37;
  tmpvar_37 = tmpvar_36;
  mediump vec3 viewDir_38;
  viewDir_38 = -(tmpvar_10);
  mediump float specularTerm_39;
  mediump vec3 tmpvar_40;
  mediump vec3 inVec_41;
  inVec_41 = (_WorldSpaceLightPos0.xyz + viewDir_38);
  tmpvar_40 = (inVec_41 * inversesqrt(max (0.001, 
    dot (inVec_41, inVec_41)
  )));
  mediump float tmpvar_42;
  tmpvar_42 = clamp (dot (tmpvar_9, tmpvar_40), 0.0, 1.0);
  mediump float tmpvar_43;
  tmpvar_43 = (tmpvar_33 * tmpvar_33);
  specularTerm_39 = ((tmpvar_43 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_40), 0.0, 1.0)) * (1.5 + tmpvar_43))
   * 
    (((tmpvar_42 * tmpvar_42) * ((tmpvar_43 * tmpvar_43) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_44;
  tmpvar_44 = clamp (specularTerm_39, 0.0, 100.0);
  specularTerm_39 = tmpvar_44;
  mediump float x_45;
  x_45 = (1.0 - clamp (dot (tmpvar_9, viewDir_38), 0.0, 1.0));
  mediump vec3 tmpvar_46;
  tmpvar_46 = (((
    ((tmpvar_6 + (tmpvar_44 * tmpvar_7)) * (tmpvar_11 * atten_27))
   * 
    clamp (dot (tmpvar_9, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_31)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_28)
   * tmpvar_6)) + ((
    (1.0 - ((tmpvar_43 * tmpvar_33) * 0.28))
   * 
    (((hdr_34.x * (
      (hdr_34.w * (tmpvar_37.w - 1.0))
     + 1.0)) * tmpvar_37.xyz) * occlusion_28)
  ) * mix (tmpvar_7, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_8)), 0.0, 1.0)
  ), vec3(
    ((x_45 * x_45) * (x_45 * x_45))
  ))));
  mediump vec4 tmpvar_47;
  tmpvar_47.w = 1.0;
  tmpvar_47.xyz = tmpvar_46;
  c_1.w = tmpvar_47.w;
  lowp vec4 tmpvar_48;
  tmpvar_48 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1.xyz = (tmpvar_46 + (tmpvar_48.xyz * _EmissionColor.xyz));
  mediump vec4 xlat_varoutput_49;
  xlat_varoutput_49.xyz = c_1.xyz;
  xlat_varoutput_49.w = 1.0;
  gl_FragData[0] = xlat_varoutput_49;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL _EMISSION VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 40 math, 5 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  normalWorld_4 = tmpvar_17;
  tmpvar_8.xyz = normalWorld_4;
  tmpvar_6.xyz = eyeVec_5;
  mediump vec4 ambientOrLightmapUV_18;
  ambientOrLightmapUV_18.w = 0.0;
  highp vec3 lightColor0_19;
  lightColor0_19 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_20;
  lightColor1_20 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_21;
  lightColor2_21 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_22;
  lightColor3_22 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_23;
  lightAttenSq_23 = unity_4LightAtten0;
  highp vec3 normal_24;
  normal_24 = normalWorld_4;
  highp vec3 col_25;
  highp vec4 ndotl_26;
  highp vec4 lengthSq_27;
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosX0 - tmpvar_9.x);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosY0 - tmpvar_9.y);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosZ0 - tmpvar_9.z);
  lengthSq_27 = (tmpvar_28 * tmpvar_28);
  lengthSq_27 = (lengthSq_27 + (tmpvar_29 * tmpvar_29));
  lengthSq_27 = (lengthSq_27 + (tmpvar_30 * tmpvar_30));
  highp vec4 tmpvar_31;
  tmpvar_31 = max (lengthSq_27, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_27 = tmpvar_31;
  ndotl_26 = (tmpvar_28 * normal_24.x);
  ndotl_26 = (ndotl_26 + (tmpvar_29 * normal_24.y));
  ndotl_26 = (ndotl_26 + (tmpvar_30 * normal_24.z));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_26 * inversesqrt(tmpvar_31)));
  ndotl_26 = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33 = (tmpvar_32 * (1.0/((1.0 + 
    (tmpvar_31 * lightAttenSq_23)
  ))));
  col_25 = (lightColor0_19 * tmpvar_33.x);
  col_25 = (col_25 + (lightColor1_20 * tmpvar_33.y));
  col_25 = (col_25 + (lightColor2_21 * tmpvar_33.z));
  col_25 = (col_25 + (lightColor3_22 * tmpvar_33.w));
  ambientOrLightmapUV_18.xyz = col_25;
  mediump vec4 tmpvar_34;
  tmpvar_34.w = 1.0;
  tmpvar_34.xyz = normalWorld_4;
  mediump vec3 res_35;
  mediump vec3 x_36;
  x_36.x = dot (unity_SHAr, tmpvar_34);
  x_36.y = dot (unity_SHAg, tmpvar_34);
  x_36.z = dot (unity_SHAb, tmpvar_34);
  mediump vec3 x1_37;
  mediump vec4 tmpvar_38;
  tmpvar_38 = (normalWorld_4.xyzz * normalWorld_4.yzzx);
  x1_37.x = dot (unity_SHBr, tmpvar_38);
  x1_37.y = dot (unity_SHBg, tmpvar_38);
  x1_37.z = dot (unity_SHBb, tmpvar_38);
  res_35 = (x_36 + (x1_37 + (unity_SHC.xyz * 
    ((normalWorld_4.x * normalWorld_4.x) - (normalWorld_4.y * normalWorld_4.y))
  )));
  mediump vec3 tmpvar_39;
  tmpvar_39 = max (((1.055 * 
    pow (max (res_35, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_35 = tmpvar_39;
  ambientOrLightmapUV_18.xyz = (ambientOrLightmapUV_18.xyz + max (vec3(0.0, 0.0, 0.0), tmpvar_39));
  tmpvar_7.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  mediump float x_40;
  x_40 = (1.0 - clamp (dot (normalWorld_4, 
    -(eyeVec_5)
  ), 0.0, 1.0));
  tmpvar_8.w = ((x_40 * x_40) * (x_40 * x_40));
  tmpvar_6.w = clamp ((_Glossiness + (1.0 - 
    (0.7790837 - (_Metallic * 0.7790837))
  )), 0.0, 1.0);
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = ambientOrLightmapUV_18;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  mediump float rl_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic));
  tmpvar_5 = (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_7;
  tmpvar_7 = _LightColor0.xyz;
  mediump float occ_8;
  lowp float tmpvar_9;
  tmpvar_9 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_8 = tmpvar_9;
  rl_2 = dot (xlv_TEXCOORD4.yzw, _WorldSpaceLightPos0.xyz);
  mediump float occlusion_10;
  occlusion_10 = ((1.0 - _OcclusionStrength) + (occ_8 * _OcclusionStrength));
  highp vec4 tmpvar_11;
  tmpvar_11 = unity_SpecCube0_HDR;
  mediump float tmpvar_12;
  tmpvar_12 = (1.0 - _Glossiness);
  mediump vec4 hdr_13;
  hdr_13 = tmpvar_11;
  mediump vec4 tmpvar_14;
  tmpvar_14.xyz = xlv_TEXCOORD4.yzw;
  tmpvar_14.w = ((tmpvar_12 * (1.7 - 
    (0.7 * tmpvar_12)
  )) * 6.0);
  lowp vec4 tmpvar_15;
  tmpvar_15 = impl_low_textureCubeLodEXT (unity_SpecCube0, xlv_TEXCOORD4.yzw, tmpvar_14.w);
  mediump vec4 tmpvar_16;
  tmpvar_16 = tmpvar_15;
  mediump vec2 tmpvar_17;
  tmpvar_17.x = ((rl_2 * rl_2) * (rl_2 * rl_2));
  tmpvar_17.y = tmpvar_12;
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (unity_NHxRoughness, tmpvar_17);
  c_1 = (((
    (xlv_TEXCOORD2.xyz * occlusion_10)
   * tmpvar_5) + (
    (((hdr_13.x * (
      (hdr_13.w * (tmpvar_16.w - 1.0))
     + 1.0)) * tmpvar_16.xyz) * occlusion_10)
   * 
    mix (tmpvar_6, xlv_TEXCOORD1.www, xlv_TEXCOORD5.www)
  )) + ((tmpvar_5 + 
    ((tmpvar_18.w * 16.0) * tmpvar_6)
  ) * (tmpvar_7 * 
    clamp (dot (xlv_TEXCOORD5.xyz, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  )));
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1 = (c_1 + (tmpvar_19.xyz * _EmissionColor.xyz));
  mediump vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = c_1;
  mediump vec4 xlat_varoutput_21;
  xlat_varoutput_21.xyz = tmpvar_20.xyz;
  xlat_varoutput_21.w = 1.0;
  gl_FragData[0] = xlat_varoutput_21;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 87 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  highp vec3 lightColor0_20;
  lightColor0_20 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_21;
  lightColor1_21 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_22;
  lightColor2_22 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_23;
  lightColor3_23 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_24;
  lightAttenSq_24 = unity_4LightAtten0;
  highp vec3 normal_25;
  normal_25 = normalWorld_18;
  highp vec3 col_26;
  highp vec4 ndotl_27;
  highp vec4 lengthSq_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_28 = (tmpvar_29 * tmpvar_29);
  lengthSq_28 = (lengthSq_28 + (tmpvar_30 * tmpvar_30));
  lengthSq_28 = (lengthSq_28 + (tmpvar_31 * tmpvar_31));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (lengthSq_28, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_28 = tmpvar_32;
  ndotl_27 = (tmpvar_29 * normal_25.x);
  ndotl_27 = (ndotl_27 + (tmpvar_30 * normal_25.y));
  ndotl_27 = (ndotl_27 + (tmpvar_31 * normal_25.z));
  highp vec4 tmpvar_33;
  tmpvar_33 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_27 * inversesqrt(tmpvar_32)));
  ndotl_27 = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34 = (tmpvar_33 * (1.0/((1.0 + 
    (tmpvar_32 * lightAttenSq_24)
  ))));
  col_26 = (lightColor0_20 * tmpvar_34.x);
  col_26 = (col_26 + (lightColor1_21 * tmpvar_34.y));
  col_26 = (col_26 + (lightColor2_22 * tmpvar_34.z));
  col_26 = (col_26 + (lightColor3_23 * tmpvar_34.w));
  ambientOrLightmapUV_19.xyz = col_26;
  mediump vec3 x1_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_35.x = dot (unity_SHBr, tmpvar_36);
  x1_35.y = dot (unity_SHBg, tmpvar_36);
  x1_35.z = dot (unity_SHBb, tmpvar_36);
  ambientOrLightmapUV_19.xyz = ((ambientOrLightmapUV_19.xyz * (
    (ambientOrLightmapUV_19.xyz * ((ambientOrLightmapUV_19.xyz * 0.305306) + 0.6821711))
   + 0.01252288)) + (x1_35 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic));
  mediump float tmpvar_6;
  tmpvar_6 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_4 = (tmpvar_3 * tmpvar_6);
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_9;
  tmpvar_9 = _LightColor0.xyz;
  mediump float occ_10;
  lowp float tmpvar_11;
  tmpvar_11 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_10 = tmpvar_11;
  mediump float occlusion_12;
  occlusion_12 = ((1.0 - _OcclusionStrength) + (occ_10 * _OcclusionStrength));
  highp vec4 tmpvar_13;
  tmpvar_13 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_7;
  mediump vec3 x_15;
  x_15.x = dot (unity_SHAr, tmpvar_14);
  x_15.y = dot (unity_SHAg, tmpvar_14);
  x_15.z = dot (unity_SHAb, tmpvar_14);
  mediump vec3 tmpvar_16;
  mediump float tmpvar_17;
  tmpvar_17 = (1.0 - _Glossiness);
  tmpvar_16 = (tmpvar_8 - (2.0 * (
    dot (tmpvar_7, tmpvar_8)
   * tmpvar_7)));
  mediump vec4 hdr_18;
  hdr_18 = tmpvar_13;
  mediump vec4 tmpvar_19;
  tmpvar_19.xyz = tmpvar_16;
  tmpvar_19.w = ((tmpvar_17 * (1.7 - 
    (0.7 * tmpvar_17)
  )) * 6.0);
  lowp vec4 tmpvar_20;
  tmpvar_20 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_16, tmpvar_19.w);
  mediump vec4 tmpvar_21;
  tmpvar_21 = tmpvar_20;
  mediump vec3 viewDir_22;
  viewDir_22 = -(tmpvar_8);
  mediump float specularTerm_23;
  mediump vec3 tmpvar_24;
  mediump vec3 inVec_25;
  inVec_25 = (_WorldSpaceLightPos0.xyz + viewDir_22);
  tmpvar_24 = (inVec_25 * inversesqrt(max (0.001, 
    dot (inVec_25, inVec_25)
  )));
  mediump float tmpvar_26;
  tmpvar_26 = clamp (dot (tmpvar_7, tmpvar_24), 0.0, 1.0);
  mediump float tmpvar_27;
  tmpvar_27 = (tmpvar_17 * tmpvar_17);
  specularTerm_23 = ((tmpvar_27 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_24), 0.0, 1.0)) * (1.5 + tmpvar_27))
   * 
    (((tmpvar_26 * tmpvar_26) * ((tmpvar_27 * tmpvar_27) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_28;
  tmpvar_28 = clamp (specularTerm_23, 0.0, 100.0);
  specularTerm_23 = tmpvar_28;
  mediump float x_29;
  x_29 = (1.0 - clamp (dot (tmpvar_7, viewDir_22), 0.0, 1.0));
  mediump vec3 tmpvar_30;
  tmpvar_30 = (((
    ((tmpvar_4 + (tmpvar_28 * tmpvar_5)) * tmpvar_9)
   * 
    clamp (dot (tmpvar_7, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_15)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_12)
   * tmpvar_4)) + ((
    (1.0 - ((tmpvar_27 * tmpvar_17) * 0.28))
   * 
    (((hdr_18.x * (
      (hdr_18.w * (tmpvar_21.w - 1.0))
     + 1.0)) * tmpvar_21.xyz) * occlusion_12)
  ) * mix (tmpvar_5, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_6)), 0.0, 1.0)
  ), vec3(
    ((x_29 * x_29) * (x_29 * x_29))
  ))));
  mediump vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = tmpvar_30;
  c_1.w = tmpvar_31.w;
  lowp vec4 tmpvar_32;
  tmpvar_32 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1.xyz = (tmpvar_30 + (tmpvar_32.xyz * _EmissionColor.xyz));
  mediump vec4 xlat_varoutput_33;
  xlat_varoutput_33.xyz = c_1.xyz;
  xlat_varoutput_33.w = 1.0;
  gl_FragData[0] = xlat_varoutput_33;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 87 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  highp vec3 lightColor0_20;
  lightColor0_20 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_21;
  lightColor1_21 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_22;
  lightColor2_22 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_23;
  lightColor3_23 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_24;
  lightAttenSq_24 = unity_4LightAtten0;
  highp vec3 normal_25;
  normal_25 = normalWorld_18;
  highp vec3 col_26;
  highp vec4 ndotl_27;
  highp vec4 lengthSq_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_28 = (tmpvar_29 * tmpvar_29);
  lengthSq_28 = (lengthSq_28 + (tmpvar_30 * tmpvar_30));
  lengthSq_28 = (lengthSq_28 + (tmpvar_31 * tmpvar_31));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (lengthSq_28, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_28 = tmpvar_32;
  ndotl_27 = (tmpvar_29 * normal_25.x);
  ndotl_27 = (ndotl_27 + (tmpvar_30 * normal_25.y));
  ndotl_27 = (ndotl_27 + (tmpvar_31 * normal_25.z));
  highp vec4 tmpvar_33;
  tmpvar_33 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_27 * inversesqrt(tmpvar_32)));
  ndotl_27 = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34 = (tmpvar_33 * (1.0/((1.0 + 
    (tmpvar_32 * lightAttenSq_24)
  ))));
  col_26 = (lightColor0_20 * tmpvar_34.x);
  col_26 = (col_26 + (lightColor1_21 * tmpvar_34.y));
  col_26 = (col_26 + (lightColor2_22 * tmpvar_34.z));
  col_26 = (col_26 + (lightColor3_23 * tmpvar_34.w));
  ambientOrLightmapUV_19.xyz = col_26;
  mediump vec3 x1_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_35.x = dot (unity_SHBr, tmpvar_36);
  x1_35.y = dot (unity_SHBg, tmpvar_36);
  x1_35.z = dot (unity_SHBb, tmpvar_36);
  ambientOrLightmapUV_19.xyz = ((ambientOrLightmapUV_19.xyz * (
    (ambientOrLightmapUV_19.xyz * ((ambientOrLightmapUV_19.xyz * 0.305306) + 0.6821711))
   + 0.01252288)) + (x1_35 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic));
  mediump float tmpvar_6;
  tmpvar_6 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_4 = (tmpvar_3 * tmpvar_6);
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_9;
  tmpvar_9 = _LightColor0.xyz;
  mediump float occ_10;
  lowp float tmpvar_11;
  tmpvar_11 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_10 = tmpvar_11;
  mediump float occlusion_12;
  occlusion_12 = ((1.0 - _OcclusionStrength) + (occ_10 * _OcclusionStrength));
  highp vec4 tmpvar_13;
  tmpvar_13 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_7;
  mediump vec3 x_15;
  x_15.x = dot (unity_SHAr, tmpvar_14);
  x_15.y = dot (unity_SHAg, tmpvar_14);
  x_15.z = dot (unity_SHAb, tmpvar_14);
  mediump vec3 tmpvar_16;
  mediump float tmpvar_17;
  tmpvar_17 = (1.0 - _Glossiness);
  tmpvar_16 = (tmpvar_8 - (2.0 * (
    dot (tmpvar_7, tmpvar_8)
   * tmpvar_7)));
  mediump vec4 hdr_18;
  hdr_18 = tmpvar_13;
  mediump vec4 tmpvar_19;
  tmpvar_19.xyz = tmpvar_16;
  tmpvar_19.w = ((tmpvar_17 * (1.7 - 
    (0.7 * tmpvar_17)
  )) * 6.0);
  lowp vec4 tmpvar_20;
  tmpvar_20 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_16, tmpvar_19.w);
  mediump vec4 tmpvar_21;
  tmpvar_21 = tmpvar_20;
  mediump vec3 viewDir_22;
  viewDir_22 = -(tmpvar_8);
  mediump float specularTerm_23;
  mediump vec3 tmpvar_24;
  mediump vec3 inVec_25;
  inVec_25 = (_WorldSpaceLightPos0.xyz + viewDir_22);
  tmpvar_24 = (inVec_25 * inversesqrt(max (0.001, 
    dot (inVec_25, inVec_25)
  )));
  mediump float tmpvar_26;
  tmpvar_26 = clamp (dot (tmpvar_7, tmpvar_24), 0.0, 1.0);
  mediump float tmpvar_27;
  tmpvar_27 = (tmpvar_17 * tmpvar_17);
  specularTerm_23 = ((tmpvar_27 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_24), 0.0, 1.0)) * (1.5 + tmpvar_27))
   * 
    (((tmpvar_26 * tmpvar_26) * ((tmpvar_27 * tmpvar_27) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_28;
  tmpvar_28 = clamp (specularTerm_23, 0.0, 100.0);
  specularTerm_23 = tmpvar_28;
  mediump float x_29;
  x_29 = (1.0 - clamp (dot (tmpvar_7, viewDir_22), 0.0, 1.0));
  mediump vec3 tmpvar_30;
  tmpvar_30 = (((
    ((tmpvar_4 + (tmpvar_28 * tmpvar_5)) * tmpvar_9)
   * 
    clamp (dot (tmpvar_7, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_15)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_12)
   * tmpvar_4)) + ((
    (1.0 - ((tmpvar_27 * tmpvar_17) * 0.28))
   * 
    (((hdr_18.x * (
      (hdr_18.w * (tmpvar_21.w - 1.0))
     + 1.0)) * tmpvar_21.xyz) * occlusion_12)
  ) * mix (tmpvar_5, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_6)), 0.0, 1.0)
  ), vec3(
    ((x_29 * x_29) * (x_29 * x_29))
  ))));
  mediump vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = tmpvar_30;
  c_1.w = tmpvar_31.w;
  lowp vec4 tmpvar_32;
  tmpvar_32 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1.xyz = (tmpvar_30 + (tmpvar_32.xyz * _EmissionColor.xyz));
  mediump vec4 xlat_varoutput_33;
  xlat_varoutput_33.xyz = c_1.xyz;
  xlat_varoutput_33.w = 1.0;
  gl_FragData[0] = xlat_varoutput_33;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN _EMISSION VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 44 math, 6 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  normalWorld_4 = tmpvar_17;
  tmpvar_8.xyz = normalWorld_4;
  tmpvar_6.xyz = eyeVec_5;
  mediump vec4 ambientOrLightmapUV_18;
  ambientOrLightmapUV_18.w = 0.0;
  highp vec3 lightColor0_19;
  lightColor0_19 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_20;
  lightColor1_20 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_21;
  lightColor2_21 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_22;
  lightColor3_22 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_23;
  lightAttenSq_23 = unity_4LightAtten0;
  highp vec3 normal_24;
  normal_24 = normalWorld_4;
  highp vec3 col_25;
  highp vec4 ndotl_26;
  highp vec4 lengthSq_27;
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosX0 - tmpvar_9.x);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosY0 - tmpvar_9.y);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosZ0 - tmpvar_9.z);
  lengthSq_27 = (tmpvar_28 * tmpvar_28);
  lengthSq_27 = (lengthSq_27 + (tmpvar_29 * tmpvar_29));
  lengthSq_27 = (lengthSq_27 + (tmpvar_30 * tmpvar_30));
  highp vec4 tmpvar_31;
  tmpvar_31 = max (lengthSq_27, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_27 = tmpvar_31;
  ndotl_26 = (tmpvar_28 * normal_24.x);
  ndotl_26 = (ndotl_26 + (tmpvar_29 * normal_24.y));
  ndotl_26 = (ndotl_26 + (tmpvar_30 * normal_24.z));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_26 * inversesqrt(tmpvar_31)));
  ndotl_26 = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33 = (tmpvar_32 * (1.0/((1.0 + 
    (tmpvar_31 * lightAttenSq_23)
  ))));
  col_25 = (lightColor0_19 * tmpvar_33.x);
  col_25 = (col_25 + (lightColor1_20 * tmpvar_33.y));
  col_25 = (col_25 + (lightColor2_21 * tmpvar_33.z));
  col_25 = (col_25 + (lightColor3_22 * tmpvar_33.w));
  ambientOrLightmapUV_18.xyz = col_25;
  mediump vec4 tmpvar_34;
  tmpvar_34.w = 1.0;
  tmpvar_34.xyz = normalWorld_4;
  mediump vec3 res_35;
  mediump vec3 x_36;
  x_36.x = dot (unity_SHAr, tmpvar_34);
  x_36.y = dot (unity_SHAg, tmpvar_34);
  x_36.z = dot (unity_SHAb, tmpvar_34);
  mediump vec3 x1_37;
  mediump vec4 tmpvar_38;
  tmpvar_38 = (normalWorld_4.xyzz * normalWorld_4.yzzx);
  x1_37.x = dot (unity_SHBr, tmpvar_38);
  x1_37.y = dot (unity_SHBg, tmpvar_38);
  x1_37.z = dot (unity_SHBb, tmpvar_38);
  res_35 = (x_36 + (x1_37 + (unity_SHC.xyz * 
    ((normalWorld_4.x * normalWorld_4.x) - (normalWorld_4.y * normalWorld_4.y))
  )));
  mediump vec3 tmpvar_39;
  tmpvar_39 = max (((1.055 * 
    pow (max (res_35, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_35 = tmpvar_39;
  ambientOrLightmapUV_18.xyz = (ambientOrLightmapUV_18.xyz + max (vec3(0.0, 0.0, 0.0), tmpvar_39));
  tmpvar_7.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  mediump float x_40;
  x_40 = (1.0 - clamp (dot (normalWorld_4, 
    -(eyeVec_5)
  ), 0.0, 1.0));
  tmpvar_8.w = ((x_40 * x_40) * (x_40 * x_40));
  tmpvar_6.w = clamp ((_Glossiness + (1.0 - 
    (0.7790837 - (_Metallic * 0.7790837))
  )), 0.0, 1.0);
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = ambientOrLightmapUV_18;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 _LightShadowData;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  mediump float rl_2;
  mediump float realtimeShadowAttenuation_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  tmpvar_6 = (tmpvar_5 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_8;
  tmpvar_8 = _LightColor0.xyz;
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  realtimeShadowAttenuation_3 = tmpvar_9;
  mediump float occ_13;
  lowp float tmpvar_14;
  tmpvar_14 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_13 = tmpvar_14;
  rl_2 = dot (xlv_TEXCOORD4.yzw, _WorldSpaceLightPos0.xyz);
  mediump float occlusion_15;
  occlusion_15 = ((1.0 - _OcclusionStrength) + (occ_13 * _OcclusionStrength));
  highp vec4 tmpvar_16;
  tmpvar_16 = unity_SpecCube0_HDR;
  mediump float tmpvar_17;
  tmpvar_17 = (1.0 - _Glossiness);
  mediump vec4 hdr_18;
  hdr_18 = tmpvar_16;
  mediump vec4 tmpvar_19;
  tmpvar_19.xyz = xlv_TEXCOORD4.yzw;
  tmpvar_19.w = ((tmpvar_17 * (1.7 - 
    (0.7 * tmpvar_17)
  )) * 6.0);
  lowp vec4 tmpvar_20;
  tmpvar_20 = impl_low_textureCubeLodEXT (unity_SpecCube0, xlv_TEXCOORD4.yzw, tmpvar_19.w);
  mediump vec4 tmpvar_21;
  tmpvar_21 = tmpvar_20;
  mediump vec2 tmpvar_22;
  tmpvar_22.x = ((rl_2 * rl_2) * (rl_2 * rl_2));
  tmpvar_22.y = tmpvar_17;
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_NHxRoughness, tmpvar_22);
  c_1 = (((
    (xlv_TEXCOORD2.xyz * occlusion_15)
   * tmpvar_6) + (
    (((hdr_18.x * (
      (hdr_18.w * (tmpvar_21.w - 1.0))
     + 1.0)) * tmpvar_21.xyz) * occlusion_15)
   * 
    mix (tmpvar_7, xlv_TEXCOORD1.www, xlv_TEXCOORD5.www)
  )) + ((tmpvar_6 + 
    ((tmpvar_23.w * 16.0) * tmpvar_7)
  ) * (
    (tmpvar_8 * realtimeShadowAttenuation_3)
   * 
    clamp (dot (xlv_TEXCOORD5.xyz, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  )));
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1 = (c_1 + (tmpvar_24.xyz * _EmissionColor.xyz));
  mediump vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = c_1;
  mediump vec4 xlat_varoutput_26;
  xlat_varoutput_26.xyz = tmpvar_25.xyz;
  xlat_varoutput_26.w = 1.0;
  gl_FragData[0] = xlat_varoutput_26;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 104 math, 5 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  highp vec3 lightColor0_20;
  lightColor0_20 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_21;
  lightColor1_21 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_22;
  lightColor2_22 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_23;
  lightColor3_23 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_24;
  lightAttenSq_24 = unity_4LightAtten0;
  highp vec3 normal_25;
  normal_25 = normalWorld_18;
  highp vec3 col_26;
  highp vec4 ndotl_27;
  highp vec4 lengthSq_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_28 = (tmpvar_29 * tmpvar_29);
  lengthSq_28 = (lengthSq_28 + (tmpvar_30 * tmpvar_30));
  lengthSq_28 = (lengthSq_28 + (tmpvar_31 * tmpvar_31));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (lengthSq_28, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_28 = tmpvar_32;
  ndotl_27 = (tmpvar_29 * normal_25.x);
  ndotl_27 = (ndotl_27 + (tmpvar_30 * normal_25.y));
  ndotl_27 = (ndotl_27 + (tmpvar_31 * normal_25.z));
  highp vec4 tmpvar_33;
  tmpvar_33 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_27 * inversesqrt(tmpvar_32)));
  ndotl_27 = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34 = (tmpvar_33 * (1.0/((1.0 + 
    (tmpvar_32 * lightAttenSq_24)
  ))));
  col_26 = (lightColor0_20 * tmpvar_34.x);
  col_26 = (col_26 + (lightColor1_21 * tmpvar_34.y));
  col_26 = (col_26 + (lightColor2_22 * tmpvar_34.z));
  col_26 = (col_26 + (lightColor3_23 * tmpvar_34.w));
  ambientOrLightmapUV_19.xyz = col_26;
  mediump vec3 x1_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_35.x = dot (unity_SHBr, tmpvar_36);
  x1_35.y = dot (unity_SHBg, tmpvar_36);
  x1_35.z = dot (unity_SHBb, tmpvar_36);
  ambientOrLightmapUV_19.xyz = ((ambientOrLightmapUV_19.xyz * (
    (ambientOrLightmapUV_19.xyz * ((ambientOrLightmapUV_19.xyz * 0.305306) + 0.6821711))
   + 0.01252288)) + (x1_35 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp float atten_2;
  mediump vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  mediump float tmpvar_8;
  tmpvar_8 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_6 = (tmpvar_5 * tmpvar_8);
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_10;
  tmpvar_10 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  highp vec3 worldPos_12;
  worldPos_12 = tmpvar_3;
  mediump float realtimeShadowAttenuation_13;
  highp vec4 v_14;
  v_14.x = unity_MatrixV[0].z;
  v_14.y = unity_MatrixV[1].z;
  v_14.z = unity_MatrixV[2].z;
  v_14.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (worldPos_12 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_12), v_14.xyz), sqrt(dot (tmpvar_15, tmpvar_15)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_16 = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = worldPos_12;
  lowp float tmpvar_19;
  highp vec4 shadowCoord_20;
  shadowCoord_20 = (unity_WorldToShadow[0] * tmpvar_18);
  highp float lightShadowDataX_21;
  mediump float tmpvar_22;
  tmpvar_22 = _LightShadowData.x;
  lightShadowDataX_21 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = max (float((texture2D (_ShadowMapTexture, shadowCoord_20.xy).x > shadowCoord_20.z)), lightShadowDataX_21);
  tmpvar_19 = tmpvar_23;
  realtimeShadowAttenuation_13 = tmpvar_19;
  mediump float tmpvar_24;
  tmpvar_24 = clamp ((realtimeShadowAttenuation_13 + tmpvar_16), 0.0, 1.0);
  atten_2 = tmpvar_24;
  mediump float occ_25;
  lowp float tmpvar_26;
  tmpvar_26 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_25 = tmpvar_26;
  mediump float atten_27;
  atten_27 = atten_2;
  mediump float occlusion_28;
  occlusion_28 = ((1.0 - _OcclusionStrength) + (occ_25 * _OcclusionStrength));
  highp vec4 tmpvar_29;
  tmpvar_29 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = tmpvar_9;
  mediump vec3 x_31;
  x_31.x = dot (unity_SHAr, tmpvar_30);
  x_31.y = dot (unity_SHAg, tmpvar_30);
  x_31.z = dot (unity_SHAb, tmpvar_30);
  mediump vec3 tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = (1.0 - _Glossiness);
  tmpvar_32 = (tmpvar_10 - (2.0 * (
    dot (tmpvar_9, tmpvar_10)
   * tmpvar_9)));
  mediump vec4 hdr_34;
  hdr_34 = tmpvar_29;
  mediump vec4 tmpvar_35;
  tmpvar_35.xyz = tmpvar_32;
  tmpvar_35.w = ((tmpvar_33 * (1.7 - 
    (0.7 * tmpvar_33)
  )) * 6.0);
  lowp vec4 tmpvar_36;
  tmpvar_36 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_32, tmpvar_35.w);
  mediump vec4 tmpvar_37;
  tmpvar_37 = tmpvar_36;
  mediump vec3 viewDir_38;
  viewDir_38 = -(tmpvar_10);
  mediump float specularTerm_39;
  mediump vec3 tmpvar_40;
  mediump vec3 inVec_41;
  inVec_41 = (_WorldSpaceLightPos0.xyz + viewDir_38);
  tmpvar_40 = (inVec_41 * inversesqrt(max (0.001, 
    dot (inVec_41, inVec_41)
  )));
  mediump float tmpvar_42;
  tmpvar_42 = clamp (dot (tmpvar_9, tmpvar_40), 0.0, 1.0);
  mediump float tmpvar_43;
  tmpvar_43 = (tmpvar_33 * tmpvar_33);
  specularTerm_39 = ((tmpvar_43 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_40), 0.0, 1.0)) * (1.5 + tmpvar_43))
   * 
    (((tmpvar_42 * tmpvar_42) * ((tmpvar_43 * tmpvar_43) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_44;
  tmpvar_44 = clamp (specularTerm_39, 0.0, 100.0);
  specularTerm_39 = tmpvar_44;
  mediump float x_45;
  x_45 = (1.0 - clamp (dot (tmpvar_9, viewDir_38), 0.0, 1.0));
  mediump vec3 tmpvar_46;
  tmpvar_46 = (((
    ((tmpvar_6 + (tmpvar_44 * tmpvar_7)) * (tmpvar_11 * atten_27))
   * 
    clamp (dot (tmpvar_9, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_31)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_28)
   * tmpvar_6)) + ((
    (1.0 - ((tmpvar_43 * tmpvar_33) * 0.28))
   * 
    (((hdr_34.x * (
      (hdr_34.w * (tmpvar_37.w - 1.0))
     + 1.0)) * tmpvar_37.xyz) * occlusion_28)
  ) * mix (tmpvar_7, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_8)), 0.0, 1.0)
  ), vec3(
    ((x_45 * x_45) * (x_45 * x_45))
  ))));
  mediump vec4 tmpvar_47;
  tmpvar_47.w = 1.0;
  tmpvar_47.xyz = tmpvar_46;
  c_1.w = tmpvar_47.w;
  lowp vec4 tmpvar_48;
  tmpvar_48 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1.xyz = (tmpvar_46 + (tmpvar_48.xyz * _EmissionColor.xyz));
  mediump vec4 xlat_varoutput_49;
  xlat_varoutput_49.xyz = c_1.xyz;
  xlat_varoutput_49.w = 1.0;
  gl_FragData[0] = xlat_varoutput_49;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 104 math, 5 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  highp vec3 lightColor0_20;
  lightColor0_20 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_21;
  lightColor1_21 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_22;
  lightColor2_22 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_23;
  lightColor3_23 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_24;
  lightAttenSq_24 = unity_4LightAtten0;
  highp vec3 normal_25;
  normal_25 = normalWorld_18;
  highp vec3 col_26;
  highp vec4 ndotl_27;
  highp vec4 lengthSq_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_28 = (tmpvar_29 * tmpvar_29);
  lengthSq_28 = (lengthSq_28 + (tmpvar_30 * tmpvar_30));
  lengthSq_28 = (lengthSq_28 + (tmpvar_31 * tmpvar_31));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (lengthSq_28, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_28 = tmpvar_32;
  ndotl_27 = (tmpvar_29 * normal_25.x);
  ndotl_27 = (ndotl_27 + (tmpvar_30 * normal_25.y));
  ndotl_27 = (ndotl_27 + (tmpvar_31 * normal_25.z));
  highp vec4 tmpvar_33;
  tmpvar_33 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_27 * inversesqrt(tmpvar_32)));
  ndotl_27 = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34 = (tmpvar_33 * (1.0/((1.0 + 
    (tmpvar_32 * lightAttenSq_24)
  ))));
  col_26 = (lightColor0_20 * tmpvar_34.x);
  col_26 = (col_26 + (lightColor1_21 * tmpvar_34.y));
  col_26 = (col_26 + (lightColor2_22 * tmpvar_34.z));
  col_26 = (col_26 + (lightColor3_23 * tmpvar_34.w));
  ambientOrLightmapUV_19.xyz = col_26;
  mediump vec3 x1_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_35.x = dot (unity_SHBr, tmpvar_36);
  x1_35.y = dot (unity_SHBg, tmpvar_36);
  x1_35.z = dot (unity_SHBb, tmpvar_36);
  ambientOrLightmapUV_19.xyz = ((ambientOrLightmapUV_19.xyz * (
    (ambientOrLightmapUV_19.xyz * ((ambientOrLightmapUV_19.xyz * 0.305306) + 0.6821711))
   + 0.01252288)) + (x1_35 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp float atten_2;
  mediump vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  mediump float tmpvar_8;
  tmpvar_8 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_6 = (tmpvar_5 * tmpvar_8);
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_10;
  tmpvar_10 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  highp vec3 worldPos_12;
  worldPos_12 = tmpvar_3;
  mediump float realtimeShadowAttenuation_13;
  highp vec4 v_14;
  v_14.x = unity_MatrixV[0].z;
  v_14.y = unity_MatrixV[1].z;
  v_14.z = unity_MatrixV[2].z;
  v_14.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (worldPos_12 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_12), v_14.xyz), sqrt(dot (tmpvar_15, tmpvar_15)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_16 = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = worldPos_12;
  lowp float tmpvar_19;
  highp vec4 shadowCoord_20;
  shadowCoord_20 = (unity_WorldToShadow[0] * tmpvar_18);
  highp float lightShadowDataX_21;
  mediump float tmpvar_22;
  tmpvar_22 = _LightShadowData.x;
  lightShadowDataX_21 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = max (float((texture2D (_ShadowMapTexture, shadowCoord_20.xy).x > shadowCoord_20.z)), lightShadowDataX_21);
  tmpvar_19 = tmpvar_23;
  realtimeShadowAttenuation_13 = tmpvar_19;
  mediump float tmpvar_24;
  tmpvar_24 = clamp ((realtimeShadowAttenuation_13 + tmpvar_16), 0.0, 1.0);
  atten_2 = tmpvar_24;
  mediump float occ_25;
  lowp float tmpvar_26;
  tmpvar_26 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_25 = tmpvar_26;
  mediump float atten_27;
  atten_27 = atten_2;
  mediump float occlusion_28;
  occlusion_28 = ((1.0 - _OcclusionStrength) + (occ_25 * _OcclusionStrength));
  highp vec4 tmpvar_29;
  tmpvar_29 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = tmpvar_9;
  mediump vec3 x_31;
  x_31.x = dot (unity_SHAr, tmpvar_30);
  x_31.y = dot (unity_SHAg, tmpvar_30);
  x_31.z = dot (unity_SHAb, tmpvar_30);
  mediump vec3 tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = (1.0 - _Glossiness);
  tmpvar_32 = (tmpvar_10 - (2.0 * (
    dot (tmpvar_9, tmpvar_10)
   * tmpvar_9)));
  mediump vec4 hdr_34;
  hdr_34 = tmpvar_29;
  mediump vec4 tmpvar_35;
  tmpvar_35.xyz = tmpvar_32;
  tmpvar_35.w = ((tmpvar_33 * (1.7 - 
    (0.7 * tmpvar_33)
  )) * 6.0);
  lowp vec4 tmpvar_36;
  tmpvar_36 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_32, tmpvar_35.w);
  mediump vec4 tmpvar_37;
  tmpvar_37 = tmpvar_36;
  mediump vec3 viewDir_38;
  viewDir_38 = -(tmpvar_10);
  mediump float specularTerm_39;
  mediump vec3 tmpvar_40;
  mediump vec3 inVec_41;
  inVec_41 = (_WorldSpaceLightPos0.xyz + viewDir_38);
  tmpvar_40 = (inVec_41 * inversesqrt(max (0.001, 
    dot (inVec_41, inVec_41)
  )));
  mediump float tmpvar_42;
  tmpvar_42 = clamp (dot (tmpvar_9, tmpvar_40), 0.0, 1.0);
  mediump float tmpvar_43;
  tmpvar_43 = (tmpvar_33 * tmpvar_33);
  specularTerm_39 = ((tmpvar_43 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_40), 0.0, 1.0)) * (1.5 + tmpvar_43))
   * 
    (((tmpvar_42 * tmpvar_42) * ((tmpvar_43 * tmpvar_43) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_44;
  tmpvar_44 = clamp (specularTerm_39, 0.0, 100.0);
  specularTerm_39 = tmpvar_44;
  mediump float x_45;
  x_45 = (1.0 - clamp (dot (tmpvar_9, viewDir_38), 0.0, 1.0));
  mediump vec3 tmpvar_46;
  tmpvar_46 = (((
    ((tmpvar_6 + (tmpvar_44 * tmpvar_7)) * (tmpvar_11 * atten_27))
   * 
    clamp (dot (tmpvar_9, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_31)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_28)
   * tmpvar_6)) + ((
    (1.0 - ((tmpvar_43 * tmpvar_33) * 0.28))
   * 
    (((hdr_34.x * (
      (hdr_34.w * (tmpvar_37.w - 1.0))
     + 1.0)) * tmpvar_37.xyz) * occlusion_28)
  ) * mix (tmpvar_7, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_8)), 0.0, 1.0)
  ), vec3(
    ((x_45 * x_45) * (x_45 * x_45))
  ))));
  mediump vec4 tmpvar_47;
  tmpvar_47.w = 1.0;
  tmpvar_47.xyz = tmpvar_46;
  c_1.w = tmpvar_47.w;
  lowp vec4 tmpvar_48;
  tmpvar_48 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1.xyz = (tmpvar_46 + (tmpvar_48.xyz * _EmissionColor.xyz));
  mediump vec4 xlat_varoutput_49;
  xlat_varoutput_49.xyz = c_1.xyz;
  xlat_varoutput_49.w = 1.0;
  gl_FragData[0] = xlat_varoutput_49;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

 }


 // Stats for Vertex shader:
 //         gles: 46 avg math (19..75), 3 avg texture (1..7), 1 avg branch (0..4)
 Pass {
  Name "FORWARD_DELTA"
  Tags { "LIGHTMODE"="FORWARDADD" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite Off
  Blend [_SrcBlend] One
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords set in this variant: POINT 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 19 math, 2 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  lightDir_6 = tmpvar_14;
  mediump vec3 tmpvar_15;
  highp vec3 n_16;
  n_16 = lightDir_6;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(n_16);
  tmpvar_15 = tmpvar_17;
  lightDir_6 = tmpvar_15;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_18;
  highp vec3 norm_19;
  norm_19 = tmpvar_1;
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((norm_19 * tmpvar_20));
  normalWorld_4 = tmpvar_21;
  tmpvar_8.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = tmpvar_15;
  xlv_TEXCOORD5 = normalWorld_4;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump float tmpvar_4;
  tmpvar_4 = dot (xlv_TEXCOORD3.yzw, xlv_TEXCOORD4);
  mediump vec2 tmpvar_5;
  tmpvar_5.x = ((tmpvar_4 * tmpvar_4) * (tmpvar_4 * tmpvar_4));
  tmpvar_5.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_NHxRoughness, tmpvar_5);
  c_1 = (((tmpvar_3 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_6.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic))
  )) * _LightColor0.xyz);
  c_1 = (c_1 * clamp (dot (xlv_TEXCOORD5, xlv_TEXCOORD4), 0.0, 1.0));
  mediump vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = c_1;
  mediump vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 43 math, 2 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 n_15;
  n_15 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  tmpvar_14 = n_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  lightDir_4 = tmpvar_20;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec3 lightCoord_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = i_posWorld_2;
  lightCoord_1 = (unity_WorldToLight * tmpvar_6).xyz;
  highp float tmpvar_7;
  tmpvar_7 = dot (lightCoord_1, lightCoord_1);
  lowp float tmpvar_8;
  tmpvar_8 = texture2D (_LightTexture0, vec2(tmpvar_7)).w;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = xlv_TEXCOORD2.w;
  tmpvar_9.y = xlv_TEXCOORD2_1.w;
  tmpvar_9.z = xlv_TEXCOORD2_2.w;
  mediump float atten_10;
  atten_10 = tmpvar_8;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  mediump vec3 tmpvar_12;
  tmpvar_12 = normalize(tmpvar_9);
  tmpvar_11 = (tmpvar_11 * atten_10);
  mediump float specularTerm_13;
  mediump vec3 tmpvar_14;
  mediump vec3 inVec_15;
  inVec_15 = (tmpvar_12 - normalize(xlv_TEXCOORD1));
  tmpvar_14 = (inVec_15 * inversesqrt(max (0.001, 
    dot (inVec_15, inVec_15)
  )));
  mediump float tmpvar_16;
  tmpvar_16 = clamp (dot (tmpvar_5, tmpvar_14), 0.0, 1.0);
  mediump float tmpvar_17;
  tmpvar_17 = (1.0 - _Glossiness);
  mediump float tmpvar_18;
  tmpvar_18 = (tmpvar_17 * tmpvar_17);
  specularTerm_13 = ((tmpvar_18 / (
    (max (0.32, clamp (dot (tmpvar_12, tmpvar_14), 0.0, 1.0)) * (1.5 + tmpvar_18))
   * 
    (((tmpvar_16 * tmpvar_16) * ((tmpvar_18 * tmpvar_18) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_19;
  tmpvar_19 = clamp (specularTerm_13, 0.0, 100.0);
  specularTerm_13 = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = (((
    (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)))
   + 
    (tmpvar_19 * mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic)))
  ) * tmpvar_11) * clamp (dot (tmpvar_5, tmpvar_12), 0.0, 1.0));
  mediump vec4 xlat_varoutput_21;
  xlat_varoutput_21.xyz = tmpvar_20.xyz;
  xlat_varoutput_21.w = 1.0;
  gl_FragData[0] = xlat_varoutput_21;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 43 math, 2 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 n_15;
  n_15 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  tmpvar_14 = n_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  lightDir_4 = tmpvar_20;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec3 lightCoord_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = i_posWorld_2;
  lightCoord_1 = (unity_WorldToLight * tmpvar_6).xyz;
  highp float tmpvar_7;
  tmpvar_7 = dot (lightCoord_1, lightCoord_1);
  lowp float tmpvar_8;
  tmpvar_8 = texture2D (_LightTexture0, vec2(tmpvar_7)).w;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = xlv_TEXCOORD2.w;
  tmpvar_9.y = xlv_TEXCOORD2_1.w;
  tmpvar_9.z = xlv_TEXCOORD2_2.w;
  mediump float atten_10;
  atten_10 = tmpvar_8;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  mediump vec3 tmpvar_12;
  tmpvar_12 = normalize(tmpvar_9);
  tmpvar_11 = (tmpvar_11 * atten_10);
  mediump float specularTerm_13;
  mediump vec3 tmpvar_14;
  mediump vec3 inVec_15;
  inVec_15 = (tmpvar_12 - normalize(xlv_TEXCOORD1));
  tmpvar_14 = (inVec_15 * inversesqrt(max (0.001, 
    dot (inVec_15, inVec_15)
  )));
  mediump float tmpvar_16;
  tmpvar_16 = clamp (dot (tmpvar_5, tmpvar_14), 0.0, 1.0);
  mediump float tmpvar_17;
  tmpvar_17 = (1.0 - _Glossiness);
  mediump float tmpvar_18;
  tmpvar_18 = (tmpvar_17 * tmpvar_17);
  specularTerm_13 = ((tmpvar_18 / (
    (max (0.32, clamp (dot (tmpvar_12, tmpvar_14), 0.0, 1.0)) * (1.5 + tmpvar_18))
   * 
    (((tmpvar_16 * tmpvar_16) * ((tmpvar_18 * tmpvar_18) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_19;
  tmpvar_19 = clamp (specularTerm_13, 0.0, 100.0);
  specularTerm_13 = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = (((
    (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)))
   + 
    (tmpvar_19 * mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic)))
  ) * tmpvar_11) * clamp (dot (tmpvar_5, tmpvar_12), 0.0, 1.0));
  mediump vec4 xlat_varoutput_21;
  xlat_varoutput_21.xyz = tmpvar_20.xyz;
  xlat_varoutput_21.w = 1.0;
  gl_FragData[0] = xlat_varoutput_21;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 19 math, 2 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  lightDir_6 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  normalWorld_4 = tmpvar_18;
  tmpvar_8.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = lightDir_6;
  xlv_TEXCOORD5 = normalWorld_4;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump float tmpvar_4;
  tmpvar_4 = dot (xlv_TEXCOORD3.yzw, xlv_TEXCOORD4);
  mediump vec2 tmpvar_5;
  tmpvar_5.x = ((tmpvar_4 * tmpvar_4) * (tmpvar_4 * tmpvar_4));
  tmpvar_5.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_NHxRoughness, tmpvar_5);
  c_1 = (((tmpvar_3 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_6.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic))
  )) * _LightColor0.xyz);
  c_1 = (c_1 * clamp (dot (xlv_TEXCOORD5, xlv_TEXCOORD4), 0.0, 1.0));
  mediump vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = c_1;
  mediump vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 38 math, 1 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (_WorldSpaceLightPos0.xyz - (tmpvar_8.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_18.x;
  tmpvar_5.w = tmpvar_18.y;
  tmpvar_6.w = tmpvar_18.z;
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_8.xyz;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * tmpvar_1.xyz);
  mediump vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_4;
  tmpvar_4.x = xlv_TEXCOORD2.w;
  tmpvar_4.y = xlv_TEXCOORD2_1.w;
  tmpvar_4.z = xlv_TEXCOORD2_2.w;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _LightColor0.xyz;
  mediump float specularTerm_6;
  mediump vec3 tmpvar_7;
  mediump vec3 inVec_8;
  inVec_8 = (tmpvar_4 - normalize(xlv_TEXCOORD1));
  tmpvar_7 = (inVec_8 * inversesqrt(max (0.001, 
    dot (inVec_8, inVec_8)
  )));
  mediump float tmpvar_9;
  tmpvar_9 = clamp (dot (tmpvar_3, tmpvar_7), 0.0, 1.0);
  mediump float tmpvar_10;
  tmpvar_10 = (1.0 - _Glossiness);
  mediump float tmpvar_11;
  tmpvar_11 = (tmpvar_10 * tmpvar_10);
  specularTerm_6 = ((tmpvar_11 / (
    (max (0.32, clamp (dot (tmpvar_4, tmpvar_7), 0.0, 1.0)) * (1.5 + tmpvar_11))
   * 
    (((tmpvar_9 * tmpvar_9) * ((tmpvar_11 * tmpvar_11) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_12;
  tmpvar_12 = clamp (specularTerm_6, 0.0, 100.0);
  specularTerm_6 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (((
    (tmpvar_2 * (0.7790837 - (_Metallic * 0.7790837)))
   + 
    (tmpvar_12 * mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_2, vec3(_Metallic)))
  ) * tmpvar_5) * clamp (dot (tmpvar_3, tmpvar_4), 0.0, 1.0));
  mediump vec4 xlat_varoutput_14;
  xlat_varoutput_14.xyz = tmpvar_13.xyz;
  xlat_varoutput_14.w = 1.0;
  gl_FragData[0] = xlat_varoutput_14;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 38 math, 1 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (_WorldSpaceLightPos0.xyz - (tmpvar_8.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_18.x;
  tmpvar_5.w = tmpvar_18.y;
  tmpvar_6.w = tmpvar_18.z;
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_8.xyz;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * tmpvar_1.xyz);
  mediump vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_4;
  tmpvar_4.x = xlv_TEXCOORD2.w;
  tmpvar_4.y = xlv_TEXCOORD2_1.w;
  tmpvar_4.z = xlv_TEXCOORD2_2.w;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _LightColor0.xyz;
  mediump float specularTerm_6;
  mediump vec3 tmpvar_7;
  mediump vec3 inVec_8;
  inVec_8 = (tmpvar_4 - normalize(xlv_TEXCOORD1));
  tmpvar_7 = (inVec_8 * inversesqrt(max (0.001, 
    dot (inVec_8, inVec_8)
  )));
  mediump float tmpvar_9;
  tmpvar_9 = clamp (dot (tmpvar_3, tmpvar_7), 0.0, 1.0);
  mediump float tmpvar_10;
  tmpvar_10 = (1.0 - _Glossiness);
  mediump float tmpvar_11;
  tmpvar_11 = (tmpvar_10 * tmpvar_10);
  specularTerm_6 = ((tmpvar_11 / (
    (max (0.32, clamp (dot (tmpvar_4, tmpvar_7), 0.0, 1.0)) * (1.5 + tmpvar_11))
   * 
    (((tmpvar_9 * tmpvar_9) * ((tmpvar_11 * tmpvar_11) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_12;
  tmpvar_12 = clamp (specularTerm_6, 0.0, 100.0);
  specularTerm_6 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (((
    (tmpvar_2 * (0.7790837 - (_Metallic * 0.7790837)))
   + 
    (tmpvar_12 * mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_2, vec3(_Metallic)))
  ) * tmpvar_5) * clamp (dot (tmpvar_3, tmpvar_4), 0.0, 1.0));
  mediump vec4 xlat_varoutput_14;
  xlat_varoutput_14.xyz = tmpvar_13.xyz;
  xlat_varoutput_14.w = 1.0;
  gl_FragData[0] = xlat_varoutput_14;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 19 math, 2 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  lightDir_6 = tmpvar_14;
  mediump vec3 tmpvar_15;
  highp vec3 n_16;
  n_16 = lightDir_6;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(n_16);
  tmpvar_15 = tmpvar_17;
  lightDir_6 = tmpvar_15;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_18;
  highp vec3 norm_19;
  norm_19 = tmpvar_1;
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((norm_19 * tmpvar_20));
  normalWorld_4 = tmpvar_21;
  tmpvar_8.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = tmpvar_15;
  xlv_TEXCOORD5 = normalWorld_4;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump float tmpvar_4;
  tmpvar_4 = dot (xlv_TEXCOORD3.yzw, xlv_TEXCOORD4);
  mediump vec2 tmpvar_5;
  tmpvar_5.x = ((tmpvar_4 * tmpvar_4) * (tmpvar_4 * tmpvar_4));
  tmpvar_5.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_NHxRoughness, tmpvar_5);
  c_1 = (((tmpvar_3 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_6.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic))
  )) * _LightColor0.xyz);
  c_1 = (c_1 * clamp (dot (xlv_TEXCOORD5, xlv_TEXCOORD4), 0.0, 1.0));
  mediump vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = c_1;
  mediump vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 49 math, 3 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 n_15;
  n_15 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  tmpvar_14 = n_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  lightDir_4 = tmpvar_20;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float atten_1;
  highp vec4 lightCoord_2;
  mediump vec3 i_posWorld_3;
  i_posWorld_3 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = i_posWorld_3;
  lightCoord_2 = (unity_WorldToLight * tmpvar_7);
  lowp vec4 tmpvar_8;
  highp vec2 P_9;
  P_9 = ((lightCoord_2.xy / lightCoord_2.w) + 0.5);
  tmpvar_8 = texture2D (_LightTexture0, P_9);
  highp float tmpvar_10;
  tmpvar_10 = dot (lightCoord_2.xyz, lightCoord_2.xyz);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_LightTextureB0, vec2(tmpvar_10));
  highp float tmpvar_12;
  tmpvar_12 = ((float(
    (lightCoord_2.z > 0.0)
  ) * tmpvar_8.w) * tmpvar_11.w);
  atten_1 = tmpvar_12;
  mediump vec3 tmpvar_13;
  tmpvar_13.x = xlv_TEXCOORD2.w;
  tmpvar_13.y = xlv_TEXCOORD2_1.w;
  tmpvar_13.z = xlv_TEXCOORD2_2.w;
  mediump float atten_14;
  atten_14 = atten_1;
  mediump vec3 tmpvar_15;
  tmpvar_15 = _LightColor0.xyz;
  mediump vec3 tmpvar_16;
  tmpvar_16 = normalize(tmpvar_13);
  tmpvar_15 = (tmpvar_15 * atten_14);
  mediump float specularTerm_17;
  mediump vec3 tmpvar_18;
  mediump vec3 inVec_19;
  inVec_19 = (tmpvar_16 - normalize(xlv_TEXCOORD1));
  tmpvar_18 = (inVec_19 * inversesqrt(max (0.001, 
    dot (inVec_19, inVec_19)
  )));
  mediump float tmpvar_20;
  tmpvar_20 = clamp (dot (tmpvar_6, tmpvar_18), 0.0, 1.0);
  mediump float tmpvar_21;
  tmpvar_21 = (1.0 - _Glossiness);
  mediump float tmpvar_22;
  tmpvar_22 = (tmpvar_21 * tmpvar_21);
  specularTerm_17 = ((tmpvar_22 / (
    (max (0.32, clamp (dot (tmpvar_16, tmpvar_18), 0.0, 1.0)) * (1.5 + tmpvar_22))
   * 
    (((tmpvar_20 * tmpvar_20) * ((tmpvar_22 * tmpvar_22) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_23;
  tmpvar_23 = clamp (specularTerm_17, 0.0, 100.0);
  specularTerm_17 = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = (((
    (tmpvar_5 * (0.7790837 - (_Metallic * 0.7790837)))
   + 
    (tmpvar_23 * mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic)))
  ) * tmpvar_15) * clamp (dot (tmpvar_6, tmpvar_16), 0.0, 1.0));
  mediump vec4 xlat_varoutput_25;
  xlat_varoutput_25.xyz = tmpvar_24.xyz;
  xlat_varoutput_25.w = 1.0;
  gl_FragData[0] = xlat_varoutput_25;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 49 math, 3 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 n_15;
  n_15 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  tmpvar_14 = n_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  lightDir_4 = tmpvar_20;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float atten_1;
  highp vec4 lightCoord_2;
  mediump vec3 i_posWorld_3;
  i_posWorld_3 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = i_posWorld_3;
  lightCoord_2 = (unity_WorldToLight * tmpvar_7);
  lowp vec4 tmpvar_8;
  highp vec2 P_9;
  P_9 = ((lightCoord_2.xy / lightCoord_2.w) + 0.5);
  tmpvar_8 = texture2D (_LightTexture0, P_9);
  highp float tmpvar_10;
  tmpvar_10 = dot (lightCoord_2.xyz, lightCoord_2.xyz);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_LightTextureB0, vec2(tmpvar_10));
  highp float tmpvar_12;
  tmpvar_12 = ((float(
    (lightCoord_2.z > 0.0)
  ) * tmpvar_8.w) * tmpvar_11.w);
  atten_1 = tmpvar_12;
  mediump vec3 tmpvar_13;
  tmpvar_13.x = xlv_TEXCOORD2.w;
  tmpvar_13.y = xlv_TEXCOORD2_1.w;
  tmpvar_13.z = xlv_TEXCOORD2_2.w;
  mediump float atten_14;
  atten_14 = atten_1;
  mediump vec3 tmpvar_15;
  tmpvar_15 = _LightColor0.xyz;
  mediump vec3 tmpvar_16;
  tmpvar_16 = normalize(tmpvar_13);
  tmpvar_15 = (tmpvar_15 * atten_14);
  mediump float specularTerm_17;
  mediump vec3 tmpvar_18;
  mediump vec3 inVec_19;
  inVec_19 = (tmpvar_16 - normalize(xlv_TEXCOORD1));
  tmpvar_18 = (inVec_19 * inversesqrt(max (0.001, 
    dot (inVec_19, inVec_19)
  )));
  mediump float tmpvar_20;
  tmpvar_20 = clamp (dot (tmpvar_6, tmpvar_18), 0.0, 1.0);
  mediump float tmpvar_21;
  tmpvar_21 = (1.0 - _Glossiness);
  mediump float tmpvar_22;
  tmpvar_22 = (tmpvar_21 * tmpvar_21);
  specularTerm_17 = ((tmpvar_22 / (
    (max (0.32, clamp (dot (tmpvar_16, tmpvar_18), 0.0, 1.0)) * (1.5 + tmpvar_22))
   * 
    (((tmpvar_20 * tmpvar_20) * ((tmpvar_22 * tmpvar_22) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_23;
  tmpvar_23 = clamp (specularTerm_17, 0.0, 100.0);
  specularTerm_17 = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = (((
    (tmpvar_5 * (0.7790837 - (_Metallic * 0.7790837)))
   + 
    (tmpvar_23 * mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic)))
  ) * tmpvar_15) * clamp (dot (tmpvar_6, tmpvar_16), 0.0, 1.0));
  mediump vec4 xlat_varoutput_25;
  xlat_varoutput_25.xyz = tmpvar_24.xyz;
  xlat_varoutput_25.w = 1.0;
  gl_FragData[0] = xlat_varoutput_25;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: POINT_COOKIE 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 19 math, 2 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  lightDir_6 = tmpvar_14;
  mediump vec3 tmpvar_15;
  highp vec3 n_16;
  n_16 = lightDir_6;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(n_16);
  tmpvar_15 = tmpvar_17;
  lightDir_6 = tmpvar_15;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_18;
  highp vec3 norm_19;
  norm_19 = tmpvar_1;
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((norm_19 * tmpvar_20));
  normalWorld_4 = tmpvar_21;
  tmpvar_8.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = tmpvar_15;
  xlv_TEXCOORD5 = normalWorld_4;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump float tmpvar_4;
  tmpvar_4 = dot (xlv_TEXCOORD3.yzw, xlv_TEXCOORD4);
  mediump vec2 tmpvar_5;
  tmpvar_5.x = ((tmpvar_4 * tmpvar_4) * (tmpvar_4 * tmpvar_4));
  tmpvar_5.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_NHxRoughness, tmpvar_5);
  c_1 = (((tmpvar_3 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_6.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic))
  )) * _LightColor0.xyz);
  c_1 = (c_1 * clamp (dot (xlv_TEXCOORD5, xlv_TEXCOORD4), 0.0, 1.0));
  mediump vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = c_1;
  mediump vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 44 math, 3 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 n_15;
  n_15 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  tmpvar_14 = n_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  lightDir_4 = tmpvar_20;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform lowp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec3 lightCoord_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = i_posWorld_2;
  lightCoord_1 = (unity_WorldToLight * tmpvar_6).xyz;
  highp float tmpvar_7;
  tmpvar_7 = dot (lightCoord_1, lightCoord_1);
  lowp float tmpvar_8;
  tmpvar_8 = (texture2D (_LightTextureB0, vec2(tmpvar_7)).w * textureCube (_LightTexture0, lightCoord_1).w);
  mediump vec3 tmpvar_9;
  tmpvar_9.x = xlv_TEXCOORD2.w;
  tmpvar_9.y = xlv_TEXCOORD2_1.w;
  tmpvar_9.z = xlv_TEXCOORD2_2.w;
  mediump float atten_10;
  atten_10 = tmpvar_8;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  mediump vec3 tmpvar_12;
  tmpvar_12 = normalize(tmpvar_9);
  tmpvar_11 = (tmpvar_11 * atten_10);
  mediump float specularTerm_13;
  mediump vec3 tmpvar_14;
  mediump vec3 inVec_15;
  inVec_15 = (tmpvar_12 - normalize(xlv_TEXCOORD1));
  tmpvar_14 = (inVec_15 * inversesqrt(max (0.001, 
    dot (inVec_15, inVec_15)
  )));
  mediump float tmpvar_16;
  tmpvar_16 = clamp (dot (tmpvar_5, tmpvar_14), 0.0, 1.0);
  mediump float tmpvar_17;
  tmpvar_17 = (1.0 - _Glossiness);
  mediump float tmpvar_18;
  tmpvar_18 = (tmpvar_17 * tmpvar_17);
  specularTerm_13 = ((tmpvar_18 / (
    (max (0.32, clamp (dot (tmpvar_12, tmpvar_14), 0.0, 1.0)) * (1.5 + tmpvar_18))
   * 
    (((tmpvar_16 * tmpvar_16) * ((tmpvar_18 * tmpvar_18) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_19;
  tmpvar_19 = clamp (specularTerm_13, 0.0, 100.0);
  specularTerm_13 = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = (((
    (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)))
   + 
    (tmpvar_19 * mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic)))
  ) * tmpvar_11) * clamp (dot (tmpvar_5, tmpvar_12), 0.0, 1.0));
  mediump vec4 xlat_varoutput_21;
  xlat_varoutput_21.xyz = tmpvar_20.xyz;
  xlat_varoutput_21.w = 1.0;
  gl_FragData[0] = xlat_varoutput_21;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 44 math, 3 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 n_15;
  n_15 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  tmpvar_14 = n_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  lightDir_4 = tmpvar_20;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform lowp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec3 lightCoord_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = i_posWorld_2;
  lightCoord_1 = (unity_WorldToLight * tmpvar_6).xyz;
  highp float tmpvar_7;
  tmpvar_7 = dot (lightCoord_1, lightCoord_1);
  lowp float tmpvar_8;
  tmpvar_8 = (texture2D (_LightTextureB0, vec2(tmpvar_7)).w * textureCube (_LightTexture0, lightCoord_1).w);
  mediump vec3 tmpvar_9;
  tmpvar_9.x = xlv_TEXCOORD2.w;
  tmpvar_9.y = xlv_TEXCOORD2_1.w;
  tmpvar_9.z = xlv_TEXCOORD2_2.w;
  mediump float atten_10;
  atten_10 = tmpvar_8;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  mediump vec3 tmpvar_12;
  tmpvar_12 = normalize(tmpvar_9);
  tmpvar_11 = (tmpvar_11 * atten_10);
  mediump float specularTerm_13;
  mediump vec3 tmpvar_14;
  mediump vec3 inVec_15;
  inVec_15 = (tmpvar_12 - normalize(xlv_TEXCOORD1));
  tmpvar_14 = (inVec_15 * inversesqrt(max (0.001, 
    dot (inVec_15, inVec_15)
  )));
  mediump float tmpvar_16;
  tmpvar_16 = clamp (dot (tmpvar_5, tmpvar_14), 0.0, 1.0);
  mediump float tmpvar_17;
  tmpvar_17 = (1.0 - _Glossiness);
  mediump float tmpvar_18;
  tmpvar_18 = (tmpvar_17 * tmpvar_17);
  specularTerm_13 = ((tmpvar_18 / (
    (max (0.32, clamp (dot (tmpvar_12, tmpvar_14), 0.0, 1.0)) * (1.5 + tmpvar_18))
   * 
    (((tmpvar_16 * tmpvar_16) * ((tmpvar_18 * tmpvar_18) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_19;
  tmpvar_19 = clamp (specularTerm_13, 0.0, 100.0);
  specularTerm_13 = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = (((
    (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)))
   + 
    (tmpvar_19 * mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic)))
  ) * tmpvar_11) * clamp (dot (tmpvar_5, tmpvar_12), 0.0, 1.0));
  mediump vec4 xlat_varoutput_21;
  xlat_varoutput_21.xyz = tmpvar_20.xyz;
  xlat_varoutput_21.w = 1.0;
  gl_FragData[0] = xlat_varoutput_21;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 19 math, 2 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  lightDir_6 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  normalWorld_4 = tmpvar_18;
  tmpvar_8.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = lightDir_6;
  xlv_TEXCOORD5 = normalWorld_4;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump float tmpvar_4;
  tmpvar_4 = dot (xlv_TEXCOORD3.yzw, xlv_TEXCOORD4);
  mediump vec2 tmpvar_5;
  tmpvar_5.x = ((tmpvar_4 * tmpvar_4) * (tmpvar_4 * tmpvar_4));
  tmpvar_5.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_NHxRoughness, tmpvar_5);
  c_1 = (((tmpvar_3 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_6.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic))
  )) * _LightColor0.xyz);
  c_1 = (c_1 * clamp (dot (xlv_TEXCOORD5, xlv_TEXCOORD4), 0.0, 1.0));
  mediump vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = c_1;
  mediump vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 41 math, 2 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (_WorldSpaceLightPos0.xyz - (tmpvar_8.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_18.x;
  tmpvar_5.w = tmpvar_18.y;
  tmpvar_6.w = tmpvar_18.z;
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_8.xyz;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec2 lightCoord_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = i_posWorld_2;
  lightCoord_1 = (unity_WorldToLight * tmpvar_6).xy;
  lowp float tmpvar_7;
  tmpvar_7 = texture2D (_LightTexture0, lightCoord_1).w;
  mediump vec3 tmpvar_8;
  tmpvar_8.x = xlv_TEXCOORD2.w;
  tmpvar_8.y = xlv_TEXCOORD2_1.w;
  tmpvar_8.z = xlv_TEXCOORD2_2.w;
  mediump float atten_9;
  atten_9 = tmpvar_7;
  mediump vec3 tmpvar_10;
  tmpvar_10 = _LightColor0.xyz;
  tmpvar_10 = (tmpvar_10 * atten_9);
  mediump float specularTerm_11;
  mediump vec3 tmpvar_12;
  mediump vec3 inVec_13;
  inVec_13 = (tmpvar_8 - normalize(xlv_TEXCOORD1));
  tmpvar_12 = (inVec_13 * inversesqrt(max (0.001, 
    dot (inVec_13, inVec_13)
  )));
  mediump float tmpvar_14;
  tmpvar_14 = clamp (dot (tmpvar_5, tmpvar_12), 0.0, 1.0);
  mediump float tmpvar_15;
  tmpvar_15 = (1.0 - _Glossiness);
  mediump float tmpvar_16;
  tmpvar_16 = (tmpvar_15 * tmpvar_15);
  specularTerm_11 = ((tmpvar_16 / (
    (max (0.32, clamp (dot (tmpvar_8, tmpvar_12), 0.0, 1.0)) * (1.5 + tmpvar_16))
   * 
    (((tmpvar_14 * tmpvar_14) * ((tmpvar_16 * tmpvar_16) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_17;
  tmpvar_17 = clamp (specularTerm_11, 0.0, 100.0);
  specularTerm_11 = tmpvar_17;
  mediump vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = (((
    (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)))
   + 
    (tmpvar_17 * mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic)))
  ) * tmpvar_10) * clamp (dot (tmpvar_5, tmpvar_8), 0.0, 1.0));
  mediump vec4 xlat_varoutput_19;
  xlat_varoutput_19.xyz = tmpvar_18.xyz;
  xlat_varoutput_19.w = 1.0;
  gl_FragData[0] = xlat_varoutput_19;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 41 math, 2 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (_WorldSpaceLightPos0.xyz - (tmpvar_8.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_18.x;
  tmpvar_5.w = tmpvar_18.y;
  tmpvar_6.w = tmpvar_18.z;
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_8.xyz;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec2 lightCoord_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = i_posWorld_2;
  lightCoord_1 = (unity_WorldToLight * tmpvar_6).xy;
  lowp float tmpvar_7;
  tmpvar_7 = texture2D (_LightTexture0, lightCoord_1).w;
  mediump vec3 tmpvar_8;
  tmpvar_8.x = xlv_TEXCOORD2.w;
  tmpvar_8.y = xlv_TEXCOORD2_1.w;
  tmpvar_8.z = xlv_TEXCOORD2_2.w;
  mediump float atten_9;
  atten_9 = tmpvar_7;
  mediump vec3 tmpvar_10;
  tmpvar_10 = _LightColor0.xyz;
  tmpvar_10 = (tmpvar_10 * atten_9);
  mediump float specularTerm_11;
  mediump vec3 tmpvar_12;
  mediump vec3 inVec_13;
  inVec_13 = (tmpvar_8 - normalize(xlv_TEXCOORD1));
  tmpvar_12 = (inVec_13 * inversesqrt(max (0.001, 
    dot (inVec_13, inVec_13)
  )));
  mediump float tmpvar_14;
  tmpvar_14 = clamp (dot (tmpvar_5, tmpvar_12), 0.0, 1.0);
  mediump float tmpvar_15;
  tmpvar_15 = (1.0 - _Glossiness);
  mediump float tmpvar_16;
  tmpvar_16 = (tmpvar_15 * tmpvar_15);
  specularTerm_11 = ((tmpvar_16 / (
    (max (0.32, clamp (dot (tmpvar_8, tmpvar_12), 0.0, 1.0)) * (1.5 + tmpvar_16))
   * 
    (((tmpvar_14 * tmpvar_14) * ((tmpvar_16 * tmpvar_16) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_17;
  tmpvar_17 = clamp (specularTerm_11, 0.0, 100.0);
  specularTerm_11 = tmpvar_17;
  mediump vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = (((
    (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)))
   + 
    (tmpvar_17 * mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic)))
  ) * tmpvar_10) * clamp (dot (tmpvar_5, tmpvar_8), 0.0, 1.0));
  mediump vec4 xlat_varoutput_19;
  xlat_varoutput_19.xyz = tmpvar_18.xyz;
  xlat_varoutput_19.w = 1.0;
  gl_FragData[0] = xlat_varoutput_19;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: SPOT SHADOWS_DEPTH 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 26 math, 3 textures, 1 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  lightDir_6 = tmpvar_14;
  mediump vec3 tmpvar_15;
  highp vec3 n_16;
  n_16 = lightDir_6;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(n_16);
  tmpvar_15 = tmpvar_17;
  lightDir_6 = tmpvar_15;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_18;
  highp vec3 norm_19;
  norm_19 = tmpvar_1;
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((norm_19 * tmpvar_20));
  normalWorld_4 = tmpvar_21;
  tmpvar_8.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = tmpvar_15;
  xlv_TEXCOORD5 = normalWorld_4;
}


#endif
#ifdef FRAGMENT
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform highp sampler2D _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  mediump vec3 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  tmpvar_2 = xlv_TEXCOORD1;
  mediump float tmpvar_5;
  tmpvar_5 = dot (xlv_TEXCOORD3.yzw, xlv_TEXCOORD4);
  mediump vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5));
  tmpvar_6.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_NHxRoughness, tmpvar_6);
  c_1 = (((tmpvar_4 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_7.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic))
  )) * _LightColor0.xyz);
  highp vec3 worldPos_8;
  worldPos_8 = tmpvar_2;
  mediump float realtimeShadowAttenuation_9;
  realtimeShadowAttenuation_9 = 1.0;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = worldPos_8;
  highp vec4 tmpvar_11;
  tmpvar_11 = (unity_WorldToShadow[0] * tmpvar_10);
  lowp float tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13 = texture2DProj (_ShadowMapTexture, tmpvar_11);
  mediump float tmpvar_14;
  if ((tmpvar_13.x < (tmpvar_11.z / tmpvar_11.w))) {
    tmpvar_14 = _LightShadowData.x;
  } else {
    tmpvar_14 = 1.0;
  };
  tmpvar_12 = tmpvar_14;
  realtimeShadowAttenuation_9 = tmpvar_12;
  c_1 = (c_1 * (realtimeShadowAttenuation_9 * clamp (
    dot (xlv_TEXCOORD5, xlv_TEXCOORD4)
  , 0.0, 1.0)));
  mediump vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = c_1;
  mediump vec4 xlat_varoutput_16;
  xlat_varoutput_16.xyz = tmpvar_15.xyz;
  xlat_varoutput_16.w = 1.0;
  gl_FragData[0] = xlat_varoutput_16;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 67 math, 4 textures, 1 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 n_15;
  n_15 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  tmpvar_14 = n_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  lightDir_4 = tmpvar_20;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float atten_1;
  lowp float shadow_2;
  mediump vec3 i_posWorld_3;
  i_posWorld_3 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  tmpvar_6 = (tmpvar_5 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = i_posWorld_3;
  highp vec4 tmpvar_11;
  tmpvar_11 = (unity_WorldToLight * tmpvar_10);
  highp vec3 worldPos_12;
  worldPos_12 = i_posWorld_3;
  mediump float realtimeShadowAttenuation_13;
  highp vec4 v_14;
  v_14.x = unity_MatrixV[0].z;
  v_14.y = unity_MatrixV[1].z;
  v_14.z = unity_MatrixV[2].z;
  v_14.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (worldPos_12 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_12), v_14.xyz), sqrt(dot (tmpvar_15, tmpvar_15)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_16 = tmpvar_17;
  realtimeShadowAttenuation_13 = 1.0;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = worldPos_12;
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_WorldToShadow[0] * tmpvar_18);
  lowp float tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = texture2DProj (_ShadowMapTexture, tmpvar_19);
  mediump float tmpvar_22;
  if ((tmpvar_21.x < (tmpvar_19.z / tmpvar_19.w))) {
    tmpvar_22 = _LightShadowData.x;
  } else {
    tmpvar_22 = 1.0;
  };
  tmpvar_20 = tmpvar_22;
  realtimeShadowAttenuation_13 = tmpvar_20;
  mediump float tmpvar_23;
  tmpvar_23 = clamp ((realtimeShadowAttenuation_13 + tmpvar_16), 0.0, 1.0);
  shadow_2 = tmpvar_23;
  lowp vec4 tmpvar_24;
  highp vec2 P_25;
  P_25 = ((tmpvar_11.xy / tmpvar_11.w) + 0.5);
  tmpvar_24 = texture2D (_LightTexture0, P_25);
  highp float tmpvar_26;
  tmpvar_26 = dot (tmpvar_11.xyz, tmpvar_11.xyz);
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_LightTextureB0, vec2(tmpvar_26));
  highp float tmpvar_28;
  tmpvar_28 = (((
    float((tmpvar_11.z > 0.0))
   * tmpvar_24.w) * tmpvar_27.w) * shadow_2);
  atten_1 = tmpvar_28;
  mediump vec3 tmpvar_29;
  tmpvar_29.x = xlv_TEXCOORD2.w;
  tmpvar_29.y = xlv_TEXCOORD2_1.w;
  tmpvar_29.z = xlv_TEXCOORD2_2.w;
  mediump float atten_30;
  atten_30 = atten_1;
  mediump vec3 tmpvar_31;
  tmpvar_31 = _LightColor0.xyz;
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize(tmpvar_29);
  tmpvar_31 = (tmpvar_31 * atten_30);
  mediump float specularTerm_33;
  mediump vec3 tmpvar_34;
  mediump vec3 inVec_35;
  inVec_35 = (tmpvar_32 - tmpvar_9);
  tmpvar_34 = (inVec_35 * inversesqrt(max (0.001, 
    dot (inVec_35, inVec_35)
  )));
  mediump float tmpvar_36;
  tmpvar_36 = clamp (dot (tmpvar_8, tmpvar_34), 0.0, 1.0);
  mediump float tmpvar_37;
  tmpvar_37 = (1.0 - _Glossiness);
  mediump float tmpvar_38;
  tmpvar_38 = (tmpvar_37 * tmpvar_37);
  specularTerm_33 = ((tmpvar_38 / (
    (max (0.32, clamp (dot (tmpvar_32, tmpvar_34), 0.0, 1.0)) * (1.5 + tmpvar_38))
   * 
    (((tmpvar_36 * tmpvar_36) * ((tmpvar_38 * tmpvar_38) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_39;
  tmpvar_39 = clamp (specularTerm_33, 0.0, 100.0);
  specularTerm_33 = tmpvar_39;
  mediump vec4 tmpvar_40;
  tmpvar_40.w = 1.0;
  tmpvar_40.xyz = (((tmpvar_6 + 
    (tmpvar_39 * tmpvar_7)
  ) * tmpvar_31) * clamp (dot (tmpvar_8, tmpvar_32), 0.0, 1.0));
  mediump vec4 xlat_varoutput_41;
  xlat_varoutput_41.xyz = tmpvar_40.xyz;
  xlat_varoutput_41.w = 1.0;
  gl_FragData[0] = xlat_varoutput_41;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 67 math, 4 textures, 1 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 n_15;
  n_15 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  tmpvar_14 = n_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  lightDir_4 = tmpvar_20;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float atten_1;
  lowp float shadow_2;
  mediump vec3 i_posWorld_3;
  i_posWorld_3 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  tmpvar_6 = (tmpvar_5 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = i_posWorld_3;
  highp vec4 tmpvar_11;
  tmpvar_11 = (unity_WorldToLight * tmpvar_10);
  highp vec3 worldPos_12;
  worldPos_12 = i_posWorld_3;
  mediump float realtimeShadowAttenuation_13;
  highp vec4 v_14;
  v_14.x = unity_MatrixV[0].z;
  v_14.y = unity_MatrixV[1].z;
  v_14.z = unity_MatrixV[2].z;
  v_14.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (worldPos_12 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_12), v_14.xyz), sqrt(dot (tmpvar_15, tmpvar_15)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_16 = tmpvar_17;
  realtimeShadowAttenuation_13 = 1.0;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = worldPos_12;
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_WorldToShadow[0] * tmpvar_18);
  lowp float tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = texture2DProj (_ShadowMapTexture, tmpvar_19);
  mediump float tmpvar_22;
  if ((tmpvar_21.x < (tmpvar_19.z / tmpvar_19.w))) {
    tmpvar_22 = _LightShadowData.x;
  } else {
    tmpvar_22 = 1.0;
  };
  tmpvar_20 = tmpvar_22;
  realtimeShadowAttenuation_13 = tmpvar_20;
  mediump float tmpvar_23;
  tmpvar_23 = clamp ((realtimeShadowAttenuation_13 + tmpvar_16), 0.0, 1.0);
  shadow_2 = tmpvar_23;
  lowp vec4 tmpvar_24;
  highp vec2 P_25;
  P_25 = ((tmpvar_11.xy / tmpvar_11.w) + 0.5);
  tmpvar_24 = texture2D (_LightTexture0, P_25);
  highp float tmpvar_26;
  tmpvar_26 = dot (tmpvar_11.xyz, tmpvar_11.xyz);
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_LightTextureB0, vec2(tmpvar_26));
  highp float tmpvar_28;
  tmpvar_28 = (((
    float((tmpvar_11.z > 0.0))
   * tmpvar_24.w) * tmpvar_27.w) * shadow_2);
  atten_1 = tmpvar_28;
  mediump vec3 tmpvar_29;
  tmpvar_29.x = xlv_TEXCOORD2.w;
  tmpvar_29.y = xlv_TEXCOORD2_1.w;
  tmpvar_29.z = xlv_TEXCOORD2_2.w;
  mediump float atten_30;
  atten_30 = atten_1;
  mediump vec3 tmpvar_31;
  tmpvar_31 = _LightColor0.xyz;
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize(tmpvar_29);
  tmpvar_31 = (tmpvar_31 * atten_30);
  mediump float specularTerm_33;
  mediump vec3 tmpvar_34;
  mediump vec3 inVec_35;
  inVec_35 = (tmpvar_32 - tmpvar_9);
  tmpvar_34 = (inVec_35 * inversesqrt(max (0.001, 
    dot (inVec_35, inVec_35)
  )));
  mediump float tmpvar_36;
  tmpvar_36 = clamp (dot (tmpvar_8, tmpvar_34), 0.0, 1.0);
  mediump float tmpvar_37;
  tmpvar_37 = (1.0 - _Glossiness);
  mediump float tmpvar_38;
  tmpvar_38 = (tmpvar_37 * tmpvar_37);
  specularTerm_33 = ((tmpvar_38 / (
    (max (0.32, clamp (dot (tmpvar_32, tmpvar_34), 0.0, 1.0)) * (1.5 + tmpvar_38))
   * 
    (((tmpvar_36 * tmpvar_36) * ((tmpvar_38 * tmpvar_38) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_39;
  tmpvar_39 = clamp (specularTerm_33, 0.0, 100.0);
  specularTerm_33 = tmpvar_39;
  mediump vec4 tmpvar_40;
  tmpvar_40.w = 1.0;
  tmpvar_40.xyz = (((tmpvar_6 + 
    (tmpvar_39 * tmpvar_7)
  ) * tmpvar_31) * clamp (dot (tmpvar_8, tmpvar_32), 0.0, 1.0));
  mediump vec4 xlat_varoutput_41;
  xlat_varoutput_41.xyz = tmpvar_40.xyz;
  xlat_varoutput_41.w = 1.0;
  gl_FragData[0] = xlat_varoutput_41;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: SPOT SHADOWS_DEPTH SHADOWS_SOFT 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 34 math, 6 textures, 4 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  lightDir_6 = tmpvar_14;
  mediump vec3 tmpvar_15;
  highp vec3 n_16;
  n_16 = lightDir_6;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(n_16);
  tmpvar_15 = tmpvar_17;
  lightDir_6 = tmpvar_15;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_18;
  highp vec3 norm_19;
  norm_19 = tmpvar_1;
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((norm_19 * tmpvar_20));
  normalWorld_4 = tmpvar_21;
  tmpvar_8.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = tmpvar_15;
  xlv_TEXCOORD5 = normalWorld_4;
}


#endif
#ifdef FRAGMENT
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform highp sampler2D _ShadowMapTexture;
uniform highp vec4 _ShadowOffsets[4];
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  mediump vec3 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  tmpvar_2 = xlv_TEXCOORD1;
  mediump float tmpvar_5;
  tmpvar_5 = dot (xlv_TEXCOORD3.yzw, xlv_TEXCOORD4);
  mediump vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5));
  tmpvar_6.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_NHxRoughness, tmpvar_6);
  c_1 = (((tmpvar_4 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_7.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic))
  )) * _LightColor0.xyz);
  highp vec3 worldPos_8;
  worldPos_8 = tmpvar_2;
  mediump float realtimeShadowAttenuation_9;
  realtimeShadowAttenuation_9 = 1.0;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = worldPos_8;
  highp vec4 tmpvar_11;
  tmpvar_11 = (unity_WorldToShadow[0] * tmpvar_10);
  lowp float tmpvar_12;
  highp vec4 shadowVals_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (tmpvar_11.xyz / tmpvar_11.w);
  shadowVals_13.x = texture2D (_ShadowMapTexture, (tmpvar_14.xy + _ShadowOffsets[0].xy)).x;
  shadowVals_13.y = texture2D (_ShadowMapTexture, (tmpvar_14.xy + _ShadowOffsets[1].xy)).x;
  shadowVals_13.z = texture2D (_ShadowMapTexture, (tmpvar_14.xy + _ShadowOffsets[2].xy)).x;
  shadowVals_13.w = texture2D (_ShadowMapTexture, (tmpvar_14.xy + _ShadowOffsets[3].xy)).x;
  bvec4 tmpvar_15;
  tmpvar_15 = lessThan (shadowVals_13, tmpvar_14.zzzz);
  mediump vec4 tmpvar_16;
  tmpvar_16 = _LightShadowData.xxxx;
  mediump float tmpvar_17;
  if (tmpvar_15.x) {
    tmpvar_17 = tmpvar_16.x;
  } else {
    tmpvar_17 = 1.0;
  };
  mediump float tmpvar_18;
  if (tmpvar_15.y) {
    tmpvar_18 = tmpvar_16.y;
  } else {
    tmpvar_18 = 1.0;
  };
  mediump float tmpvar_19;
  if (tmpvar_15.z) {
    tmpvar_19 = tmpvar_16.z;
  } else {
    tmpvar_19 = 1.0;
  };
  mediump float tmpvar_20;
  if (tmpvar_15.w) {
    tmpvar_20 = tmpvar_16.w;
  } else {
    tmpvar_20 = 1.0;
  };
  mediump vec4 tmpvar_21;
  tmpvar_21.x = tmpvar_17;
  tmpvar_21.y = tmpvar_18;
  tmpvar_21.z = tmpvar_19;
  tmpvar_21.w = tmpvar_20;
  mediump float tmpvar_22;
  tmpvar_22 = dot (tmpvar_21, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_12 = tmpvar_22;
  realtimeShadowAttenuation_9 = tmpvar_12;
  c_1 = (c_1 * (realtimeShadowAttenuation_9 * clamp (
    dot (xlv_TEXCOORD5, xlv_TEXCOORD4)
  , 0.0, 1.0)));
  mediump vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = c_1;
  mediump vec4 xlat_varoutput_24;
  xlat_varoutput_24.xyz = tmpvar_23.xyz;
  xlat_varoutput_24.w = 1.0;
  gl_FragData[0] = xlat_varoutput_24;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 75 math, 7 textures, 4 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 n_15;
  n_15 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  tmpvar_14 = n_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  lightDir_4 = tmpvar_20;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform highp vec4 _ShadowOffsets[4];
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float atten_1;
  lowp float shadow_2;
  mediump vec3 i_posWorld_3;
  i_posWorld_3 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  tmpvar_6 = (tmpvar_5 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = i_posWorld_3;
  highp vec4 tmpvar_11;
  tmpvar_11 = (unity_WorldToLight * tmpvar_10);
  highp vec3 worldPos_12;
  worldPos_12 = i_posWorld_3;
  mediump float realtimeShadowAttenuation_13;
  highp vec4 v_14;
  v_14.x = unity_MatrixV[0].z;
  v_14.y = unity_MatrixV[1].z;
  v_14.z = unity_MatrixV[2].z;
  v_14.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (worldPos_12 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_12), v_14.xyz), sqrt(dot (tmpvar_15, tmpvar_15)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_16 = tmpvar_17;
  realtimeShadowAttenuation_13 = 1.0;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = worldPos_12;
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_WorldToShadow[0] * tmpvar_18);
  lowp float tmpvar_20;
  highp vec4 shadowVals_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_19.xyz / tmpvar_19.w);
  shadowVals_21.x = texture2D (_ShadowMapTexture, (tmpvar_22.xy + _ShadowOffsets[0].xy)).x;
  shadowVals_21.y = texture2D (_ShadowMapTexture, (tmpvar_22.xy + _ShadowOffsets[1].xy)).x;
  shadowVals_21.z = texture2D (_ShadowMapTexture, (tmpvar_22.xy + _ShadowOffsets[2].xy)).x;
  shadowVals_21.w = texture2D (_ShadowMapTexture, (tmpvar_22.xy + _ShadowOffsets[3].xy)).x;
  bvec4 tmpvar_23;
  tmpvar_23 = lessThan (shadowVals_21, tmpvar_22.zzzz);
  mediump vec4 tmpvar_24;
  tmpvar_24 = _LightShadowData.xxxx;
  mediump float tmpvar_25;
  if (tmpvar_23.x) {
    tmpvar_25 = tmpvar_24.x;
  } else {
    tmpvar_25 = 1.0;
  };
  mediump float tmpvar_26;
  if (tmpvar_23.y) {
    tmpvar_26 = tmpvar_24.y;
  } else {
    tmpvar_26 = 1.0;
  };
  mediump float tmpvar_27;
  if (tmpvar_23.z) {
    tmpvar_27 = tmpvar_24.z;
  } else {
    tmpvar_27 = 1.0;
  };
  mediump float tmpvar_28;
  if (tmpvar_23.w) {
    tmpvar_28 = tmpvar_24.w;
  } else {
    tmpvar_28 = 1.0;
  };
  mediump vec4 tmpvar_29;
  tmpvar_29.x = tmpvar_25;
  tmpvar_29.y = tmpvar_26;
  tmpvar_29.z = tmpvar_27;
  tmpvar_29.w = tmpvar_28;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_29, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_20 = tmpvar_30;
  realtimeShadowAttenuation_13 = tmpvar_20;
  mediump float tmpvar_31;
  tmpvar_31 = clamp ((realtimeShadowAttenuation_13 + tmpvar_16), 0.0, 1.0);
  shadow_2 = tmpvar_31;
  lowp vec4 tmpvar_32;
  highp vec2 P_33;
  P_33 = ((tmpvar_11.xy / tmpvar_11.w) + 0.5);
  tmpvar_32 = texture2D (_LightTexture0, P_33);
  highp float tmpvar_34;
  tmpvar_34 = dot (tmpvar_11.xyz, tmpvar_11.xyz);
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_LightTextureB0, vec2(tmpvar_34));
  highp float tmpvar_36;
  tmpvar_36 = (((
    float((tmpvar_11.z > 0.0))
   * tmpvar_32.w) * tmpvar_35.w) * shadow_2);
  atten_1 = tmpvar_36;
  mediump vec3 tmpvar_37;
  tmpvar_37.x = xlv_TEXCOORD2.w;
  tmpvar_37.y = xlv_TEXCOORD2_1.w;
  tmpvar_37.z = xlv_TEXCOORD2_2.w;
  mediump float atten_38;
  atten_38 = atten_1;
  mediump vec3 tmpvar_39;
  tmpvar_39 = _LightColor0.xyz;
  mediump vec3 tmpvar_40;
  tmpvar_40 = normalize(tmpvar_37);
  tmpvar_39 = (tmpvar_39 * atten_38);
  mediump float specularTerm_41;
  mediump vec3 tmpvar_42;
  mediump vec3 inVec_43;
  inVec_43 = (tmpvar_40 - tmpvar_9);
  tmpvar_42 = (inVec_43 * inversesqrt(max (0.001, 
    dot (inVec_43, inVec_43)
  )));
  mediump float tmpvar_44;
  tmpvar_44 = clamp (dot (tmpvar_8, tmpvar_42), 0.0, 1.0);
  mediump float tmpvar_45;
  tmpvar_45 = (1.0 - _Glossiness);
  mediump float tmpvar_46;
  tmpvar_46 = (tmpvar_45 * tmpvar_45);
  specularTerm_41 = ((tmpvar_46 / (
    (max (0.32, clamp (dot (tmpvar_40, tmpvar_42), 0.0, 1.0)) * (1.5 + tmpvar_46))
   * 
    (((tmpvar_44 * tmpvar_44) * ((tmpvar_46 * tmpvar_46) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_47;
  tmpvar_47 = clamp (specularTerm_41, 0.0, 100.0);
  specularTerm_41 = tmpvar_47;
  mediump vec4 tmpvar_48;
  tmpvar_48.w = 1.0;
  tmpvar_48.xyz = (((tmpvar_6 + 
    (tmpvar_47 * tmpvar_7)
  ) * tmpvar_39) * clamp (dot (tmpvar_8, tmpvar_40), 0.0, 1.0));
  mediump vec4 xlat_varoutput_49;
  xlat_varoutput_49.xyz = tmpvar_48.xyz;
  xlat_varoutput_49.w = 1.0;
  gl_FragData[0] = xlat_varoutput_49;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 75 math, 7 textures, 4 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 n_15;
  n_15 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  tmpvar_14 = n_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  lightDir_4 = tmpvar_20;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform highp vec4 _ShadowOffsets[4];
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float atten_1;
  lowp float shadow_2;
  mediump vec3 i_posWorld_3;
  i_posWorld_3 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  tmpvar_6 = (tmpvar_5 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = i_posWorld_3;
  highp vec4 tmpvar_11;
  tmpvar_11 = (unity_WorldToLight * tmpvar_10);
  highp vec3 worldPos_12;
  worldPos_12 = i_posWorld_3;
  mediump float realtimeShadowAttenuation_13;
  highp vec4 v_14;
  v_14.x = unity_MatrixV[0].z;
  v_14.y = unity_MatrixV[1].z;
  v_14.z = unity_MatrixV[2].z;
  v_14.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (worldPos_12 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_12), v_14.xyz), sqrt(dot (tmpvar_15, tmpvar_15)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_16 = tmpvar_17;
  realtimeShadowAttenuation_13 = 1.0;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = worldPos_12;
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_WorldToShadow[0] * tmpvar_18);
  lowp float tmpvar_20;
  highp vec4 shadowVals_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_19.xyz / tmpvar_19.w);
  shadowVals_21.x = texture2D (_ShadowMapTexture, (tmpvar_22.xy + _ShadowOffsets[0].xy)).x;
  shadowVals_21.y = texture2D (_ShadowMapTexture, (tmpvar_22.xy + _ShadowOffsets[1].xy)).x;
  shadowVals_21.z = texture2D (_ShadowMapTexture, (tmpvar_22.xy + _ShadowOffsets[2].xy)).x;
  shadowVals_21.w = texture2D (_ShadowMapTexture, (tmpvar_22.xy + _ShadowOffsets[3].xy)).x;
  bvec4 tmpvar_23;
  tmpvar_23 = lessThan (shadowVals_21, tmpvar_22.zzzz);
  mediump vec4 tmpvar_24;
  tmpvar_24 = _LightShadowData.xxxx;
  mediump float tmpvar_25;
  if (tmpvar_23.x) {
    tmpvar_25 = tmpvar_24.x;
  } else {
    tmpvar_25 = 1.0;
  };
  mediump float tmpvar_26;
  if (tmpvar_23.y) {
    tmpvar_26 = tmpvar_24.y;
  } else {
    tmpvar_26 = 1.0;
  };
  mediump float tmpvar_27;
  if (tmpvar_23.z) {
    tmpvar_27 = tmpvar_24.z;
  } else {
    tmpvar_27 = 1.0;
  };
  mediump float tmpvar_28;
  if (tmpvar_23.w) {
    tmpvar_28 = tmpvar_24.w;
  } else {
    tmpvar_28 = 1.0;
  };
  mediump vec4 tmpvar_29;
  tmpvar_29.x = tmpvar_25;
  tmpvar_29.y = tmpvar_26;
  tmpvar_29.z = tmpvar_27;
  tmpvar_29.w = tmpvar_28;
  mediump float tmpvar_30;
  tmpvar_30 = dot (tmpvar_29, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_20 = tmpvar_30;
  realtimeShadowAttenuation_13 = tmpvar_20;
  mediump float tmpvar_31;
  tmpvar_31 = clamp ((realtimeShadowAttenuation_13 + tmpvar_16), 0.0, 1.0);
  shadow_2 = tmpvar_31;
  lowp vec4 tmpvar_32;
  highp vec2 P_33;
  P_33 = ((tmpvar_11.xy / tmpvar_11.w) + 0.5);
  tmpvar_32 = texture2D (_LightTexture0, P_33);
  highp float tmpvar_34;
  tmpvar_34 = dot (tmpvar_11.xyz, tmpvar_11.xyz);
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_LightTextureB0, vec2(tmpvar_34));
  highp float tmpvar_36;
  tmpvar_36 = (((
    float((tmpvar_11.z > 0.0))
   * tmpvar_32.w) * tmpvar_35.w) * shadow_2);
  atten_1 = tmpvar_36;
  mediump vec3 tmpvar_37;
  tmpvar_37.x = xlv_TEXCOORD2.w;
  tmpvar_37.y = xlv_TEXCOORD2_1.w;
  tmpvar_37.z = xlv_TEXCOORD2_2.w;
  mediump float atten_38;
  atten_38 = atten_1;
  mediump vec3 tmpvar_39;
  tmpvar_39 = _LightColor0.xyz;
  mediump vec3 tmpvar_40;
  tmpvar_40 = normalize(tmpvar_37);
  tmpvar_39 = (tmpvar_39 * atten_38);
  mediump float specularTerm_41;
  mediump vec3 tmpvar_42;
  mediump vec3 inVec_43;
  inVec_43 = (tmpvar_40 - tmpvar_9);
  tmpvar_42 = (inVec_43 * inversesqrt(max (0.001, 
    dot (inVec_43, inVec_43)
  )));
  mediump float tmpvar_44;
  tmpvar_44 = clamp (dot (tmpvar_8, tmpvar_42), 0.0, 1.0);
  mediump float tmpvar_45;
  tmpvar_45 = (1.0 - _Glossiness);
  mediump float tmpvar_46;
  tmpvar_46 = (tmpvar_45 * tmpvar_45);
  specularTerm_41 = ((tmpvar_46 / (
    (max (0.32, clamp (dot (tmpvar_40, tmpvar_42), 0.0, 1.0)) * (1.5 + tmpvar_46))
   * 
    (((tmpvar_44 * tmpvar_44) * ((tmpvar_46 * tmpvar_46) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_47;
  tmpvar_47 = clamp (specularTerm_41, 0.0, 100.0);
  specularTerm_41 = tmpvar_47;
  mediump vec4 tmpvar_48;
  tmpvar_48.w = 1.0;
  tmpvar_48.xyz = (((tmpvar_6 + 
    (tmpvar_47 * tmpvar_7)
  ) * tmpvar_39) * clamp (dot (tmpvar_8, tmpvar_40), 0.0, 1.0));
  mediump vec4 xlat_varoutput_49;
  xlat_varoutput_49.xyz = tmpvar_48.xyz;
  xlat_varoutput_49.w = 1.0;
  gl_FragData[0] = xlat_varoutput_49;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 25 math, 3 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  lightDir_6 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  normalWorld_4 = tmpvar_18;
  tmpvar_8.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = lightDir_6;
  xlv_TEXCOORD5 = normalWorld_4;
}


#endif
#ifdef FRAGMENT
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  mediump vec3 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  tmpvar_2 = xlv_TEXCOORD1;
  mediump float tmpvar_5;
  tmpvar_5 = dot (xlv_TEXCOORD3.yzw, xlv_TEXCOORD4);
  mediump vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5));
  tmpvar_6.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_NHxRoughness, tmpvar_6);
  c_1 = (((tmpvar_4 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_7.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic))
  )) * _LightColor0.xyz);
  highp vec3 worldPos_8;
  worldPos_8 = tmpvar_2;
  mediump float realtimeShadowAttenuation_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = worldPos_8;
  lowp float tmpvar_11;
  highp vec4 shadowCoord_12;
  shadowCoord_12 = (unity_WorldToShadow[0] * tmpvar_10);
  highp float lightShadowDataX_13;
  mediump float tmpvar_14;
  tmpvar_14 = _LightShadowData.x;
  lightShadowDataX_13 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = max (float((texture2D (_ShadowMapTexture, shadowCoord_12.xy).x > shadowCoord_12.z)), lightShadowDataX_13);
  tmpvar_11 = tmpvar_15;
  realtimeShadowAttenuation_9 = tmpvar_11;
  c_1 = (c_1 * (realtimeShadowAttenuation_9 * clamp (
    dot (xlv_TEXCOORD5, xlv_TEXCOORD4)
  , 0.0, 1.0)));
  mediump vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = c_1;
  mediump vec4 xlat_varoutput_17;
  xlat_varoutput_17.xyz = tmpvar_16.xyz;
  xlat_varoutput_17.w = 1.0;
  gl_FragData[0] = xlat_varoutput_17;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 55 math, 2 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (_WorldSpaceLightPos0.xyz - (tmpvar_8.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_18.x;
  tmpvar_5.w = tmpvar_18.y;
  tmpvar_6.w = tmpvar_18.z;
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_8.xyz;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float atten_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2_2.xyz);
  highp vec3 worldPos_6;
  worldPos_6 = i_posWorld_2;
  mediump float realtimeShadowAttenuation_7;
  highp vec4 v_8;
  v_8.x = unity_MatrixV[0].z;
  v_8.y = unity_MatrixV[1].z;
  v_8.z = unity_MatrixV[2].z;
  v_8.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (worldPos_6 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_6), v_8.xyz), sqrt(dot (tmpvar_9, tmpvar_9)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_10 = tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = worldPos_6;
  lowp float tmpvar_13;
  highp vec4 shadowCoord_14;
  shadowCoord_14 = (unity_WorldToShadow[0] * tmpvar_12);
  highp float lightShadowDataX_15;
  mediump float tmpvar_16;
  tmpvar_16 = _LightShadowData.x;
  lightShadowDataX_15 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = max (float((texture2D (_ShadowMapTexture, shadowCoord_14.xy).x > shadowCoord_14.z)), lightShadowDataX_15);
  tmpvar_13 = tmpvar_17;
  realtimeShadowAttenuation_7 = tmpvar_13;
  mediump float tmpvar_18;
  tmpvar_18 = clamp ((realtimeShadowAttenuation_7 + tmpvar_10), 0.0, 1.0);
  atten_1 = tmpvar_18;
  mediump vec3 tmpvar_19;
  tmpvar_19.x = xlv_TEXCOORD2.w;
  tmpvar_19.y = xlv_TEXCOORD2_1.w;
  tmpvar_19.z = xlv_TEXCOORD2_2.w;
  mediump float atten_20;
  atten_20 = atten_1;
  mediump vec3 tmpvar_21;
  tmpvar_21 = _LightColor0.xyz;
  tmpvar_21 = (tmpvar_21 * atten_20);
  mediump float specularTerm_22;
  mediump vec3 tmpvar_23;
  mediump vec3 inVec_24;
  inVec_24 = (tmpvar_19 - normalize(xlv_TEXCOORD1));
  tmpvar_23 = (inVec_24 * inversesqrt(max (0.001, 
    dot (inVec_24, inVec_24)
  )));
  mediump float tmpvar_25;
  tmpvar_25 = clamp (dot (tmpvar_5, tmpvar_23), 0.0, 1.0);
  mediump float tmpvar_26;
  tmpvar_26 = (1.0 - _Glossiness);
  mediump float tmpvar_27;
  tmpvar_27 = (tmpvar_26 * tmpvar_26);
  specularTerm_22 = ((tmpvar_27 / (
    (max (0.32, clamp (dot (tmpvar_19, tmpvar_23), 0.0, 1.0)) * (1.5 + tmpvar_27))
   * 
    (((tmpvar_25 * tmpvar_25) * ((tmpvar_27 * tmpvar_27) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_28;
  tmpvar_28 = clamp (specularTerm_22, 0.0, 100.0);
  specularTerm_22 = tmpvar_28;
  mediump vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = (((
    (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)))
   + 
    (tmpvar_28 * mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic)))
  ) * tmpvar_21) * clamp (dot (tmpvar_5, tmpvar_19), 0.0, 1.0));
  mediump vec4 xlat_varoutput_30;
  xlat_varoutput_30.xyz = tmpvar_29.xyz;
  xlat_varoutput_30.w = 1.0;
  gl_FragData[0] = xlat_varoutput_30;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 55 math, 2 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (_WorldSpaceLightPos0.xyz - (tmpvar_8.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_18.x;
  tmpvar_5.w = tmpvar_18.y;
  tmpvar_6.w = tmpvar_18.z;
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_8.xyz;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float atten_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2_2.xyz);
  highp vec3 worldPos_6;
  worldPos_6 = i_posWorld_2;
  mediump float realtimeShadowAttenuation_7;
  highp vec4 v_8;
  v_8.x = unity_MatrixV[0].z;
  v_8.y = unity_MatrixV[1].z;
  v_8.z = unity_MatrixV[2].z;
  v_8.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (worldPos_6 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_6), v_8.xyz), sqrt(dot (tmpvar_9, tmpvar_9)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_10 = tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = worldPos_6;
  lowp float tmpvar_13;
  highp vec4 shadowCoord_14;
  shadowCoord_14 = (unity_WorldToShadow[0] * tmpvar_12);
  highp float lightShadowDataX_15;
  mediump float tmpvar_16;
  tmpvar_16 = _LightShadowData.x;
  lightShadowDataX_15 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = max (float((texture2D (_ShadowMapTexture, shadowCoord_14.xy).x > shadowCoord_14.z)), lightShadowDataX_15);
  tmpvar_13 = tmpvar_17;
  realtimeShadowAttenuation_7 = tmpvar_13;
  mediump float tmpvar_18;
  tmpvar_18 = clamp ((realtimeShadowAttenuation_7 + tmpvar_10), 0.0, 1.0);
  atten_1 = tmpvar_18;
  mediump vec3 tmpvar_19;
  tmpvar_19.x = xlv_TEXCOORD2.w;
  tmpvar_19.y = xlv_TEXCOORD2_1.w;
  tmpvar_19.z = xlv_TEXCOORD2_2.w;
  mediump float atten_20;
  atten_20 = atten_1;
  mediump vec3 tmpvar_21;
  tmpvar_21 = _LightColor0.xyz;
  tmpvar_21 = (tmpvar_21 * atten_20);
  mediump float specularTerm_22;
  mediump vec3 tmpvar_23;
  mediump vec3 inVec_24;
  inVec_24 = (tmpvar_19 - normalize(xlv_TEXCOORD1));
  tmpvar_23 = (inVec_24 * inversesqrt(max (0.001, 
    dot (inVec_24, inVec_24)
  )));
  mediump float tmpvar_25;
  tmpvar_25 = clamp (dot (tmpvar_5, tmpvar_23), 0.0, 1.0);
  mediump float tmpvar_26;
  tmpvar_26 = (1.0 - _Glossiness);
  mediump float tmpvar_27;
  tmpvar_27 = (tmpvar_26 * tmpvar_26);
  specularTerm_22 = ((tmpvar_27 / (
    (max (0.32, clamp (dot (tmpvar_19, tmpvar_23), 0.0, 1.0)) * (1.5 + tmpvar_27))
   * 
    (((tmpvar_25 * tmpvar_25) * ((tmpvar_27 * tmpvar_27) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_28;
  tmpvar_28 = clamp (specularTerm_22, 0.0, 100.0);
  specularTerm_22 = tmpvar_28;
  mediump vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = (((
    (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)))
   + 
    (tmpvar_28 * mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic)))
  ) * tmpvar_21) * clamp (dot (tmpvar_5, tmpvar_19), 0.0, 1.0));
  mediump vec4 xlat_varoutput_30;
  xlat_varoutput_30.xyz = tmpvar_29.xyz;
  xlat_varoutput_30.w = 1.0;
  gl_FragData[0] = xlat_varoutput_30;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL_COOKIE SHADOWS_SCREEN 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 25 math, 3 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  lightDir_6 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  normalWorld_4 = tmpvar_18;
  tmpvar_8.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = lightDir_6;
  xlv_TEXCOORD5 = normalWorld_4;
}


#endif
#ifdef FRAGMENT
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  mediump vec3 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  tmpvar_2 = xlv_TEXCOORD1;
  mediump float tmpvar_5;
  tmpvar_5 = dot (xlv_TEXCOORD3.yzw, xlv_TEXCOORD4);
  mediump vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5));
  tmpvar_6.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_NHxRoughness, tmpvar_6);
  c_1 = (((tmpvar_4 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_7.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic))
  )) * _LightColor0.xyz);
  highp vec3 worldPos_8;
  worldPos_8 = tmpvar_2;
  mediump float realtimeShadowAttenuation_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = worldPos_8;
  lowp float tmpvar_11;
  highp vec4 shadowCoord_12;
  shadowCoord_12 = (unity_WorldToShadow[0] * tmpvar_10);
  highp float lightShadowDataX_13;
  mediump float tmpvar_14;
  tmpvar_14 = _LightShadowData.x;
  lightShadowDataX_13 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = max (float((texture2D (_ShadowMapTexture, shadowCoord_12.xy).x > shadowCoord_12.z)), lightShadowDataX_13);
  tmpvar_11 = tmpvar_15;
  realtimeShadowAttenuation_9 = tmpvar_11;
  c_1 = (c_1 * (realtimeShadowAttenuation_9 * clamp (
    dot (xlv_TEXCOORD5, xlv_TEXCOORD4)
  , 0.0, 1.0)));
  mediump vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = c_1;
  mediump vec4 xlat_varoutput_17;
  xlat_varoutput_17.xyz = tmpvar_16.xyz;
  xlat_varoutput_17.w = 1.0;
  gl_FragData[0] = xlat_varoutput_17;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 58 math, 3 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (_WorldSpaceLightPos0.xyz - (tmpvar_8.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_18.x;
  tmpvar_5.w = tmpvar_18.y;
  tmpvar_6.w = tmpvar_18.z;
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_8.xyz;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float shadow_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = i_posWorld_2;
  highp vec2 tmpvar_7;
  tmpvar_7 = (unity_WorldToLight * tmpvar_6).xy;
  highp vec3 worldPos_8;
  worldPos_8 = i_posWorld_2;
  mediump float realtimeShadowAttenuation_9;
  highp vec4 v_10;
  v_10.x = unity_MatrixV[0].z;
  v_10.y = unity_MatrixV[1].z;
  v_10.z = unity_MatrixV[2].z;
  v_10.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (worldPos_8 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_8), v_10.xyz), sqrt(dot (tmpvar_11, tmpvar_11)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_12 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = worldPos_8;
  lowp float tmpvar_15;
  highp vec4 shadowCoord_16;
  shadowCoord_16 = (unity_WorldToShadow[0] * tmpvar_14);
  highp float lightShadowDataX_17;
  mediump float tmpvar_18;
  tmpvar_18 = _LightShadowData.x;
  lightShadowDataX_17 = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = max (float((texture2D (_ShadowMapTexture, shadowCoord_16.xy).x > shadowCoord_16.z)), lightShadowDataX_17);
  tmpvar_15 = tmpvar_19;
  realtimeShadowAttenuation_9 = tmpvar_15;
  mediump float tmpvar_20;
  tmpvar_20 = clamp ((realtimeShadowAttenuation_9 + tmpvar_12), 0.0, 1.0);
  shadow_1 = tmpvar_20;
  lowp float tmpvar_21;
  tmpvar_21 = (texture2D (_LightTexture0, tmpvar_7).w * shadow_1);
  mediump vec3 tmpvar_22;
  tmpvar_22.x = xlv_TEXCOORD2.w;
  tmpvar_22.y = xlv_TEXCOORD2_1.w;
  tmpvar_22.z = xlv_TEXCOORD2_2.w;
  mediump float atten_23;
  atten_23 = tmpvar_21;
  mediump vec3 tmpvar_24;
  tmpvar_24 = _LightColor0.xyz;
  tmpvar_24 = (tmpvar_24 * atten_23);
  mediump float specularTerm_25;
  mediump vec3 tmpvar_26;
  mediump vec3 inVec_27;
  inVec_27 = (tmpvar_22 - normalize(xlv_TEXCOORD1));
  tmpvar_26 = (inVec_27 * inversesqrt(max (0.001, 
    dot (inVec_27, inVec_27)
  )));
  mediump float tmpvar_28;
  tmpvar_28 = clamp (dot (tmpvar_5, tmpvar_26), 0.0, 1.0);
  mediump float tmpvar_29;
  tmpvar_29 = (1.0 - _Glossiness);
  mediump float tmpvar_30;
  tmpvar_30 = (tmpvar_29 * tmpvar_29);
  specularTerm_25 = ((tmpvar_30 / (
    (max (0.32, clamp (dot (tmpvar_22, tmpvar_26), 0.0, 1.0)) * (1.5 + tmpvar_30))
   * 
    (((tmpvar_28 * tmpvar_28) * ((tmpvar_30 * tmpvar_30) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_31;
  tmpvar_31 = clamp (specularTerm_25, 0.0, 100.0);
  specularTerm_25 = tmpvar_31;
  mediump vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = (((
    (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)))
   + 
    (tmpvar_31 * mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic)))
  ) * tmpvar_24) * clamp (dot (tmpvar_5, tmpvar_22), 0.0, 1.0));
  mediump vec4 xlat_varoutput_33;
  xlat_varoutput_33.xyz = tmpvar_32.xyz;
  xlat_varoutput_33.w = 1.0;
  gl_FragData[0] = xlat_varoutput_33;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 58 math, 3 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (_WorldSpaceLightPos0.xyz - (tmpvar_8.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_18.x;
  tmpvar_5.w = tmpvar_18.y;
  tmpvar_6.w = tmpvar_18.z;
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_8.xyz;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float shadow_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = i_posWorld_2;
  highp vec2 tmpvar_7;
  tmpvar_7 = (unity_WorldToLight * tmpvar_6).xy;
  highp vec3 worldPos_8;
  worldPos_8 = i_posWorld_2;
  mediump float realtimeShadowAttenuation_9;
  highp vec4 v_10;
  v_10.x = unity_MatrixV[0].z;
  v_10.y = unity_MatrixV[1].z;
  v_10.z = unity_MatrixV[2].z;
  v_10.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (worldPos_8 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_8), v_10.xyz), sqrt(dot (tmpvar_11, tmpvar_11)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_12 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = worldPos_8;
  lowp float tmpvar_15;
  highp vec4 shadowCoord_16;
  shadowCoord_16 = (unity_WorldToShadow[0] * tmpvar_14);
  highp float lightShadowDataX_17;
  mediump float tmpvar_18;
  tmpvar_18 = _LightShadowData.x;
  lightShadowDataX_17 = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = max (float((texture2D (_ShadowMapTexture, shadowCoord_16.xy).x > shadowCoord_16.z)), lightShadowDataX_17);
  tmpvar_15 = tmpvar_19;
  realtimeShadowAttenuation_9 = tmpvar_15;
  mediump float tmpvar_20;
  tmpvar_20 = clamp ((realtimeShadowAttenuation_9 + tmpvar_12), 0.0, 1.0);
  shadow_1 = tmpvar_20;
  lowp float tmpvar_21;
  tmpvar_21 = (texture2D (_LightTexture0, tmpvar_7).w * shadow_1);
  mediump vec3 tmpvar_22;
  tmpvar_22.x = xlv_TEXCOORD2.w;
  tmpvar_22.y = xlv_TEXCOORD2_1.w;
  tmpvar_22.z = xlv_TEXCOORD2_2.w;
  mediump float atten_23;
  atten_23 = tmpvar_21;
  mediump vec3 tmpvar_24;
  tmpvar_24 = _LightColor0.xyz;
  tmpvar_24 = (tmpvar_24 * atten_23);
  mediump float specularTerm_25;
  mediump vec3 tmpvar_26;
  mediump vec3 inVec_27;
  inVec_27 = (tmpvar_22 - normalize(xlv_TEXCOORD1));
  tmpvar_26 = (inVec_27 * inversesqrt(max (0.001, 
    dot (inVec_27, inVec_27)
  )));
  mediump float tmpvar_28;
  tmpvar_28 = clamp (dot (tmpvar_5, tmpvar_26), 0.0, 1.0);
  mediump float tmpvar_29;
  tmpvar_29 = (1.0 - _Glossiness);
  mediump float tmpvar_30;
  tmpvar_30 = (tmpvar_29 * tmpvar_29);
  specularTerm_25 = ((tmpvar_30 / (
    (max (0.32, clamp (dot (tmpvar_22, tmpvar_26), 0.0, 1.0)) * (1.5 + tmpvar_30))
   * 
    (((tmpvar_28 * tmpvar_28) * ((tmpvar_30 * tmpvar_30) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_31;
  tmpvar_31 = clamp (specularTerm_25, 0.0, 100.0);
  specularTerm_25 = tmpvar_31;
  mediump vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = (((
    (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)))
   + 
    (tmpvar_31 * mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic)))
  ) * tmpvar_24) * clamp (dot (tmpvar_5, tmpvar_22), 0.0, 1.0));
  mediump vec4 xlat_varoutput_33;
  xlat_varoutput_33.xyz = tmpvar_32.xyz;
  xlat_varoutput_33.w = 1.0;
  gl_FragData[0] = xlat_varoutput_33;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: POINT SHADOWS_CUBE 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 28 math, 3 textures, 1 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  lightDir_6 = tmpvar_14;
  mediump vec3 tmpvar_15;
  highp vec3 n_16;
  n_16 = lightDir_6;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(n_16);
  tmpvar_15 = tmpvar_17;
  lightDir_6 = tmpvar_15;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_18;
  highp vec3 norm_19;
  norm_19 = tmpvar_1;
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((norm_19 * tmpvar_20));
  normalWorld_4 = tmpvar_21;
  tmpvar_8.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = tmpvar_15;
  xlv_TEXCOORD5 = normalWorld_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  mediump vec3 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  tmpvar_2 = xlv_TEXCOORD1;
  mediump float tmpvar_5;
  tmpvar_5 = dot (xlv_TEXCOORD3.yzw, xlv_TEXCOORD4);
  mediump vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5));
  tmpvar_6.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_NHxRoughness, tmpvar_6);
  c_1 = (((tmpvar_4 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_7.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic))
  )) * _LightColor0.xyz);
  highp vec3 worldPos_8;
  worldPos_8 = tmpvar_2;
  highp vec3 vec_9;
  vec_9 = (worldPos_8 - _LightPositionRange.xyz);
  highp float mydist_10;
  mydist_10 = ((sqrt(
    dot (vec_9, vec_9)
  ) * _LightPositionRange.w) * 0.97);
  highp float tmpvar_11;
  tmpvar_11 = dot (textureCube (_ShadowMapTexture, vec_9), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  mediump float tmpvar_12;
  if ((tmpvar_11 < mydist_10)) {
    tmpvar_12 = _LightShadowData.x;
  } else {
    tmpvar_12 = 1.0;
  };
  c_1 = (c_1 * (tmpvar_12 * clamp (
    dot (xlv_TEXCOORD5, xlv_TEXCOORD4)
  , 0.0, 1.0)));
  mediump vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = c_1;
  mediump vec4 xlat_varoutput_14;
  xlat_varoutput_14.xyz = tmpvar_13.xyz;
  xlat_varoutput_14.w = 1.0;
  gl_FragData[0] = xlat_varoutput_14;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 63 math, 3 textures, 1 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 n_15;
  n_15 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  tmpvar_14 = n_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  lightDir_4 = tmpvar_20;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float shadow_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic));
  tmpvar_5 = (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = i_posWorld_2;
  highp vec3 tmpvar_10;
  tmpvar_10 = (unity_WorldToLight * tmpvar_9).xyz;
  highp vec3 worldPos_11;
  worldPos_11 = i_posWorld_2;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (worldPos_11 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_11), v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  highp vec3 vec_16;
  vec_16 = (worldPos_11 - _LightPositionRange.xyz);
  highp float mydist_17;
  mydist_17 = ((sqrt(
    dot (vec_16, vec_16)
  ) * _LightPositionRange.w) * 0.97);
  highp float tmpvar_18;
  tmpvar_18 = dot (textureCube (_ShadowMapTexture, vec_16), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  mediump float tmpvar_19;
  if ((tmpvar_18 < mydist_17)) {
    tmpvar_19 = _LightShadowData.x;
  } else {
    tmpvar_19 = 1.0;
  };
  mediump float tmpvar_20;
  tmpvar_20 = clamp ((tmpvar_19 + tmpvar_14), 0.0, 1.0);
  shadow_1 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (tmpvar_10, tmpvar_10);
  lowp float tmpvar_22;
  tmpvar_22 = (texture2D (_LightTexture0, vec2(tmpvar_21)).w * shadow_1);
  mediump vec3 tmpvar_23;
  tmpvar_23.x = xlv_TEXCOORD2.w;
  tmpvar_23.y = xlv_TEXCOORD2_1.w;
  tmpvar_23.z = xlv_TEXCOORD2_2.w;
  mediump float atten_24;
  atten_24 = tmpvar_22;
  mediump vec3 tmpvar_25;
  tmpvar_25 = _LightColor0.xyz;
  mediump vec3 tmpvar_26;
  tmpvar_26 = normalize(tmpvar_23);
  tmpvar_25 = (tmpvar_25 * atten_24);
  mediump float specularTerm_27;
  mediump vec3 tmpvar_28;
  mediump vec3 inVec_29;
  inVec_29 = (tmpvar_26 - tmpvar_8);
  tmpvar_28 = (inVec_29 * inversesqrt(max (0.001, 
    dot (inVec_29, inVec_29)
  )));
  mediump float tmpvar_30;
  tmpvar_30 = clamp (dot (tmpvar_7, tmpvar_28), 0.0, 1.0);
  mediump float tmpvar_31;
  tmpvar_31 = (1.0 - _Glossiness);
  mediump float tmpvar_32;
  tmpvar_32 = (tmpvar_31 * tmpvar_31);
  specularTerm_27 = ((tmpvar_32 / (
    (max (0.32, clamp (dot (tmpvar_26, tmpvar_28), 0.0, 1.0)) * (1.5 + tmpvar_32))
   * 
    (((tmpvar_30 * tmpvar_30) * ((tmpvar_32 * tmpvar_32) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_33;
  tmpvar_33 = clamp (specularTerm_27, 0.0, 100.0);
  specularTerm_27 = tmpvar_33;
  mediump vec4 tmpvar_34;
  tmpvar_34.w = 1.0;
  tmpvar_34.xyz = (((tmpvar_5 + 
    (tmpvar_33 * tmpvar_6)
  ) * tmpvar_25) * clamp (dot (tmpvar_7, tmpvar_26), 0.0, 1.0));
  mediump vec4 xlat_varoutput_35;
  xlat_varoutput_35.xyz = tmpvar_34.xyz;
  xlat_varoutput_35.w = 1.0;
  gl_FragData[0] = xlat_varoutput_35;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 63 math, 3 textures, 1 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 n_15;
  n_15 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  tmpvar_14 = n_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  lightDir_4 = tmpvar_20;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float shadow_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic));
  tmpvar_5 = (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = i_posWorld_2;
  highp vec3 tmpvar_10;
  tmpvar_10 = (unity_WorldToLight * tmpvar_9).xyz;
  highp vec3 worldPos_11;
  worldPos_11 = i_posWorld_2;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (worldPos_11 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_11), v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  highp vec3 vec_16;
  vec_16 = (worldPos_11 - _LightPositionRange.xyz);
  highp float mydist_17;
  mydist_17 = ((sqrt(
    dot (vec_16, vec_16)
  ) * _LightPositionRange.w) * 0.97);
  highp float tmpvar_18;
  tmpvar_18 = dot (textureCube (_ShadowMapTexture, vec_16), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  mediump float tmpvar_19;
  if ((tmpvar_18 < mydist_17)) {
    tmpvar_19 = _LightShadowData.x;
  } else {
    tmpvar_19 = 1.0;
  };
  mediump float tmpvar_20;
  tmpvar_20 = clamp ((tmpvar_19 + tmpvar_14), 0.0, 1.0);
  shadow_1 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (tmpvar_10, tmpvar_10);
  lowp float tmpvar_22;
  tmpvar_22 = (texture2D (_LightTexture0, vec2(tmpvar_21)).w * shadow_1);
  mediump vec3 tmpvar_23;
  tmpvar_23.x = xlv_TEXCOORD2.w;
  tmpvar_23.y = xlv_TEXCOORD2_1.w;
  tmpvar_23.z = xlv_TEXCOORD2_2.w;
  mediump float atten_24;
  atten_24 = tmpvar_22;
  mediump vec3 tmpvar_25;
  tmpvar_25 = _LightColor0.xyz;
  mediump vec3 tmpvar_26;
  tmpvar_26 = normalize(tmpvar_23);
  tmpvar_25 = (tmpvar_25 * atten_24);
  mediump float specularTerm_27;
  mediump vec3 tmpvar_28;
  mediump vec3 inVec_29;
  inVec_29 = (tmpvar_26 - tmpvar_8);
  tmpvar_28 = (inVec_29 * inversesqrt(max (0.001, 
    dot (inVec_29, inVec_29)
  )));
  mediump float tmpvar_30;
  tmpvar_30 = clamp (dot (tmpvar_7, tmpvar_28), 0.0, 1.0);
  mediump float tmpvar_31;
  tmpvar_31 = (1.0 - _Glossiness);
  mediump float tmpvar_32;
  tmpvar_32 = (tmpvar_31 * tmpvar_31);
  specularTerm_27 = ((tmpvar_32 / (
    (max (0.32, clamp (dot (tmpvar_26, tmpvar_28), 0.0, 1.0)) * (1.5 + tmpvar_32))
   * 
    (((tmpvar_30 * tmpvar_30) * ((tmpvar_32 * tmpvar_32) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_33;
  tmpvar_33 = clamp (specularTerm_27, 0.0, 100.0);
  specularTerm_27 = tmpvar_33;
  mediump vec4 tmpvar_34;
  tmpvar_34.w = 1.0;
  tmpvar_34.xyz = (((tmpvar_5 + 
    (tmpvar_33 * tmpvar_6)
  ) * tmpvar_25) * clamp (dot (tmpvar_7, tmpvar_26), 0.0, 1.0));
  mediump vec4 xlat_varoutput_35;
  xlat_varoutput_35.xyz = tmpvar_34.xyz;
  xlat_varoutput_35.w = 1.0;
  gl_FragData[0] = xlat_varoutput_35;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: POINT SHADOWS_CUBE SHADOWS_SOFT 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 39 math, 6 textures, 4 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  lightDir_6 = tmpvar_14;
  mediump vec3 tmpvar_15;
  highp vec3 n_16;
  n_16 = lightDir_6;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(n_16);
  tmpvar_15 = tmpvar_17;
  lightDir_6 = tmpvar_15;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_18;
  highp vec3 norm_19;
  norm_19 = tmpvar_1;
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((norm_19 * tmpvar_20));
  normalWorld_4 = tmpvar_21;
  tmpvar_8.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = tmpvar_15;
  xlv_TEXCOORD5 = normalWorld_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  mediump vec3 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  tmpvar_2 = xlv_TEXCOORD1;
  mediump float tmpvar_5;
  tmpvar_5 = dot (xlv_TEXCOORD3.yzw, xlv_TEXCOORD4);
  mediump vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5));
  tmpvar_6.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_NHxRoughness, tmpvar_6);
  c_1 = (((tmpvar_4 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_7.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic))
  )) * _LightColor0.xyz);
  highp vec3 worldPos_8;
  worldPos_8 = tmpvar_2;
  highp vec3 vec_9;
  vec_9 = (worldPos_8 - _LightPositionRange.xyz);
  highp vec4 shadowVals_10;
  highp float mydist_11;
  mydist_11 = ((sqrt(
    dot (vec_9, vec_9)
  ) * _LightPositionRange.w) * 0.97);
  shadowVals_10.x = dot (textureCube (_ShadowMapTexture, (vec_9 + vec3(0.0078125, 0.0078125, 0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_10.y = dot (textureCube (_ShadowMapTexture, (vec_9 + vec3(-0.0078125, -0.0078125, 0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_10.z = dot (textureCube (_ShadowMapTexture, (vec_9 + vec3(-0.0078125, 0.0078125, -0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_10.w = dot (textureCube (_ShadowMapTexture, (vec_9 + vec3(0.0078125, -0.0078125, -0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  bvec4 tmpvar_12;
  tmpvar_12 = lessThan (shadowVals_10, vec4(mydist_11));
  mediump vec4 tmpvar_13;
  tmpvar_13 = _LightShadowData.xxxx;
  mediump float tmpvar_14;
  if (tmpvar_12.x) {
    tmpvar_14 = tmpvar_13.x;
  } else {
    tmpvar_14 = 1.0;
  };
  mediump float tmpvar_15;
  if (tmpvar_12.y) {
    tmpvar_15 = tmpvar_13.y;
  } else {
    tmpvar_15 = 1.0;
  };
  mediump float tmpvar_16;
  if (tmpvar_12.z) {
    tmpvar_16 = tmpvar_13.z;
  } else {
    tmpvar_16 = 1.0;
  };
  mediump float tmpvar_17;
  if (tmpvar_12.w) {
    tmpvar_17 = tmpvar_13.w;
  } else {
    tmpvar_17 = 1.0;
  };
  mediump vec4 tmpvar_18;
  tmpvar_18.x = tmpvar_14;
  tmpvar_18.y = tmpvar_15;
  tmpvar_18.z = tmpvar_16;
  tmpvar_18.w = tmpvar_17;
  c_1 = (c_1 * (dot (tmpvar_18, vec4(0.25, 0.25, 0.25, 0.25)) * clamp (
    dot (xlv_TEXCOORD5, xlv_TEXCOORD4)
  , 0.0, 1.0)));
  mediump vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = c_1;
  mediump vec4 xlat_varoutput_20;
  xlat_varoutput_20.xyz = tmpvar_19.xyz;
  xlat_varoutput_20.w = 1.0;
  gl_FragData[0] = xlat_varoutput_20;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 74 math, 6 textures, 4 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 n_15;
  n_15 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  tmpvar_14 = n_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  lightDir_4 = tmpvar_20;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float shadow_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic));
  tmpvar_5 = (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = i_posWorld_2;
  highp vec3 tmpvar_10;
  tmpvar_10 = (unity_WorldToLight * tmpvar_9).xyz;
  highp vec3 worldPos_11;
  worldPos_11 = i_posWorld_2;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (worldPos_11 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_11), v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  highp vec3 vec_16;
  vec_16 = (worldPos_11 - _LightPositionRange.xyz);
  highp vec4 shadowVals_17;
  highp float mydist_18;
  mydist_18 = ((sqrt(
    dot (vec_16, vec_16)
  ) * _LightPositionRange.w) * 0.97);
  shadowVals_17.x = dot (textureCube (_ShadowMapTexture, (vec_16 + vec3(0.0078125, 0.0078125, 0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_17.y = dot (textureCube (_ShadowMapTexture, (vec_16 + vec3(-0.0078125, -0.0078125, 0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_17.z = dot (textureCube (_ShadowMapTexture, (vec_16 + vec3(-0.0078125, 0.0078125, -0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_17.w = dot (textureCube (_ShadowMapTexture, (vec_16 + vec3(0.0078125, -0.0078125, -0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  bvec4 tmpvar_19;
  tmpvar_19 = lessThan (shadowVals_17, vec4(mydist_18));
  mediump vec4 tmpvar_20;
  tmpvar_20 = _LightShadowData.xxxx;
  mediump float tmpvar_21;
  if (tmpvar_19.x) {
    tmpvar_21 = tmpvar_20.x;
  } else {
    tmpvar_21 = 1.0;
  };
  mediump float tmpvar_22;
  if (tmpvar_19.y) {
    tmpvar_22 = tmpvar_20.y;
  } else {
    tmpvar_22 = 1.0;
  };
  mediump float tmpvar_23;
  if (tmpvar_19.z) {
    tmpvar_23 = tmpvar_20.z;
  } else {
    tmpvar_23 = 1.0;
  };
  mediump float tmpvar_24;
  if (tmpvar_19.w) {
    tmpvar_24 = tmpvar_20.w;
  } else {
    tmpvar_24 = 1.0;
  };
  mediump vec4 tmpvar_25;
  tmpvar_25.x = tmpvar_21;
  tmpvar_25.y = tmpvar_22;
  tmpvar_25.z = tmpvar_23;
  tmpvar_25.w = tmpvar_24;
  mediump float tmpvar_26;
  tmpvar_26 = clamp ((dot (tmpvar_25, vec4(0.25, 0.25, 0.25, 0.25)) + tmpvar_14), 0.0, 1.0);
  shadow_1 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (tmpvar_10, tmpvar_10);
  lowp float tmpvar_28;
  tmpvar_28 = (texture2D (_LightTexture0, vec2(tmpvar_27)).w * shadow_1);
  mediump vec3 tmpvar_29;
  tmpvar_29.x = xlv_TEXCOORD2.w;
  tmpvar_29.y = xlv_TEXCOORD2_1.w;
  tmpvar_29.z = xlv_TEXCOORD2_2.w;
  mediump float atten_30;
  atten_30 = tmpvar_28;
  mediump vec3 tmpvar_31;
  tmpvar_31 = _LightColor0.xyz;
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize(tmpvar_29);
  tmpvar_31 = (tmpvar_31 * atten_30);
  mediump float specularTerm_33;
  mediump vec3 tmpvar_34;
  mediump vec3 inVec_35;
  inVec_35 = (tmpvar_32 - tmpvar_8);
  tmpvar_34 = (inVec_35 * inversesqrt(max (0.001, 
    dot (inVec_35, inVec_35)
  )));
  mediump float tmpvar_36;
  tmpvar_36 = clamp (dot (tmpvar_7, tmpvar_34), 0.0, 1.0);
  mediump float tmpvar_37;
  tmpvar_37 = (1.0 - _Glossiness);
  mediump float tmpvar_38;
  tmpvar_38 = (tmpvar_37 * tmpvar_37);
  specularTerm_33 = ((tmpvar_38 / (
    (max (0.32, clamp (dot (tmpvar_32, tmpvar_34), 0.0, 1.0)) * (1.5 + tmpvar_38))
   * 
    (((tmpvar_36 * tmpvar_36) * ((tmpvar_38 * tmpvar_38) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_39;
  tmpvar_39 = clamp (specularTerm_33, 0.0, 100.0);
  specularTerm_33 = tmpvar_39;
  mediump vec4 tmpvar_40;
  tmpvar_40.w = 1.0;
  tmpvar_40.xyz = (((tmpvar_5 + 
    (tmpvar_39 * tmpvar_6)
  ) * tmpvar_31) * clamp (dot (tmpvar_7, tmpvar_32), 0.0, 1.0));
  mediump vec4 xlat_varoutput_41;
  xlat_varoutput_41.xyz = tmpvar_40.xyz;
  xlat_varoutput_41.w = 1.0;
  gl_FragData[0] = xlat_varoutput_41;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 74 math, 6 textures, 4 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 n_15;
  n_15 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  tmpvar_14 = n_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  lightDir_4 = tmpvar_20;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float shadow_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic));
  tmpvar_5 = (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = i_posWorld_2;
  highp vec3 tmpvar_10;
  tmpvar_10 = (unity_WorldToLight * tmpvar_9).xyz;
  highp vec3 worldPos_11;
  worldPos_11 = i_posWorld_2;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (worldPos_11 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_11), v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  highp vec3 vec_16;
  vec_16 = (worldPos_11 - _LightPositionRange.xyz);
  highp vec4 shadowVals_17;
  highp float mydist_18;
  mydist_18 = ((sqrt(
    dot (vec_16, vec_16)
  ) * _LightPositionRange.w) * 0.97);
  shadowVals_17.x = dot (textureCube (_ShadowMapTexture, (vec_16 + vec3(0.0078125, 0.0078125, 0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_17.y = dot (textureCube (_ShadowMapTexture, (vec_16 + vec3(-0.0078125, -0.0078125, 0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_17.z = dot (textureCube (_ShadowMapTexture, (vec_16 + vec3(-0.0078125, 0.0078125, -0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_17.w = dot (textureCube (_ShadowMapTexture, (vec_16 + vec3(0.0078125, -0.0078125, -0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  bvec4 tmpvar_19;
  tmpvar_19 = lessThan (shadowVals_17, vec4(mydist_18));
  mediump vec4 tmpvar_20;
  tmpvar_20 = _LightShadowData.xxxx;
  mediump float tmpvar_21;
  if (tmpvar_19.x) {
    tmpvar_21 = tmpvar_20.x;
  } else {
    tmpvar_21 = 1.0;
  };
  mediump float tmpvar_22;
  if (tmpvar_19.y) {
    tmpvar_22 = tmpvar_20.y;
  } else {
    tmpvar_22 = 1.0;
  };
  mediump float tmpvar_23;
  if (tmpvar_19.z) {
    tmpvar_23 = tmpvar_20.z;
  } else {
    tmpvar_23 = 1.0;
  };
  mediump float tmpvar_24;
  if (tmpvar_19.w) {
    tmpvar_24 = tmpvar_20.w;
  } else {
    tmpvar_24 = 1.0;
  };
  mediump vec4 tmpvar_25;
  tmpvar_25.x = tmpvar_21;
  tmpvar_25.y = tmpvar_22;
  tmpvar_25.z = tmpvar_23;
  tmpvar_25.w = tmpvar_24;
  mediump float tmpvar_26;
  tmpvar_26 = clamp ((dot (tmpvar_25, vec4(0.25, 0.25, 0.25, 0.25)) + tmpvar_14), 0.0, 1.0);
  shadow_1 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (tmpvar_10, tmpvar_10);
  lowp float tmpvar_28;
  tmpvar_28 = (texture2D (_LightTexture0, vec2(tmpvar_27)).w * shadow_1);
  mediump vec3 tmpvar_29;
  tmpvar_29.x = xlv_TEXCOORD2.w;
  tmpvar_29.y = xlv_TEXCOORD2_1.w;
  tmpvar_29.z = xlv_TEXCOORD2_2.w;
  mediump float atten_30;
  atten_30 = tmpvar_28;
  mediump vec3 tmpvar_31;
  tmpvar_31 = _LightColor0.xyz;
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize(tmpvar_29);
  tmpvar_31 = (tmpvar_31 * atten_30);
  mediump float specularTerm_33;
  mediump vec3 tmpvar_34;
  mediump vec3 inVec_35;
  inVec_35 = (tmpvar_32 - tmpvar_8);
  tmpvar_34 = (inVec_35 * inversesqrt(max (0.001, 
    dot (inVec_35, inVec_35)
  )));
  mediump float tmpvar_36;
  tmpvar_36 = clamp (dot (tmpvar_7, tmpvar_34), 0.0, 1.0);
  mediump float tmpvar_37;
  tmpvar_37 = (1.0 - _Glossiness);
  mediump float tmpvar_38;
  tmpvar_38 = (tmpvar_37 * tmpvar_37);
  specularTerm_33 = ((tmpvar_38 / (
    (max (0.32, clamp (dot (tmpvar_32, tmpvar_34), 0.0, 1.0)) * (1.5 + tmpvar_38))
   * 
    (((tmpvar_36 * tmpvar_36) * ((tmpvar_38 * tmpvar_38) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_39;
  tmpvar_39 = clamp (specularTerm_33, 0.0, 100.0);
  specularTerm_33 = tmpvar_39;
  mediump vec4 tmpvar_40;
  tmpvar_40.w = 1.0;
  tmpvar_40.xyz = (((tmpvar_5 + 
    (tmpvar_39 * tmpvar_6)
  ) * tmpvar_31) * clamp (dot (tmpvar_7, tmpvar_32), 0.0, 1.0));
  mediump vec4 xlat_varoutput_41;
  xlat_varoutput_41.xyz = tmpvar_40.xyz;
  xlat_varoutput_41.w = 1.0;
  gl_FragData[0] = xlat_varoutput_41;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 28 math, 3 textures, 1 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  lightDir_6 = tmpvar_14;
  mediump vec3 tmpvar_15;
  highp vec3 n_16;
  n_16 = lightDir_6;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(n_16);
  tmpvar_15 = tmpvar_17;
  lightDir_6 = tmpvar_15;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_18;
  highp vec3 norm_19;
  norm_19 = tmpvar_1;
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((norm_19 * tmpvar_20));
  normalWorld_4 = tmpvar_21;
  tmpvar_8.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = tmpvar_15;
  xlv_TEXCOORD5 = normalWorld_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  mediump vec3 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  tmpvar_2 = xlv_TEXCOORD1;
  mediump float tmpvar_5;
  tmpvar_5 = dot (xlv_TEXCOORD3.yzw, xlv_TEXCOORD4);
  mediump vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5));
  tmpvar_6.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_NHxRoughness, tmpvar_6);
  c_1 = (((tmpvar_4 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_7.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic))
  )) * _LightColor0.xyz);
  highp vec3 worldPos_8;
  worldPos_8 = tmpvar_2;
  highp vec3 vec_9;
  vec_9 = (worldPos_8 - _LightPositionRange.xyz);
  highp float mydist_10;
  mydist_10 = ((sqrt(
    dot (vec_9, vec_9)
  ) * _LightPositionRange.w) * 0.97);
  highp float tmpvar_11;
  tmpvar_11 = dot (textureCube (_ShadowMapTexture, vec_9), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  mediump float tmpvar_12;
  if ((tmpvar_11 < mydist_10)) {
    tmpvar_12 = _LightShadowData.x;
  } else {
    tmpvar_12 = 1.0;
  };
  c_1 = (c_1 * (tmpvar_12 * clamp (
    dot (xlv_TEXCOORD5, xlv_TEXCOORD4)
  , 0.0, 1.0)));
  mediump vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = c_1;
  mediump vec4 xlat_varoutput_14;
  xlat_varoutput_14.xyz = tmpvar_13.xyz;
  xlat_varoutput_14.w = 1.0;
  gl_FragData[0] = xlat_varoutput_14;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 64 math, 4 textures, 1 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 n_15;
  n_15 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  tmpvar_14 = n_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  lightDir_4 = tmpvar_20;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform lowp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float shadow_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic));
  tmpvar_5 = (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = i_posWorld_2;
  highp vec3 tmpvar_10;
  tmpvar_10 = (unity_WorldToLight * tmpvar_9).xyz;
  highp vec3 worldPos_11;
  worldPos_11 = i_posWorld_2;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (worldPos_11 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_11), v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  highp vec3 vec_16;
  vec_16 = (worldPos_11 - _LightPositionRange.xyz);
  highp float mydist_17;
  mydist_17 = ((sqrt(
    dot (vec_16, vec_16)
  ) * _LightPositionRange.w) * 0.97);
  highp float tmpvar_18;
  tmpvar_18 = dot (textureCube (_ShadowMapTexture, vec_16), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  mediump float tmpvar_19;
  if ((tmpvar_18 < mydist_17)) {
    tmpvar_19 = _LightShadowData.x;
  } else {
    tmpvar_19 = 1.0;
  };
  mediump float tmpvar_20;
  tmpvar_20 = clamp ((tmpvar_19 + tmpvar_14), 0.0, 1.0);
  shadow_1 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (tmpvar_10, tmpvar_10);
  lowp float tmpvar_22;
  tmpvar_22 = ((texture2D (_LightTextureB0, vec2(tmpvar_21)).w * textureCube (_LightTexture0, tmpvar_10).w) * shadow_1);
  mediump vec3 tmpvar_23;
  tmpvar_23.x = xlv_TEXCOORD2.w;
  tmpvar_23.y = xlv_TEXCOORD2_1.w;
  tmpvar_23.z = xlv_TEXCOORD2_2.w;
  mediump float atten_24;
  atten_24 = tmpvar_22;
  mediump vec3 tmpvar_25;
  tmpvar_25 = _LightColor0.xyz;
  mediump vec3 tmpvar_26;
  tmpvar_26 = normalize(tmpvar_23);
  tmpvar_25 = (tmpvar_25 * atten_24);
  mediump float specularTerm_27;
  mediump vec3 tmpvar_28;
  mediump vec3 inVec_29;
  inVec_29 = (tmpvar_26 - tmpvar_8);
  tmpvar_28 = (inVec_29 * inversesqrt(max (0.001, 
    dot (inVec_29, inVec_29)
  )));
  mediump float tmpvar_30;
  tmpvar_30 = clamp (dot (tmpvar_7, tmpvar_28), 0.0, 1.0);
  mediump float tmpvar_31;
  tmpvar_31 = (1.0 - _Glossiness);
  mediump float tmpvar_32;
  tmpvar_32 = (tmpvar_31 * tmpvar_31);
  specularTerm_27 = ((tmpvar_32 / (
    (max (0.32, clamp (dot (tmpvar_26, tmpvar_28), 0.0, 1.0)) * (1.5 + tmpvar_32))
   * 
    (((tmpvar_30 * tmpvar_30) * ((tmpvar_32 * tmpvar_32) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_33;
  tmpvar_33 = clamp (specularTerm_27, 0.0, 100.0);
  specularTerm_27 = tmpvar_33;
  mediump vec4 tmpvar_34;
  tmpvar_34.w = 1.0;
  tmpvar_34.xyz = (((tmpvar_5 + 
    (tmpvar_33 * tmpvar_6)
  ) * tmpvar_25) * clamp (dot (tmpvar_7, tmpvar_26), 0.0, 1.0));
  mediump vec4 xlat_varoutput_35;
  xlat_varoutput_35.xyz = tmpvar_34.xyz;
  xlat_varoutput_35.w = 1.0;
  gl_FragData[0] = xlat_varoutput_35;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 64 math, 4 textures, 1 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 n_15;
  n_15 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  tmpvar_14 = n_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  lightDir_4 = tmpvar_20;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform lowp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float shadow_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic));
  tmpvar_5 = (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = i_posWorld_2;
  highp vec3 tmpvar_10;
  tmpvar_10 = (unity_WorldToLight * tmpvar_9).xyz;
  highp vec3 worldPos_11;
  worldPos_11 = i_posWorld_2;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (worldPos_11 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_11), v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  highp vec3 vec_16;
  vec_16 = (worldPos_11 - _LightPositionRange.xyz);
  highp float mydist_17;
  mydist_17 = ((sqrt(
    dot (vec_16, vec_16)
  ) * _LightPositionRange.w) * 0.97);
  highp float tmpvar_18;
  tmpvar_18 = dot (textureCube (_ShadowMapTexture, vec_16), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  mediump float tmpvar_19;
  if ((tmpvar_18 < mydist_17)) {
    tmpvar_19 = _LightShadowData.x;
  } else {
    tmpvar_19 = 1.0;
  };
  mediump float tmpvar_20;
  tmpvar_20 = clamp ((tmpvar_19 + tmpvar_14), 0.0, 1.0);
  shadow_1 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (tmpvar_10, tmpvar_10);
  lowp float tmpvar_22;
  tmpvar_22 = ((texture2D (_LightTextureB0, vec2(tmpvar_21)).w * textureCube (_LightTexture0, tmpvar_10).w) * shadow_1);
  mediump vec3 tmpvar_23;
  tmpvar_23.x = xlv_TEXCOORD2.w;
  tmpvar_23.y = xlv_TEXCOORD2_1.w;
  tmpvar_23.z = xlv_TEXCOORD2_2.w;
  mediump float atten_24;
  atten_24 = tmpvar_22;
  mediump vec3 tmpvar_25;
  tmpvar_25 = _LightColor0.xyz;
  mediump vec3 tmpvar_26;
  tmpvar_26 = normalize(tmpvar_23);
  tmpvar_25 = (tmpvar_25 * atten_24);
  mediump float specularTerm_27;
  mediump vec3 tmpvar_28;
  mediump vec3 inVec_29;
  inVec_29 = (tmpvar_26 - tmpvar_8);
  tmpvar_28 = (inVec_29 * inversesqrt(max (0.001, 
    dot (inVec_29, inVec_29)
  )));
  mediump float tmpvar_30;
  tmpvar_30 = clamp (dot (tmpvar_7, tmpvar_28), 0.0, 1.0);
  mediump float tmpvar_31;
  tmpvar_31 = (1.0 - _Glossiness);
  mediump float tmpvar_32;
  tmpvar_32 = (tmpvar_31 * tmpvar_31);
  specularTerm_27 = ((tmpvar_32 / (
    (max (0.32, clamp (dot (tmpvar_26, tmpvar_28), 0.0, 1.0)) * (1.5 + tmpvar_32))
   * 
    (((tmpvar_30 * tmpvar_30) * ((tmpvar_32 * tmpvar_32) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_33;
  tmpvar_33 = clamp (specularTerm_27, 0.0, 100.0);
  specularTerm_27 = tmpvar_33;
  mediump vec4 tmpvar_34;
  tmpvar_34.w = 1.0;
  tmpvar_34.xyz = (((tmpvar_5 + 
    (tmpvar_33 * tmpvar_6)
  ) * tmpvar_25) * clamp (dot (tmpvar_7, tmpvar_26), 0.0, 1.0));
  mediump vec4 xlat_varoutput_35;
  xlat_varoutput_35.xyz = tmpvar_34.xyz;
  xlat_varoutput_35.w = 1.0;
  gl_FragData[0] = xlat_varoutput_35;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: POINT_COOKIE SHADOWS_CUBE SHADOWS_SOFT 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 39 math, 6 textures, 4 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  lightDir_6 = tmpvar_14;
  mediump vec3 tmpvar_15;
  highp vec3 n_16;
  n_16 = lightDir_6;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(n_16);
  tmpvar_15 = tmpvar_17;
  lightDir_6 = tmpvar_15;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_18;
  highp vec3 norm_19;
  norm_19 = tmpvar_1;
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((norm_19 * tmpvar_20));
  normalWorld_4 = tmpvar_21;
  tmpvar_8.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = tmpvar_15;
  xlv_TEXCOORD5 = normalWorld_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  mediump vec3 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  tmpvar_2 = xlv_TEXCOORD1;
  mediump float tmpvar_5;
  tmpvar_5 = dot (xlv_TEXCOORD3.yzw, xlv_TEXCOORD4);
  mediump vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5));
  tmpvar_6.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_NHxRoughness, tmpvar_6);
  c_1 = (((tmpvar_4 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_7.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic))
  )) * _LightColor0.xyz);
  highp vec3 worldPos_8;
  worldPos_8 = tmpvar_2;
  highp vec3 vec_9;
  vec_9 = (worldPos_8 - _LightPositionRange.xyz);
  highp vec4 shadowVals_10;
  highp float mydist_11;
  mydist_11 = ((sqrt(
    dot (vec_9, vec_9)
  ) * _LightPositionRange.w) * 0.97);
  shadowVals_10.x = dot (textureCube (_ShadowMapTexture, (vec_9 + vec3(0.0078125, 0.0078125, 0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_10.y = dot (textureCube (_ShadowMapTexture, (vec_9 + vec3(-0.0078125, -0.0078125, 0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_10.z = dot (textureCube (_ShadowMapTexture, (vec_9 + vec3(-0.0078125, 0.0078125, -0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_10.w = dot (textureCube (_ShadowMapTexture, (vec_9 + vec3(0.0078125, -0.0078125, -0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  bvec4 tmpvar_12;
  tmpvar_12 = lessThan (shadowVals_10, vec4(mydist_11));
  mediump vec4 tmpvar_13;
  tmpvar_13 = _LightShadowData.xxxx;
  mediump float tmpvar_14;
  if (tmpvar_12.x) {
    tmpvar_14 = tmpvar_13.x;
  } else {
    tmpvar_14 = 1.0;
  };
  mediump float tmpvar_15;
  if (tmpvar_12.y) {
    tmpvar_15 = tmpvar_13.y;
  } else {
    tmpvar_15 = 1.0;
  };
  mediump float tmpvar_16;
  if (tmpvar_12.z) {
    tmpvar_16 = tmpvar_13.z;
  } else {
    tmpvar_16 = 1.0;
  };
  mediump float tmpvar_17;
  if (tmpvar_12.w) {
    tmpvar_17 = tmpvar_13.w;
  } else {
    tmpvar_17 = 1.0;
  };
  mediump vec4 tmpvar_18;
  tmpvar_18.x = tmpvar_14;
  tmpvar_18.y = tmpvar_15;
  tmpvar_18.z = tmpvar_16;
  tmpvar_18.w = tmpvar_17;
  c_1 = (c_1 * (dot (tmpvar_18, vec4(0.25, 0.25, 0.25, 0.25)) * clamp (
    dot (xlv_TEXCOORD5, xlv_TEXCOORD4)
  , 0.0, 1.0)));
  mediump vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = c_1;
  mediump vec4 xlat_varoutput_20;
  xlat_varoutput_20.xyz = tmpvar_19.xyz;
  xlat_varoutput_20.w = 1.0;
  gl_FragData[0] = xlat_varoutput_20;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 75 math, 7 textures, 4 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 n_15;
  n_15 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  tmpvar_14 = n_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  lightDir_4 = tmpvar_20;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform lowp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float shadow_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic));
  tmpvar_5 = (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = i_posWorld_2;
  highp vec3 tmpvar_10;
  tmpvar_10 = (unity_WorldToLight * tmpvar_9).xyz;
  highp vec3 worldPos_11;
  worldPos_11 = i_posWorld_2;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (worldPos_11 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_11), v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  highp vec3 vec_16;
  vec_16 = (worldPos_11 - _LightPositionRange.xyz);
  highp vec4 shadowVals_17;
  highp float mydist_18;
  mydist_18 = ((sqrt(
    dot (vec_16, vec_16)
  ) * _LightPositionRange.w) * 0.97);
  shadowVals_17.x = dot (textureCube (_ShadowMapTexture, (vec_16 + vec3(0.0078125, 0.0078125, 0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_17.y = dot (textureCube (_ShadowMapTexture, (vec_16 + vec3(-0.0078125, -0.0078125, 0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_17.z = dot (textureCube (_ShadowMapTexture, (vec_16 + vec3(-0.0078125, 0.0078125, -0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_17.w = dot (textureCube (_ShadowMapTexture, (vec_16 + vec3(0.0078125, -0.0078125, -0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  bvec4 tmpvar_19;
  tmpvar_19 = lessThan (shadowVals_17, vec4(mydist_18));
  mediump vec4 tmpvar_20;
  tmpvar_20 = _LightShadowData.xxxx;
  mediump float tmpvar_21;
  if (tmpvar_19.x) {
    tmpvar_21 = tmpvar_20.x;
  } else {
    tmpvar_21 = 1.0;
  };
  mediump float tmpvar_22;
  if (tmpvar_19.y) {
    tmpvar_22 = tmpvar_20.y;
  } else {
    tmpvar_22 = 1.0;
  };
  mediump float tmpvar_23;
  if (tmpvar_19.z) {
    tmpvar_23 = tmpvar_20.z;
  } else {
    tmpvar_23 = 1.0;
  };
  mediump float tmpvar_24;
  if (tmpvar_19.w) {
    tmpvar_24 = tmpvar_20.w;
  } else {
    tmpvar_24 = 1.0;
  };
  mediump vec4 tmpvar_25;
  tmpvar_25.x = tmpvar_21;
  tmpvar_25.y = tmpvar_22;
  tmpvar_25.z = tmpvar_23;
  tmpvar_25.w = tmpvar_24;
  mediump float tmpvar_26;
  tmpvar_26 = clamp ((dot (tmpvar_25, vec4(0.25, 0.25, 0.25, 0.25)) + tmpvar_14), 0.0, 1.0);
  shadow_1 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (tmpvar_10, tmpvar_10);
  lowp float tmpvar_28;
  tmpvar_28 = ((texture2D (_LightTextureB0, vec2(tmpvar_27)).w * textureCube (_LightTexture0, tmpvar_10).w) * shadow_1);
  mediump vec3 tmpvar_29;
  tmpvar_29.x = xlv_TEXCOORD2.w;
  tmpvar_29.y = xlv_TEXCOORD2_1.w;
  tmpvar_29.z = xlv_TEXCOORD2_2.w;
  mediump float atten_30;
  atten_30 = tmpvar_28;
  mediump vec3 tmpvar_31;
  tmpvar_31 = _LightColor0.xyz;
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize(tmpvar_29);
  tmpvar_31 = (tmpvar_31 * atten_30);
  mediump float specularTerm_33;
  mediump vec3 tmpvar_34;
  mediump vec3 inVec_35;
  inVec_35 = (tmpvar_32 - tmpvar_8);
  tmpvar_34 = (inVec_35 * inversesqrt(max (0.001, 
    dot (inVec_35, inVec_35)
  )));
  mediump float tmpvar_36;
  tmpvar_36 = clamp (dot (tmpvar_7, tmpvar_34), 0.0, 1.0);
  mediump float tmpvar_37;
  tmpvar_37 = (1.0 - _Glossiness);
  mediump float tmpvar_38;
  tmpvar_38 = (tmpvar_37 * tmpvar_37);
  specularTerm_33 = ((tmpvar_38 / (
    (max (0.32, clamp (dot (tmpvar_32, tmpvar_34), 0.0, 1.0)) * (1.5 + tmpvar_38))
   * 
    (((tmpvar_36 * tmpvar_36) * ((tmpvar_38 * tmpvar_38) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_39;
  tmpvar_39 = clamp (specularTerm_33, 0.0, 100.0);
  specularTerm_33 = tmpvar_39;
  mediump vec4 tmpvar_40;
  tmpvar_40.w = 1.0;
  tmpvar_40.xyz = (((tmpvar_5 + 
    (tmpvar_39 * tmpvar_6)
  ) * tmpvar_31) * clamp (dot (tmpvar_7, tmpvar_32), 0.0, 1.0));
  mediump vec4 xlat_varoutput_41;
  xlat_varoutput_41.xyz = tmpvar_40.xyz;
  xlat_varoutput_41.w = 1.0;
  gl_FragData[0] = xlat_varoutput_41;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 75 math, 7 textures, 4 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 n_15;
  n_15 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  tmpvar_14 = n_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  lightDir_4 = tmpvar_20;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform lowp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float shadow_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic));
  tmpvar_5 = (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = i_posWorld_2;
  highp vec3 tmpvar_10;
  tmpvar_10 = (unity_WorldToLight * tmpvar_9).xyz;
  highp vec3 worldPos_11;
  worldPos_11 = i_posWorld_2;
  highp vec4 v_12;
  v_12.x = unity_MatrixV[0].z;
  v_12.y = unity_MatrixV[1].z;
  v_12.z = unity_MatrixV[2].z;
  v_12.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (worldPos_11 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_11), v_12.xyz), sqrt(dot (tmpvar_13, tmpvar_13)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_14 = tmpvar_15;
  highp vec3 vec_16;
  vec_16 = (worldPos_11 - _LightPositionRange.xyz);
  highp vec4 shadowVals_17;
  highp float mydist_18;
  mydist_18 = ((sqrt(
    dot (vec_16, vec_16)
  ) * _LightPositionRange.w) * 0.97);
  shadowVals_17.x = dot (textureCube (_ShadowMapTexture, (vec_16 + vec3(0.0078125, 0.0078125, 0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_17.y = dot (textureCube (_ShadowMapTexture, (vec_16 + vec3(-0.0078125, -0.0078125, 0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_17.z = dot (textureCube (_ShadowMapTexture, (vec_16 + vec3(-0.0078125, 0.0078125, -0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_17.w = dot (textureCube (_ShadowMapTexture, (vec_16 + vec3(0.0078125, -0.0078125, -0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  bvec4 tmpvar_19;
  tmpvar_19 = lessThan (shadowVals_17, vec4(mydist_18));
  mediump vec4 tmpvar_20;
  tmpvar_20 = _LightShadowData.xxxx;
  mediump float tmpvar_21;
  if (tmpvar_19.x) {
    tmpvar_21 = tmpvar_20.x;
  } else {
    tmpvar_21 = 1.0;
  };
  mediump float tmpvar_22;
  if (tmpvar_19.y) {
    tmpvar_22 = tmpvar_20.y;
  } else {
    tmpvar_22 = 1.0;
  };
  mediump float tmpvar_23;
  if (tmpvar_19.z) {
    tmpvar_23 = tmpvar_20.z;
  } else {
    tmpvar_23 = 1.0;
  };
  mediump float tmpvar_24;
  if (tmpvar_19.w) {
    tmpvar_24 = tmpvar_20.w;
  } else {
    tmpvar_24 = 1.0;
  };
  mediump vec4 tmpvar_25;
  tmpvar_25.x = tmpvar_21;
  tmpvar_25.y = tmpvar_22;
  tmpvar_25.z = tmpvar_23;
  tmpvar_25.w = tmpvar_24;
  mediump float tmpvar_26;
  tmpvar_26 = clamp ((dot (tmpvar_25, vec4(0.25, 0.25, 0.25, 0.25)) + tmpvar_14), 0.0, 1.0);
  shadow_1 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (tmpvar_10, tmpvar_10);
  lowp float tmpvar_28;
  tmpvar_28 = ((texture2D (_LightTextureB0, vec2(tmpvar_27)).w * textureCube (_LightTexture0, tmpvar_10).w) * shadow_1);
  mediump vec3 tmpvar_29;
  tmpvar_29.x = xlv_TEXCOORD2.w;
  tmpvar_29.y = xlv_TEXCOORD2_1.w;
  tmpvar_29.z = xlv_TEXCOORD2_2.w;
  mediump float atten_30;
  atten_30 = tmpvar_28;
  mediump vec3 tmpvar_31;
  tmpvar_31 = _LightColor0.xyz;
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize(tmpvar_29);
  tmpvar_31 = (tmpvar_31 * atten_30);
  mediump float specularTerm_33;
  mediump vec3 tmpvar_34;
  mediump vec3 inVec_35;
  inVec_35 = (tmpvar_32 - tmpvar_8);
  tmpvar_34 = (inVec_35 * inversesqrt(max (0.001, 
    dot (inVec_35, inVec_35)
  )));
  mediump float tmpvar_36;
  tmpvar_36 = clamp (dot (tmpvar_7, tmpvar_34), 0.0, 1.0);
  mediump float tmpvar_37;
  tmpvar_37 = (1.0 - _Glossiness);
  mediump float tmpvar_38;
  tmpvar_38 = (tmpvar_37 * tmpvar_37);
  specularTerm_33 = ((tmpvar_38 / (
    (max (0.32, clamp (dot (tmpvar_32, tmpvar_34), 0.0, 1.0)) * (1.5 + tmpvar_38))
   * 
    (((tmpvar_36 * tmpvar_36) * ((tmpvar_38 * tmpvar_38) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_39;
  tmpvar_39 = clamp (specularTerm_33, 0.0, 100.0);
  specularTerm_33 = tmpvar_39;
  mediump vec4 tmpvar_40;
  tmpvar_40.w = 1.0;
  tmpvar_40.xyz = (((tmpvar_5 + 
    (tmpvar_39 * tmpvar_6)
  ) * tmpvar_31) * clamp (dot (tmpvar_7, tmpvar_32), 0.0, 1.0));
  mediump vec4 xlat_varoutput_41;
  xlat_varoutput_41.xyz = tmpvar_40.xyz;
  xlat_varoutput_41.w = 1.0;
  gl_FragData[0] = xlat_varoutput_41;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

 }


 // Stats for Vertex shader:
 //         gles: 5 avg math (1..9)
 Pass {
  Name "SHADOWCASTER"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords set in this variant: SHADOWS_DEPTH 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 1 math
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 wPos_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
  wPos_2 = tmpvar_3;
  if ((unity_LightShadowBias.z != 0.0)) {
    highp mat3 tmpvar_4;
    tmpvar_4[0] = unity_WorldToObject[0].xyz;
    tmpvar_4[1] = unity_WorldToObject[1].xyz;
    tmpvar_4[2] = unity_WorldToObject[2].xyz;
    highp vec3 tmpvar_5;
    tmpvar_5 = normalize((_glesNormal * tmpvar_4));
    highp float tmpvar_6;
    tmpvar_6 = dot (tmpvar_5, normalize((_WorldSpaceLightPos0.xyz - 
      (tmpvar_3.xyz * _WorldSpaceLightPos0.w)
    )));
    wPos_2.xyz = (tmpvar_3.xyz - (tmpvar_5 * (unity_LightShadowBias.z * 
      sqrt((1.0 - (tmpvar_6 * tmpvar_6)))
    )));
  };
  tmpvar_1 = (unity_MatrixVP * wPos_2);
  highp vec4 clipPos_7;
  clipPos_7.xyw = tmpvar_1.xyw;
  clipPos_7.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
  clipPos_7.z = mix (clipPos_7.z, max (clipPos_7.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_7;
}


#endif
#ifdef FRAGMENT
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 1 math
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 wPos_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
  wPos_2 = tmpvar_3;
  if ((unity_LightShadowBias.z != 0.0)) {
    highp mat3 tmpvar_4;
    tmpvar_4[0] = unity_WorldToObject[0].xyz;
    tmpvar_4[1] = unity_WorldToObject[1].xyz;
    tmpvar_4[2] = unity_WorldToObject[2].xyz;
    highp vec3 tmpvar_5;
    tmpvar_5 = normalize((_glesNormal * tmpvar_4));
    highp float tmpvar_6;
    tmpvar_6 = dot (tmpvar_5, normalize((_WorldSpaceLightPos0.xyz - 
      (tmpvar_3.xyz * _WorldSpaceLightPos0.w)
    )));
    wPos_2.xyz = (tmpvar_3.xyz - (tmpvar_5 * (unity_LightShadowBias.z * 
      sqrt((1.0 - (tmpvar_6 * tmpvar_6)))
    )));
  };
  tmpvar_1 = (unity_MatrixVP * wPos_2);
  highp vec4 clipPos_7;
  clipPos_7.xyw = tmpvar_1.xyw;
  clipPos_7.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
  clipPos_7.z = mix (clipPos_7.z, max (clipPos_7.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_7;
}


#endif
#ifdef FRAGMENT
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 1 math
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 wPos_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
  wPos_2 = tmpvar_3;
  if ((unity_LightShadowBias.z != 0.0)) {
    highp mat3 tmpvar_4;
    tmpvar_4[0] = unity_WorldToObject[0].xyz;
    tmpvar_4[1] = unity_WorldToObject[1].xyz;
    tmpvar_4[2] = unity_WorldToObject[2].xyz;
    highp vec3 tmpvar_5;
    tmpvar_5 = normalize((_glesNormal * tmpvar_4));
    highp float tmpvar_6;
    tmpvar_6 = dot (tmpvar_5, normalize((_WorldSpaceLightPos0.xyz - 
      (tmpvar_3.xyz * _WorldSpaceLightPos0.w)
    )));
    wPos_2.xyz = (tmpvar_3.xyz - (tmpvar_5 * (unity_LightShadowBias.z * 
      sqrt((1.0 - (tmpvar_6 * tmpvar_6)))
    )));
  };
  tmpvar_1 = (unity_MatrixVP * wPos_2);
  highp vec4 clipPos_7;
  clipPos_7.xyw = tmpvar_1.xyw;
  clipPos_7.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
  clipPos_7.z = mix (clipPos_7.z, max (clipPos_7.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_7;
}


#endif
#ifdef FRAGMENT
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: SHADOWS_CUBE 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 9 math
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 tmpvar_1;
  highp vec4 enc_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  enc_2 = (tmpvar_3 - (tmpvar_3.yzww * 0.003921569));
  tmpvar_1 = enc_2;
  gl_FragData[0] = tmpvar_1;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 9 math
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 tmpvar_1;
  highp vec4 enc_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  enc_2 = (tmpvar_3 - (tmpvar_3.yzww * 0.003921569));
  tmpvar_1 = enc_2;
  gl_FragData[0] = tmpvar_1;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 9 math
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 tmpvar_1;
  highp vec4 enc_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  enc_2 = (tmpvar_3 - (tmpvar_3.yzww * 0.003921569));
  tmpvar_1 = enc_2;
  gl_FragData[0] = tmpvar_1;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

 }
}
SubShader { 
 LOD 150
 Tags { "RenderType"="Opaque" "PerformanceChecks"="False" }


 // Stats for Vertex shader:
 //         gles: 64 avg math (35..104), 4 avg texture (4..6)
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="FORWARDBASE" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite [_ZWrite]
  Blend [_SrcBlend] [_DstBlend]
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 35 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  normalWorld_4 = tmpvar_17;
  tmpvar_8.xyz = normalWorld_4;
  tmpvar_6.xyz = eyeVec_5;
  mediump vec4 ambientOrLightmapUV_18;
  ambientOrLightmapUV_18.w = 0.0;
  mediump vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = normalWorld_4;
  mediump vec3 res_20;
  mediump vec3 x_21;
  x_21.x = dot (unity_SHAr, tmpvar_19);
  x_21.y = dot (unity_SHAg, tmpvar_19);
  x_21.z = dot (unity_SHAb, tmpvar_19);
  mediump vec3 x1_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normalWorld_4.xyzz * normalWorld_4.yzzx);
  x1_22.x = dot (unity_SHBr, tmpvar_23);
  x1_22.y = dot (unity_SHBg, tmpvar_23);
  x1_22.z = dot (unity_SHBb, tmpvar_23);
  res_20 = (x_21 + (x1_22 + (unity_SHC.xyz * 
    ((normalWorld_4.x * normalWorld_4.x) - (normalWorld_4.y * normalWorld_4.y))
  )));
  mediump vec3 tmpvar_24;
  tmpvar_24 = max (((1.055 * 
    pow (max (res_20, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_20 = tmpvar_24;
  ambientOrLightmapUV_18.xyz = max (vec3(0.0, 0.0, 0.0), tmpvar_24);
  tmpvar_7.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  mediump float x_25;
  x_25 = (1.0 - clamp (dot (normalWorld_4, 
    -(eyeVec_5)
  ), 0.0, 1.0));
  tmpvar_8.w = ((x_25 * x_25) * (x_25 * x_25));
  tmpvar_6.w = clamp ((_Glossiness + (1.0 - 
    (0.7790837 - (_Metallic * 0.7790837))
  )), 0.0, 1.0);
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = ambientOrLightmapUV_18;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump float rl_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic));
  tmpvar_4 = (tmpvar_3 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_6;
  tmpvar_6 = _LightColor0.xyz;
  mediump float tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy);
  tmpvar_7 = tmpvar_8.y;
  rl_1 = dot (xlv_TEXCOORD4.yzw, _WorldSpaceLightPos0.xyz);
  highp vec4 tmpvar_9;
  tmpvar_9 = unity_SpecCube0_HDR;
  mediump float tmpvar_10;
  tmpvar_10 = (1.0 - _Glossiness);
  mediump vec4 hdr_11;
  hdr_11 = tmpvar_9;
  mediump vec4 tmpvar_12;
  tmpvar_12.xyz = xlv_TEXCOORD4.yzw;
  tmpvar_12.w = ((tmpvar_10 * (1.7 - 
    (0.7 * tmpvar_10)
  )) * 6.0);
  lowp vec4 tmpvar_13;
  tmpvar_13 = impl_low_textureCubeLodEXT (unity_SpecCube0, xlv_TEXCOORD4.yzw, tmpvar_12.w);
  mediump vec4 tmpvar_14;
  tmpvar_14 = tmpvar_13;
  mediump vec2 tmpvar_15;
  tmpvar_15.x = ((rl_1 * rl_1) * (rl_1 * rl_1));
  tmpvar_15.y = tmpvar_10;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (unity_NHxRoughness, tmpvar_15);
  mediump vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = (((
    (xlv_TEXCOORD2.xyz * tmpvar_7)
   * tmpvar_4) + (
    (((hdr_11.x * (
      (hdr_11.w * (tmpvar_14.w - 1.0))
     + 1.0)) * tmpvar_14.xyz) * tmpvar_7)
   * 
    mix (tmpvar_5, xlv_TEXCOORD1.www, xlv_TEXCOORD5.www)
  )) + ((tmpvar_4 + 
    ((tmpvar_16.w * 16.0) * tmpvar_5)
  ) * (tmpvar_6 * 
    clamp (dot (xlv_TEXCOORD5.xyz, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  )));
  mediump vec4 xlat_varoutput_18;
  xlat_varoutput_18.xyz = tmpvar_17.xyz;
  xlat_varoutput_18.w = 1.0;
  gl_FragData[0] = xlat_varoutput_18;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 51 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_8.xyz - _WorldSpaceCameraPos));
  tmpvar_13 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  mediump vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = normalWorld_18;
  mediump vec3 res_21;
  mediump vec3 x_22;
  x_22.x = dot (unity_SHAr, tmpvar_20);
  x_22.y = dot (unity_SHAg, tmpvar_20);
  x_22.z = dot (unity_SHAb, tmpvar_20);
  mediump vec3 x1_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_23.x = dot (unity_SHBr, tmpvar_24);
  x1_23.y = dot (unity_SHBg, tmpvar_24);
  x1_23.z = dot (unity_SHBb, tmpvar_24);
  res_21 = (x_22 + (x1_23 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )));
  mediump vec3 tmpvar_25;
  tmpvar_25 = max (((1.055 * 
    pow (max (res_21, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_21 = tmpvar_25;
  ambientOrLightmapUV_19.xyz = max (vec3(0.0, 0.0, 0.0), tmpvar_25);
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic));
  mediump float tmpvar_6;
  tmpvar_6 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_4 = (tmpvar_3 * tmpvar_6);
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = _LightColor0.xyz;
  mediump float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy);
  tmpvar_9 = tmpvar_10.y;
  highp vec4 tmpvar_11;
  tmpvar_11 = unity_SpecCube0_HDR;
  mediump vec3 tmpvar_12;
  mediump float tmpvar_13;
  tmpvar_13 = (1.0 - _Glossiness);
  tmpvar_12 = (xlv_TEXCOORD1 - (2.0 * (
    dot (tmpvar_7, xlv_TEXCOORD1)
   * tmpvar_7)));
  mediump vec4 hdr_14;
  hdr_14 = tmpvar_11;
  mediump vec4 tmpvar_15;
  tmpvar_15.xyz = tmpvar_12;
  tmpvar_15.w = ((tmpvar_13 * (1.7 - 
    (0.7 * tmpvar_13)
  )) * 6.0);
  lowp vec4 tmpvar_16;
  tmpvar_16 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_12, tmpvar_15.w);
  mediump vec4 tmpvar_17;
  tmpvar_17 = tmpvar_16;
  mediump vec3 viewDir_18;
  viewDir_18 = -(xlv_TEXCOORD1);
  mediump vec3 color_19;
  mediump vec2 tmpvar_20;
  tmpvar_20.x = dot ((viewDir_18 - (2.0 * 
    (dot (tmpvar_7, viewDir_18) * tmpvar_7)
  )), _WorldSpaceLightPos0.xyz);
  tmpvar_20.y = (1.0 - clamp (dot (tmpvar_7, viewDir_18), 0.0, 1.0));
  mediump vec2 tmpvar_21;
  tmpvar_21 = ((tmpvar_20 * tmpvar_20) * (tmpvar_20 * tmpvar_20));
  mediump vec2 tmpvar_22;
  tmpvar_22.x = tmpvar_21.x;
  tmpvar_22.y = tmpvar_13;
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_NHxRoughness, tmpvar_22);
  color_19 = ((tmpvar_4 + (
    (tmpvar_23.w * 16.0)
   * tmpvar_5)) * (tmpvar_8 * clamp (
    dot (tmpvar_7, _WorldSpaceLightPos0.xyz)
  , 0.0, 1.0)));
  color_19 = (color_19 + ((
    (xlv_TEXCOORD5.xyz * tmpvar_9)
   * tmpvar_4) + (
    (((hdr_14.x * (
      (hdr_14.w * (tmpvar_17.w - 1.0))
     + 1.0)) * tmpvar_17.xyz) * tmpvar_9)
   * 
    mix (tmpvar_5, vec3(clamp ((_Glossiness + (1.0 - tmpvar_6)), 0.0, 1.0)), tmpvar_21.yyy)
  )));
  mediump vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = color_19;
  c_1.w = tmpvar_24.w;
  c_1.xyz = color_19;
  mediump vec4 xlat_varoutput_25;
  xlat_varoutput_25.xyz = c_1.xyz;
  xlat_varoutput_25.w = 1.0;
  gl_FragData[0] = xlat_varoutput_25;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 51 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_8.xyz - _WorldSpaceCameraPos));
  tmpvar_13 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  mediump vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = normalWorld_18;
  mediump vec3 res_21;
  mediump vec3 x_22;
  x_22.x = dot (unity_SHAr, tmpvar_20);
  x_22.y = dot (unity_SHAg, tmpvar_20);
  x_22.z = dot (unity_SHAb, tmpvar_20);
  mediump vec3 x1_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_23.x = dot (unity_SHBr, tmpvar_24);
  x1_23.y = dot (unity_SHBg, tmpvar_24);
  x1_23.z = dot (unity_SHBb, tmpvar_24);
  res_21 = (x_22 + (x1_23 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )));
  mediump vec3 tmpvar_25;
  tmpvar_25 = max (((1.055 * 
    pow (max (res_21, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_21 = tmpvar_25;
  ambientOrLightmapUV_19.xyz = max (vec3(0.0, 0.0, 0.0), tmpvar_25);
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic));
  mediump float tmpvar_6;
  tmpvar_6 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_4 = (tmpvar_3 * tmpvar_6);
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = _LightColor0.xyz;
  mediump float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy);
  tmpvar_9 = tmpvar_10.y;
  highp vec4 tmpvar_11;
  tmpvar_11 = unity_SpecCube0_HDR;
  mediump vec3 tmpvar_12;
  mediump float tmpvar_13;
  tmpvar_13 = (1.0 - _Glossiness);
  tmpvar_12 = (xlv_TEXCOORD1 - (2.0 * (
    dot (tmpvar_7, xlv_TEXCOORD1)
   * tmpvar_7)));
  mediump vec4 hdr_14;
  hdr_14 = tmpvar_11;
  mediump vec4 tmpvar_15;
  tmpvar_15.xyz = tmpvar_12;
  tmpvar_15.w = ((tmpvar_13 * (1.7 - 
    (0.7 * tmpvar_13)
  )) * 6.0);
  lowp vec4 tmpvar_16;
  tmpvar_16 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_12, tmpvar_15.w);
  mediump vec4 tmpvar_17;
  tmpvar_17 = tmpvar_16;
  mediump vec3 viewDir_18;
  viewDir_18 = -(xlv_TEXCOORD1);
  mediump vec3 color_19;
  mediump vec2 tmpvar_20;
  tmpvar_20.x = dot ((viewDir_18 - (2.0 * 
    (dot (tmpvar_7, viewDir_18) * tmpvar_7)
  )), _WorldSpaceLightPos0.xyz);
  tmpvar_20.y = (1.0 - clamp (dot (tmpvar_7, viewDir_18), 0.0, 1.0));
  mediump vec2 tmpvar_21;
  tmpvar_21 = ((tmpvar_20 * tmpvar_20) * (tmpvar_20 * tmpvar_20));
  mediump vec2 tmpvar_22;
  tmpvar_22.x = tmpvar_21.x;
  tmpvar_22.y = tmpvar_13;
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_NHxRoughness, tmpvar_22);
  color_19 = ((tmpvar_4 + (
    (tmpvar_23.w * 16.0)
   * tmpvar_5)) * (tmpvar_8 * clamp (
    dot (tmpvar_7, _WorldSpaceLightPos0.xyz)
  , 0.0, 1.0)));
  color_19 = (color_19 + ((
    (xlv_TEXCOORD5.xyz * tmpvar_9)
   * tmpvar_4) + (
    (((hdr_14.x * (
      (hdr_14.w * (tmpvar_17.w - 1.0))
     + 1.0)) * tmpvar_17.xyz) * tmpvar_9)
   * 
    mix (tmpvar_5, vec3(clamp ((_Glossiness + (1.0 - tmpvar_6)), 0.0, 1.0)), tmpvar_21.yyy)
  )));
  mediump vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = color_19;
  c_1.w = tmpvar_24.w;
  c_1.xyz = color_19;
  mediump vec4 xlat_varoutput_25;
  xlat_varoutput_25.xyz = c_1.xyz;
  xlat_varoutput_25.w = 1.0;
  gl_FragData[0] = xlat_varoutput_25;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 42 math, 5 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  normalWorld_4 = tmpvar_17;
  tmpvar_8.xyz = normalWorld_4;
  tmpvar_6.xyz = eyeVec_5;
  mediump vec4 ambientOrLightmapUV_18;
  ambientOrLightmapUV_18.w = 0.0;
  mediump vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = normalWorld_4;
  mediump vec3 res_20;
  mediump vec3 x_21;
  x_21.x = dot (unity_SHAr, tmpvar_19);
  x_21.y = dot (unity_SHAg, tmpvar_19);
  x_21.z = dot (unity_SHAb, tmpvar_19);
  mediump vec3 x1_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normalWorld_4.xyzz * normalWorld_4.yzzx);
  x1_22.x = dot (unity_SHBr, tmpvar_23);
  x1_22.y = dot (unity_SHBg, tmpvar_23);
  x1_22.z = dot (unity_SHBb, tmpvar_23);
  res_20 = (x_21 + (x1_22 + (unity_SHC.xyz * 
    ((normalWorld_4.x * normalWorld_4.x) - (normalWorld_4.y * normalWorld_4.y))
  )));
  mediump vec3 tmpvar_24;
  tmpvar_24 = max (((1.055 * 
    pow (max (res_20, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_20 = tmpvar_24;
  ambientOrLightmapUV_18.xyz = max (vec3(0.0, 0.0, 0.0), tmpvar_24);
  tmpvar_7.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  mediump float x_25;
  x_25 = (1.0 - clamp (dot (normalWorld_4, 
    -(eyeVec_5)
  ), 0.0, 1.0));
  tmpvar_8.w = ((x_25 * x_25) * (x_25 * x_25));
  tmpvar_6.w = clamp ((_Glossiness + (1.0 - 
    (0.7790837 - (_Metallic * 0.7790837))
  )), 0.0, 1.0);
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = ambientOrLightmapUV_18;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 _LightShadowData;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump float rl_1;
  mediump float realtimeShadowAttenuation_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic));
  tmpvar_5 = (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_7;
  tmpvar_7 = _LightColor0.xyz;
  lowp float tmpvar_8;
  highp float lightShadowDataX_9;
  mediump float tmpvar_10;
  tmpvar_10 = _LightShadowData.x;
  lightShadowDataX_9 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_9);
  tmpvar_8 = tmpvar_11;
  realtimeShadowAttenuation_2 = tmpvar_8;
  mediump float occ_12;
  lowp float tmpvar_13;
  tmpvar_13 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_12 = tmpvar_13;
  rl_1 = dot (xlv_TEXCOORD4.yzw, _WorldSpaceLightPos0.xyz);
  mediump float occlusion_14;
  occlusion_14 = ((1.0 - _OcclusionStrength) + (occ_12 * _OcclusionStrength));
  highp vec4 tmpvar_15;
  tmpvar_15 = unity_SpecCube0_HDR;
  mediump float tmpvar_16;
  tmpvar_16 = (1.0 - _Glossiness);
  mediump vec4 hdr_17;
  hdr_17 = tmpvar_15;
  mediump vec4 tmpvar_18;
  tmpvar_18.xyz = xlv_TEXCOORD4.yzw;
  tmpvar_18.w = ((tmpvar_16 * (1.7 - 
    (0.7 * tmpvar_16)
  )) * 6.0);
  lowp vec4 tmpvar_19;
  tmpvar_19 = impl_low_textureCubeLodEXT (unity_SpecCube0, xlv_TEXCOORD4.yzw, tmpvar_18.w);
  mediump vec4 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  mediump vec2 tmpvar_21;
  tmpvar_21.x = ((rl_1 * rl_1) * (rl_1 * rl_1));
  tmpvar_21.y = tmpvar_16;
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (unity_NHxRoughness, tmpvar_21);
  mediump vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = (((
    (xlv_TEXCOORD2.xyz * occlusion_14)
   * tmpvar_5) + (
    (((hdr_17.x * (
      (hdr_17.w * (tmpvar_20.w - 1.0))
     + 1.0)) * tmpvar_20.xyz) * occlusion_14)
   * 
    mix (tmpvar_6, xlv_TEXCOORD1.www, xlv_TEXCOORD5.www)
  )) + ((tmpvar_5 + 
    ((tmpvar_22.w * 16.0) * tmpvar_6)
  ) * (
    (tmpvar_7 * realtimeShadowAttenuation_2)
   * 
    clamp (dot (xlv_TEXCOORD5.xyz, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  )));
  mediump vec4 xlat_varoutput_24;
  xlat_varoutput_24.xyz = tmpvar_23.xyz;
  xlat_varoutput_24.w = 1.0;
  gl_FragData[0] = xlat_varoutput_24;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 102 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  mediump vec3 x1_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_20.x = dot (unity_SHBr, tmpvar_21);
  x1_20.y = dot (unity_SHBg, tmpvar_21);
  x1_20.z = dot (unity_SHBb, tmpvar_21);
  ambientOrLightmapUV_19.xyz = (x1_20 + (unity_SHC.xyz * (
    (normalWorld_18.x * normalWorld_18.x)
   - 
    (normalWorld_18.y * normalWorld_18.y)
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp float atten_2;
  mediump vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  mediump float tmpvar_8;
  tmpvar_8 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_6 = (tmpvar_5 * tmpvar_8);
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_10;
  tmpvar_10 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  highp vec3 worldPos_12;
  worldPos_12 = tmpvar_3;
  mediump float realtimeShadowAttenuation_13;
  highp vec4 v_14;
  v_14.x = unity_MatrixV[0].z;
  v_14.y = unity_MatrixV[1].z;
  v_14.z = unity_MatrixV[2].z;
  v_14.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (worldPos_12 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_12), v_14.xyz), sqrt(dot (tmpvar_15, tmpvar_15)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_16 = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = worldPos_12;
  lowp float tmpvar_19;
  highp vec4 shadowCoord_20;
  shadowCoord_20 = (unity_WorldToShadow[0] * tmpvar_18);
  highp float lightShadowDataX_21;
  mediump float tmpvar_22;
  tmpvar_22 = _LightShadowData.x;
  lightShadowDataX_21 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = max (float((texture2D (_ShadowMapTexture, shadowCoord_20.xy).x > shadowCoord_20.z)), lightShadowDataX_21);
  tmpvar_19 = tmpvar_23;
  realtimeShadowAttenuation_13 = tmpvar_19;
  mediump float tmpvar_24;
  tmpvar_24 = clamp ((realtimeShadowAttenuation_13 + tmpvar_16), 0.0, 1.0);
  atten_2 = tmpvar_24;
  mediump float occ_25;
  lowp float tmpvar_26;
  tmpvar_26 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_25 = tmpvar_26;
  mediump float atten_27;
  atten_27 = atten_2;
  mediump float occlusion_28;
  occlusion_28 = ((1.0 - _OcclusionStrength) + (occ_25 * _OcclusionStrength));
  highp vec4 tmpvar_29;
  tmpvar_29 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = tmpvar_9;
  mediump vec3 x_31;
  x_31.x = dot (unity_SHAr, tmpvar_30);
  x_31.y = dot (unity_SHAg, tmpvar_30);
  x_31.z = dot (unity_SHAb, tmpvar_30);
  mediump vec3 tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = (1.0 - _Glossiness);
  tmpvar_32 = (tmpvar_10 - (2.0 * (
    dot (tmpvar_9, tmpvar_10)
   * tmpvar_9)));
  mediump vec4 hdr_34;
  hdr_34 = tmpvar_29;
  mediump vec4 tmpvar_35;
  tmpvar_35.xyz = tmpvar_32;
  tmpvar_35.w = ((tmpvar_33 * (1.7 - 
    (0.7 * tmpvar_33)
  )) * 6.0);
  lowp vec4 tmpvar_36;
  tmpvar_36 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_32, tmpvar_35.w);
  mediump vec4 tmpvar_37;
  tmpvar_37 = tmpvar_36;
  mediump vec3 viewDir_38;
  viewDir_38 = -(tmpvar_10);
  mediump float specularTerm_39;
  mediump vec3 tmpvar_40;
  mediump vec3 inVec_41;
  inVec_41 = (_WorldSpaceLightPos0.xyz + viewDir_38);
  tmpvar_40 = (inVec_41 * inversesqrt(max (0.001, 
    dot (inVec_41, inVec_41)
  )));
  mediump float tmpvar_42;
  tmpvar_42 = clamp (dot (tmpvar_9, tmpvar_40), 0.0, 1.0);
  mediump float tmpvar_43;
  tmpvar_43 = (tmpvar_33 * tmpvar_33);
  specularTerm_39 = ((tmpvar_43 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_40), 0.0, 1.0)) * (1.5 + tmpvar_43))
   * 
    (((tmpvar_42 * tmpvar_42) * ((tmpvar_43 * tmpvar_43) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_44;
  tmpvar_44 = clamp (specularTerm_39, 0.0, 100.0);
  specularTerm_39 = tmpvar_44;
  mediump float x_45;
  x_45 = (1.0 - clamp (dot (tmpvar_9, viewDir_38), 0.0, 1.0));
  mediump vec3 tmpvar_46;
  tmpvar_46 = (((
    ((tmpvar_6 + (tmpvar_44 * tmpvar_7)) * (tmpvar_11 * atten_27))
   * 
    clamp (dot (tmpvar_9, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_31)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_28)
   * tmpvar_6)) + ((
    (1.0 - ((tmpvar_43 * tmpvar_33) * 0.28))
   * 
    (((hdr_34.x * (
      (hdr_34.w * (tmpvar_37.w - 1.0))
     + 1.0)) * tmpvar_37.xyz) * occlusion_28)
  ) * mix (tmpvar_7, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_8)), 0.0, 1.0)
  ), vec3(
    ((x_45 * x_45) * (x_45 * x_45))
  ))));
  mediump vec4 tmpvar_47;
  tmpvar_47.w = 1.0;
  tmpvar_47.xyz = tmpvar_46;
  c_1.w = tmpvar_47.w;
  c_1.xyz = tmpvar_46;
  mediump vec4 xlat_varoutput_48;
  xlat_varoutput_48.xyz = c_1.xyz;
  xlat_varoutput_48.w = 1.0;
  gl_FragData[0] = xlat_varoutput_48;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 102 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  mediump vec3 x1_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_20.x = dot (unity_SHBr, tmpvar_21);
  x1_20.y = dot (unity_SHBg, tmpvar_21);
  x1_20.z = dot (unity_SHBb, tmpvar_21);
  ambientOrLightmapUV_19.xyz = (x1_20 + (unity_SHC.xyz * (
    (normalWorld_18.x * normalWorld_18.x)
   - 
    (normalWorld_18.y * normalWorld_18.y)
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp float atten_2;
  mediump vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  mediump float tmpvar_8;
  tmpvar_8 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_6 = (tmpvar_5 * tmpvar_8);
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_10;
  tmpvar_10 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  highp vec3 worldPos_12;
  worldPos_12 = tmpvar_3;
  mediump float realtimeShadowAttenuation_13;
  highp vec4 v_14;
  v_14.x = unity_MatrixV[0].z;
  v_14.y = unity_MatrixV[1].z;
  v_14.z = unity_MatrixV[2].z;
  v_14.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (worldPos_12 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_12), v_14.xyz), sqrt(dot (tmpvar_15, tmpvar_15)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_16 = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = worldPos_12;
  lowp float tmpvar_19;
  highp vec4 shadowCoord_20;
  shadowCoord_20 = (unity_WorldToShadow[0] * tmpvar_18);
  highp float lightShadowDataX_21;
  mediump float tmpvar_22;
  tmpvar_22 = _LightShadowData.x;
  lightShadowDataX_21 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = max (float((texture2D (_ShadowMapTexture, shadowCoord_20.xy).x > shadowCoord_20.z)), lightShadowDataX_21);
  tmpvar_19 = tmpvar_23;
  realtimeShadowAttenuation_13 = tmpvar_19;
  mediump float tmpvar_24;
  tmpvar_24 = clamp ((realtimeShadowAttenuation_13 + tmpvar_16), 0.0, 1.0);
  atten_2 = tmpvar_24;
  mediump float occ_25;
  lowp float tmpvar_26;
  tmpvar_26 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_25 = tmpvar_26;
  mediump float atten_27;
  atten_27 = atten_2;
  mediump float occlusion_28;
  occlusion_28 = ((1.0 - _OcclusionStrength) + (occ_25 * _OcclusionStrength));
  highp vec4 tmpvar_29;
  tmpvar_29 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = tmpvar_9;
  mediump vec3 x_31;
  x_31.x = dot (unity_SHAr, tmpvar_30);
  x_31.y = dot (unity_SHAg, tmpvar_30);
  x_31.z = dot (unity_SHAb, tmpvar_30);
  mediump vec3 tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = (1.0 - _Glossiness);
  tmpvar_32 = (tmpvar_10 - (2.0 * (
    dot (tmpvar_9, tmpvar_10)
   * tmpvar_9)));
  mediump vec4 hdr_34;
  hdr_34 = tmpvar_29;
  mediump vec4 tmpvar_35;
  tmpvar_35.xyz = tmpvar_32;
  tmpvar_35.w = ((tmpvar_33 * (1.7 - 
    (0.7 * tmpvar_33)
  )) * 6.0);
  lowp vec4 tmpvar_36;
  tmpvar_36 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_32, tmpvar_35.w);
  mediump vec4 tmpvar_37;
  tmpvar_37 = tmpvar_36;
  mediump vec3 viewDir_38;
  viewDir_38 = -(tmpvar_10);
  mediump float specularTerm_39;
  mediump vec3 tmpvar_40;
  mediump vec3 inVec_41;
  inVec_41 = (_WorldSpaceLightPos0.xyz + viewDir_38);
  tmpvar_40 = (inVec_41 * inversesqrt(max (0.001, 
    dot (inVec_41, inVec_41)
  )));
  mediump float tmpvar_42;
  tmpvar_42 = clamp (dot (tmpvar_9, tmpvar_40), 0.0, 1.0);
  mediump float tmpvar_43;
  tmpvar_43 = (tmpvar_33 * tmpvar_33);
  specularTerm_39 = ((tmpvar_43 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_40), 0.0, 1.0)) * (1.5 + tmpvar_43))
   * 
    (((tmpvar_42 * tmpvar_42) * ((tmpvar_43 * tmpvar_43) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_44;
  tmpvar_44 = clamp (specularTerm_39, 0.0, 100.0);
  specularTerm_39 = tmpvar_44;
  mediump float x_45;
  x_45 = (1.0 - clamp (dot (tmpvar_9, viewDir_38), 0.0, 1.0));
  mediump vec3 tmpvar_46;
  tmpvar_46 = (((
    ((tmpvar_6 + (tmpvar_44 * tmpvar_7)) * (tmpvar_11 * atten_27))
   * 
    clamp (dot (tmpvar_9, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_31)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_28)
   * tmpvar_6)) + ((
    (1.0 - ((tmpvar_43 * tmpvar_33) * 0.28))
   * 
    (((hdr_34.x * (
      (hdr_34.w * (tmpvar_37.w - 1.0))
     + 1.0)) * tmpvar_37.xyz) * occlusion_28)
  ) * mix (tmpvar_7, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_8)), 0.0, 1.0)
  ), vec3(
    ((x_45 * x_45) * (x_45 * x_45))
  ))));
  mediump vec4 tmpvar_47;
  tmpvar_47.w = 1.0;
  tmpvar_47.xyz = tmpvar_46;
  c_1.w = tmpvar_47.w;
  c_1.xyz = tmpvar_46;
  mediump vec4 xlat_varoutput_48;
  xlat_varoutput_48.xyz = c_1.xyz;
  xlat_varoutput_48.w = 1.0;
  gl_FragData[0] = xlat_varoutput_48;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL _EMISSION 
-- Vertex shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Vertex shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Vertex shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN _EMISSION 
-- Vertex shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Vertex shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Vertex shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 35 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  normalWorld_4 = tmpvar_17;
  tmpvar_8.xyz = normalWorld_4;
  tmpvar_6.xyz = eyeVec_5;
  mediump vec4 ambientOrLightmapUV_18;
  ambientOrLightmapUV_18.w = 0.0;
  highp vec3 lightColor0_19;
  lightColor0_19 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_20;
  lightColor1_20 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_21;
  lightColor2_21 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_22;
  lightColor3_22 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_23;
  lightAttenSq_23 = unity_4LightAtten0;
  highp vec3 normal_24;
  normal_24 = normalWorld_4;
  highp vec3 col_25;
  highp vec4 ndotl_26;
  highp vec4 lengthSq_27;
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosX0 - tmpvar_9.x);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosY0 - tmpvar_9.y);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosZ0 - tmpvar_9.z);
  lengthSq_27 = (tmpvar_28 * tmpvar_28);
  lengthSq_27 = (lengthSq_27 + (tmpvar_29 * tmpvar_29));
  lengthSq_27 = (lengthSq_27 + (tmpvar_30 * tmpvar_30));
  highp vec4 tmpvar_31;
  tmpvar_31 = max (lengthSq_27, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_27 = tmpvar_31;
  ndotl_26 = (tmpvar_28 * normal_24.x);
  ndotl_26 = (ndotl_26 + (tmpvar_29 * normal_24.y));
  ndotl_26 = (ndotl_26 + (tmpvar_30 * normal_24.z));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_26 * inversesqrt(tmpvar_31)));
  ndotl_26 = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33 = (tmpvar_32 * (1.0/((1.0 + 
    (tmpvar_31 * lightAttenSq_23)
  ))));
  col_25 = (lightColor0_19 * tmpvar_33.x);
  col_25 = (col_25 + (lightColor1_20 * tmpvar_33.y));
  col_25 = (col_25 + (lightColor2_21 * tmpvar_33.z));
  col_25 = (col_25 + (lightColor3_22 * tmpvar_33.w));
  ambientOrLightmapUV_18.xyz = col_25;
  mediump vec4 tmpvar_34;
  tmpvar_34.w = 1.0;
  tmpvar_34.xyz = normalWorld_4;
  mediump vec3 res_35;
  mediump vec3 x_36;
  x_36.x = dot (unity_SHAr, tmpvar_34);
  x_36.y = dot (unity_SHAg, tmpvar_34);
  x_36.z = dot (unity_SHAb, tmpvar_34);
  mediump vec3 x1_37;
  mediump vec4 tmpvar_38;
  tmpvar_38 = (normalWorld_4.xyzz * normalWorld_4.yzzx);
  x1_37.x = dot (unity_SHBr, tmpvar_38);
  x1_37.y = dot (unity_SHBg, tmpvar_38);
  x1_37.z = dot (unity_SHBb, tmpvar_38);
  res_35 = (x_36 + (x1_37 + (unity_SHC.xyz * 
    ((normalWorld_4.x * normalWorld_4.x) - (normalWorld_4.y * normalWorld_4.y))
  )));
  mediump vec3 tmpvar_39;
  tmpvar_39 = max (((1.055 * 
    pow (max (res_35, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_35 = tmpvar_39;
  ambientOrLightmapUV_18.xyz = (ambientOrLightmapUV_18.xyz + max (vec3(0.0, 0.0, 0.0), tmpvar_39));
  tmpvar_7.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  mediump float x_40;
  x_40 = (1.0 - clamp (dot (normalWorld_4, 
    -(eyeVec_5)
  ), 0.0, 1.0));
  tmpvar_8.w = ((x_40 * x_40) * (x_40 * x_40));
  tmpvar_6.w = clamp ((_Glossiness + (1.0 - 
    (0.7790837 - (_Metallic * 0.7790837))
  )), 0.0, 1.0);
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = ambientOrLightmapUV_18;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump float rl_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic));
  tmpvar_4 = (tmpvar_3 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_6;
  tmpvar_6 = _LightColor0.xyz;
  mediump float tmpvar_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy);
  tmpvar_7 = tmpvar_8.y;
  rl_1 = dot (xlv_TEXCOORD4.yzw, _WorldSpaceLightPos0.xyz);
  highp vec4 tmpvar_9;
  tmpvar_9 = unity_SpecCube0_HDR;
  mediump float tmpvar_10;
  tmpvar_10 = (1.0 - _Glossiness);
  mediump vec4 hdr_11;
  hdr_11 = tmpvar_9;
  mediump vec4 tmpvar_12;
  tmpvar_12.xyz = xlv_TEXCOORD4.yzw;
  tmpvar_12.w = ((tmpvar_10 * (1.7 - 
    (0.7 * tmpvar_10)
  )) * 6.0);
  lowp vec4 tmpvar_13;
  tmpvar_13 = impl_low_textureCubeLodEXT (unity_SpecCube0, xlv_TEXCOORD4.yzw, tmpvar_12.w);
  mediump vec4 tmpvar_14;
  tmpvar_14 = tmpvar_13;
  mediump vec2 tmpvar_15;
  tmpvar_15.x = ((rl_1 * rl_1) * (rl_1 * rl_1));
  tmpvar_15.y = tmpvar_10;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (unity_NHxRoughness, tmpvar_15);
  mediump vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = (((
    (xlv_TEXCOORD2.xyz * tmpvar_7)
   * tmpvar_4) + (
    (((hdr_11.x * (
      (hdr_11.w * (tmpvar_14.w - 1.0))
     + 1.0)) * tmpvar_14.xyz) * tmpvar_7)
   * 
    mix (tmpvar_5, xlv_TEXCOORD1.www, xlv_TEXCOORD5.www)
  )) + ((tmpvar_4 + 
    ((tmpvar_16.w * 16.0) * tmpvar_5)
  ) * (tmpvar_6 * 
    clamp (dot (xlv_TEXCOORD5.xyz, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  )));
  mediump vec4 xlat_varoutput_18;
  xlat_varoutput_18.xyz = tmpvar_17.xyz;
  xlat_varoutput_18.w = 1.0;
  gl_FragData[0] = xlat_varoutput_18;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 51 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_8.xyz - _WorldSpaceCameraPos));
  tmpvar_13 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  highp vec3 lightColor0_20;
  lightColor0_20 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_21;
  lightColor1_21 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_22;
  lightColor2_22 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_23;
  lightColor3_23 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_24;
  lightAttenSq_24 = unity_4LightAtten0;
  highp vec3 normal_25;
  normal_25 = normalWorld_18;
  highp vec3 col_26;
  highp vec4 ndotl_27;
  highp vec4 lengthSq_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_28 = (tmpvar_29 * tmpvar_29);
  lengthSq_28 = (lengthSq_28 + (tmpvar_30 * tmpvar_30));
  lengthSq_28 = (lengthSq_28 + (tmpvar_31 * tmpvar_31));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (lengthSq_28, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_28 = tmpvar_32;
  ndotl_27 = (tmpvar_29 * normal_25.x);
  ndotl_27 = (ndotl_27 + (tmpvar_30 * normal_25.y));
  ndotl_27 = (ndotl_27 + (tmpvar_31 * normal_25.z));
  highp vec4 tmpvar_33;
  tmpvar_33 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_27 * inversesqrt(tmpvar_32)));
  ndotl_27 = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34 = (tmpvar_33 * (1.0/((1.0 + 
    (tmpvar_32 * lightAttenSq_24)
  ))));
  col_26 = (lightColor0_20 * tmpvar_34.x);
  col_26 = (col_26 + (lightColor1_21 * tmpvar_34.y));
  col_26 = (col_26 + (lightColor2_22 * tmpvar_34.z));
  col_26 = (col_26 + (lightColor3_23 * tmpvar_34.w));
  ambientOrLightmapUV_19.xyz = col_26;
  mediump vec4 tmpvar_35;
  tmpvar_35.w = 1.0;
  tmpvar_35.xyz = normalWorld_18;
  mediump vec3 res_36;
  mediump vec3 x_37;
  x_37.x = dot (unity_SHAr, tmpvar_35);
  x_37.y = dot (unity_SHAg, tmpvar_35);
  x_37.z = dot (unity_SHAb, tmpvar_35);
  mediump vec3 x1_38;
  mediump vec4 tmpvar_39;
  tmpvar_39 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_38.x = dot (unity_SHBr, tmpvar_39);
  x1_38.y = dot (unity_SHBg, tmpvar_39);
  x1_38.z = dot (unity_SHBb, tmpvar_39);
  res_36 = (x_37 + (x1_38 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )));
  mediump vec3 tmpvar_40;
  tmpvar_40 = max (((1.055 * 
    pow (max (res_36, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_36 = tmpvar_40;
  ambientOrLightmapUV_19.xyz = (ambientOrLightmapUV_19.xyz + max (vec3(0.0, 0.0, 0.0), tmpvar_40));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic));
  mediump float tmpvar_6;
  tmpvar_6 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_4 = (tmpvar_3 * tmpvar_6);
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = _LightColor0.xyz;
  mediump float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy);
  tmpvar_9 = tmpvar_10.y;
  highp vec4 tmpvar_11;
  tmpvar_11 = unity_SpecCube0_HDR;
  mediump vec3 tmpvar_12;
  mediump float tmpvar_13;
  tmpvar_13 = (1.0 - _Glossiness);
  tmpvar_12 = (xlv_TEXCOORD1 - (2.0 * (
    dot (tmpvar_7, xlv_TEXCOORD1)
   * tmpvar_7)));
  mediump vec4 hdr_14;
  hdr_14 = tmpvar_11;
  mediump vec4 tmpvar_15;
  tmpvar_15.xyz = tmpvar_12;
  tmpvar_15.w = ((tmpvar_13 * (1.7 - 
    (0.7 * tmpvar_13)
  )) * 6.0);
  lowp vec4 tmpvar_16;
  tmpvar_16 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_12, tmpvar_15.w);
  mediump vec4 tmpvar_17;
  tmpvar_17 = tmpvar_16;
  mediump vec3 viewDir_18;
  viewDir_18 = -(xlv_TEXCOORD1);
  mediump vec3 color_19;
  mediump vec2 tmpvar_20;
  tmpvar_20.x = dot ((viewDir_18 - (2.0 * 
    (dot (tmpvar_7, viewDir_18) * tmpvar_7)
  )), _WorldSpaceLightPos0.xyz);
  tmpvar_20.y = (1.0 - clamp (dot (tmpvar_7, viewDir_18), 0.0, 1.0));
  mediump vec2 tmpvar_21;
  tmpvar_21 = ((tmpvar_20 * tmpvar_20) * (tmpvar_20 * tmpvar_20));
  mediump vec2 tmpvar_22;
  tmpvar_22.x = tmpvar_21.x;
  tmpvar_22.y = tmpvar_13;
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_NHxRoughness, tmpvar_22);
  color_19 = ((tmpvar_4 + (
    (tmpvar_23.w * 16.0)
   * tmpvar_5)) * (tmpvar_8 * clamp (
    dot (tmpvar_7, _WorldSpaceLightPos0.xyz)
  , 0.0, 1.0)));
  color_19 = (color_19 + ((
    (xlv_TEXCOORD5.xyz * tmpvar_9)
   * tmpvar_4) + (
    (((hdr_14.x * (
      (hdr_14.w * (tmpvar_17.w - 1.0))
     + 1.0)) * tmpvar_17.xyz) * tmpvar_9)
   * 
    mix (tmpvar_5, vec3(clamp ((_Glossiness + (1.0 - tmpvar_6)), 0.0, 1.0)), tmpvar_21.yyy)
  )));
  mediump vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = color_19;
  c_1.w = tmpvar_24.w;
  c_1.xyz = color_19;
  mediump vec4 xlat_varoutput_25;
  xlat_varoutput_25.xyz = c_1.xyz;
  xlat_varoutput_25.w = 1.0;
  gl_FragData[0] = xlat_varoutput_25;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 51 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_8.xyz - _WorldSpaceCameraPos));
  tmpvar_13 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  highp vec3 lightColor0_20;
  lightColor0_20 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_21;
  lightColor1_21 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_22;
  lightColor2_22 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_23;
  lightColor3_23 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_24;
  lightAttenSq_24 = unity_4LightAtten0;
  highp vec3 normal_25;
  normal_25 = normalWorld_18;
  highp vec3 col_26;
  highp vec4 ndotl_27;
  highp vec4 lengthSq_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_28 = (tmpvar_29 * tmpvar_29);
  lengthSq_28 = (lengthSq_28 + (tmpvar_30 * tmpvar_30));
  lengthSq_28 = (lengthSq_28 + (tmpvar_31 * tmpvar_31));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (lengthSq_28, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_28 = tmpvar_32;
  ndotl_27 = (tmpvar_29 * normal_25.x);
  ndotl_27 = (ndotl_27 + (tmpvar_30 * normal_25.y));
  ndotl_27 = (ndotl_27 + (tmpvar_31 * normal_25.z));
  highp vec4 tmpvar_33;
  tmpvar_33 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_27 * inversesqrt(tmpvar_32)));
  ndotl_27 = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34 = (tmpvar_33 * (1.0/((1.0 + 
    (tmpvar_32 * lightAttenSq_24)
  ))));
  col_26 = (lightColor0_20 * tmpvar_34.x);
  col_26 = (col_26 + (lightColor1_21 * tmpvar_34.y));
  col_26 = (col_26 + (lightColor2_22 * tmpvar_34.z));
  col_26 = (col_26 + (lightColor3_23 * tmpvar_34.w));
  ambientOrLightmapUV_19.xyz = col_26;
  mediump vec4 tmpvar_35;
  tmpvar_35.w = 1.0;
  tmpvar_35.xyz = normalWorld_18;
  mediump vec3 res_36;
  mediump vec3 x_37;
  x_37.x = dot (unity_SHAr, tmpvar_35);
  x_37.y = dot (unity_SHAg, tmpvar_35);
  x_37.z = dot (unity_SHAb, tmpvar_35);
  mediump vec3 x1_38;
  mediump vec4 tmpvar_39;
  tmpvar_39 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_38.x = dot (unity_SHBr, tmpvar_39);
  x1_38.y = dot (unity_SHBg, tmpvar_39);
  x1_38.z = dot (unity_SHBb, tmpvar_39);
  res_36 = (x_37 + (x1_38 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )));
  mediump vec3 tmpvar_40;
  tmpvar_40 = max (((1.055 * 
    pow (max (res_36, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_36 = tmpvar_40;
  ambientOrLightmapUV_19.xyz = (ambientOrLightmapUV_19.xyz + max (vec3(0.0, 0.0, 0.0), tmpvar_40));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic));
  mediump float tmpvar_6;
  tmpvar_6 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_4 = (tmpvar_3 * tmpvar_6);
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = _LightColor0.xyz;
  mediump float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy);
  tmpvar_9 = tmpvar_10.y;
  highp vec4 tmpvar_11;
  tmpvar_11 = unity_SpecCube0_HDR;
  mediump vec3 tmpvar_12;
  mediump float tmpvar_13;
  tmpvar_13 = (1.0 - _Glossiness);
  tmpvar_12 = (xlv_TEXCOORD1 - (2.0 * (
    dot (tmpvar_7, xlv_TEXCOORD1)
   * tmpvar_7)));
  mediump vec4 hdr_14;
  hdr_14 = tmpvar_11;
  mediump vec4 tmpvar_15;
  tmpvar_15.xyz = tmpvar_12;
  tmpvar_15.w = ((tmpvar_13 * (1.7 - 
    (0.7 * tmpvar_13)
  )) * 6.0);
  lowp vec4 tmpvar_16;
  tmpvar_16 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_12, tmpvar_15.w);
  mediump vec4 tmpvar_17;
  tmpvar_17 = tmpvar_16;
  mediump vec3 viewDir_18;
  viewDir_18 = -(xlv_TEXCOORD1);
  mediump vec3 color_19;
  mediump vec2 tmpvar_20;
  tmpvar_20.x = dot ((viewDir_18 - (2.0 * 
    (dot (tmpvar_7, viewDir_18) * tmpvar_7)
  )), _WorldSpaceLightPos0.xyz);
  tmpvar_20.y = (1.0 - clamp (dot (tmpvar_7, viewDir_18), 0.0, 1.0));
  mediump vec2 tmpvar_21;
  tmpvar_21 = ((tmpvar_20 * tmpvar_20) * (tmpvar_20 * tmpvar_20));
  mediump vec2 tmpvar_22;
  tmpvar_22.x = tmpvar_21.x;
  tmpvar_22.y = tmpvar_13;
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_NHxRoughness, tmpvar_22);
  color_19 = ((tmpvar_4 + (
    (tmpvar_23.w * 16.0)
   * tmpvar_5)) * (tmpvar_8 * clamp (
    dot (tmpvar_7, _WorldSpaceLightPos0.xyz)
  , 0.0, 1.0)));
  color_19 = (color_19 + ((
    (xlv_TEXCOORD5.xyz * tmpvar_9)
   * tmpvar_4) + (
    (((hdr_14.x * (
      (hdr_14.w * (tmpvar_17.w - 1.0))
     + 1.0)) * tmpvar_17.xyz) * tmpvar_9)
   * 
    mix (tmpvar_5, vec3(clamp ((_Glossiness + (1.0 - tmpvar_6)), 0.0, 1.0)), tmpvar_21.yyy)
  )));
  mediump vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = color_19;
  c_1.w = tmpvar_24.w;
  c_1.xyz = color_19;
  mediump vec4 xlat_varoutput_25;
  xlat_varoutput_25.xyz = c_1.xyz;
  xlat_varoutput_25.w = 1.0;
  gl_FragData[0] = xlat_varoutput_25;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 42 math, 5 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  normalWorld_4 = tmpvar_17;
  tmpvar_8.xyz = normalWorld_4;
  tmpvar_6.xyz = eyeVec_5;
  mediump vec4 ambientOrLightmapUV_18;
  ambientOrLightmapUV_18.w = 0.0;
  highp vec3 lightColor0_19;
  lightColor0_19 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_20;
  lightColor1_20 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_21;
  lightColor2_21 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_22;
  lightColor3_22 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_23;
  lightAttenSq_23 = unity_4LightAtten0;
  highp vec3 normal_24;
  normal_24 = normalWorld_4;
  highp vec3 col_25;
  highp vec4 ndotl_26;
  highp vec4 lengthSq_27;
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosX0 - tmpvar_9.x);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosY0 - tmpvar_9.y);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosZ0 - tmpvar_9.z);
  lengthSq_27 = (tmpvar_28 * tmpvar_28);
  lengthSq_27 = (lengthSq_27 + (tmpvar_29 * tmpvar_29));
  lengthSq_27 = (lengthSq_27 + (tmpvar_30 * tmpvar_30));
  highp vec4 tmpvar_31;
  tmpvar_31 = max (lengthSq_27, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_27 = tmpvar_31;
  ndotl_26 = (tmpvar_28 * normal_24.x);
  ndotl_26 = (ndotl_26 + (tmpvar_29 * normal_24.y));
  ndotl_26 = (ndotl_26 + (tmpvar_30 * normal_24.z));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_26 * inversesqrt(tmpvar_31)));
  ndotl_26 = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33 = (tmpvar_32 * (1.0/((1.0 + 
    (tmpvar_31 * lightAttenSq_23)
  ))));
  col_25 = (lightColor0_19 * tmpvar_33.x);
  col_25 = (col_25 + (lightColor1_20 * tmpvar_33.y));
  col_25 = (col_25 + (lightColor2_21 * tmpvar_33.z));
  col_25 = (col_25 + (lightColor3_22 * tmpvar_33.w));
  ambientOrLightmapUV_18.xyz = col_25;
  mediump vec4 tmpvar_34;
  tmpvar_34.w = 1.0;
  tmpvar_34.xyz = normalWorld_4;
  mediump vec3 res_35;
  mediump vec3 x_36;
  x_36.x = dot (unity_SHAr, tmpvar_34);
  x_36.y = dot (unity_SHAg, tmpvar_34);
  x_36.z = dot (unity_SHAb, tmpvar_34);
  mediump vec3 x1_37;
  mediump vec4 tmpvar_38;
  tmpvar_38 = (normalWorld_4.xyzz * normalWorld_4.yzzx);
  x1_37.x = dot (unity_SHBr, tmpvar_38);
  x1_37.y = dot (unity_SHBg, tmpvar_38);
  x1_37.z = dot (unity_SHBb, tmpvar_38);
  res_35 = (x_36 + (x1_37 + (unity_SHC.xyz * 
    ((normalWorld_4.x * normalWorld_4.x) - (normalWorld_4.y * normalWorld_4.y))
  )));
  mediump vec3 tmpvar_39;
  tmpvar_39 = max (((1.055 * 
    pow (max (res_35, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_35 = tmpvar_39;
  ambientOrLightmapUV_18.xyz = (ambientOrLightmapUV_18.xyz + max (vec3(0.0, 0.0, 0.0), tmpvar_39));
  tmpvar_7.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  mediump float x_40;
  x_40 = (1.0 - clamp (dot (normalWorld_4, 
    -(eyeVec_5)
  ), 0.0, 1.0));
  tmpvar_8.w = ((x_40 * x_40) * (x_40 * x_40));
  tmpvar_6.w = clamp ((_Glossiness + (1.0 - 
    (0.7790837 - (_Metallic * 0.7790837))
  )), 0.0, 1.0);
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = ambientOrLightmapUV_18;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 _LightShadowData;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump float rl_1;
  mediump float realtimeShadowAttenuation_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic));
  tmpvar_5 = (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_7;
  tmpvar_7 = _LightColor0.xyz;
  lowp float tmpvar_8;
  highp float lightShadowDataX_9;
  mediump float tmpvar_10;
  tmpvar_10 = _LightShadowData.x;
  lightShadowDataX_9 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_9);
  tmpvar_8 = tmpvar_11;
  realtimeShadowAttenuation_2 = tmpvar_8;
  mediump float occ_12;
  lowp float tmpvar_13;
  tmpvar_13 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_12 = tmpvar_13;
  rl_1 = dot (xlv_TEXCOORD4.yzw, _WorldSpaceLightPos0.xyz);
  mediump float occlusion_14;
  occlusion_14 = ((1.0 - _OcclusionStrength) + (occ_12 * _OcclusionStrength));
  highp vec4 tmpvar_15;
  tmpvar_15 = unity_SpecCube0_HDR;
  mediump float tmpvar_16;
  tmpvar_16 = (1.0 - _Glossiness);
  mediump vec4 hdr_17;
  hdr_17 = tmpvar_15;
  mediump vec4 tmpvar_18;
  tmpvar_18.xyz = xlv_TEXCOORD4.yzw;
  tmpvar_18.w = ((tmpvar_16 * (1.7 - 
    (0.7 * tmpvar_16)
  )) * 6.0);
  lowp vec4 tmpvar_19;
  tmpvar_19 = impl_low_textureCubeLodEXT (unity_SpecCube0, xlv_TEXCOORD4.yzw, tmpvar_18.w);
  mediump vec4 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  mediump vec2 tmpvar_21;
  tmpvar_21.x = ((rl_1 * rl_1) * (rl_1 * rl_1));
  tmpvar_21.y = tmpvar_16;
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (unity_NHxRoughness, tmpvar_21);
  mediump vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = (((
    (xlv_TEXCOORD2.xyz * occlusion_14)
   * tmpvar_5) + (
    (((hdr_17.x * (
      (hdr_17.w * (tmpvar_20.w - 1.0))
     + 1.0)) * tmpvar_20.xyz) * occlusion_14)
   * 
    mix (tmpvar_6, xlv_TEXCOORD1.www, xlv_TEXCOORD5.www)
  )) + ((tmpvar_5 + 
    ((tmpvar_22.w * 16.0) * tmpvar_6)
  ) * (
    (tmpvar_7 * realtimeShadowAttenuation_2)
   * 
    clamp (dot (xlv_TEXCOORD5.xyz, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  )));
  mediump vec4 xlat_varoutput_24;
  xlat_varoutput_24.xyz = tmpvar_23.xyz;
  xlat_varoutput_24.w = 1.0;
  gl_FragData[0] = xlat_varoutput_24;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 102 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  highp vec3 lightColor0_20;
  lightColor0_20 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_21;
  lightColor1_21 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_22;
  lightColor2_22 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_23;
  lightColor3_23 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_24;
  lightAttenSq_24 = unity_4LightAtten0;
  highp vec3 normal_25;
  normal_25 = normalWorld_18;
  highp vec3 col_26;
  highp vec4 ndotl_27;
  highp vec4 lengthSq_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_28 = (tmpvar_29 * tmpvar_29);
  lengthSq_28 = (lengthSq_28 + (tmpvar_30 * tmpvar_30));
  lengthSq_28 = (lengthSq_28 + (tmpvar_31 * tmpvar_31));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (lengthSq_28, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_28 = tmpvar_32;
  ndotl_27 = (tmpvar_29 * normal_25.x);
  ndotl_27 = (ndotl_27 + (tmpvar_30 * normal_25.y));
  ndotl_27 = (ndotl_27 + (tmpvar_31 * normal_25.z));
  highp vec4 tmpvar_33;
  tmpvar_33 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_27 * inversesqrt(tmpvar_32)));
  ndotl_27 = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34 = (tmpvar_33 * (1.0/((1.0 + 
    (tmpvar_32 * lightAttenSq_24)
  ))));
  col_26 = (lightColor0_20 * tmpvar_34.x);
  col_26 = (col_26 + (lightColor1_21 * tmpvar_34.y));
  col_26 = (col_26 + (lightColor2_22 * tmpvar_34.z));
  col_26 = (col_26 + (lightColor3_23 * tmpvar_34.w));
  ambientOrLightmapUV_19.xyz = col_26;
  mediump vec3 x1_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_35.x = dot (unity_SHBr, tmpvar_36);
  x1_35.y = dot (unity_SHBg, tmpvar_36);
  x1_35.z = dot (unity_SHBb, tmpvar_36);
  ambientOrLightmapUV_19.xyz = ((ambientOrLightmapUV_19.xyz * (
    (ambientOrLightmapUV_19.xyz * ((ambientOrLightmapUV_19.xyz * 0.305306) + 0.6821711))
   + 0.01252288)) + (x1_35 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp float atten_2;
  mediump vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  mediump float tmpvar_8;
  tmpvar_8 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_6 = (tmpvar_5 * tmpvar_8);
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_10;
  tmpvar_10 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  highp vec3 worldPos_12;
  worldPos_12 = tmpvar_3;
  mediump float realtimeShadowAttenuation_13;
  highp vec4 v_14;
  v_14.x = unity_MatrixV[0].z;
  v_14.y = unity_MatrixV[1].z;
  v_14.z = unity_MatrixV[2].z;
  v_14.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (worldPos_12 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_12), v_14.xyz), sqrt(dot (tmpvar_15, tmpvar_15)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_16 = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = worldPos_12;
  lowp float tmpvar_19;
  highp vec4 shadowCoord_20;
  shadowCoord_20 = (unity_WorldToShadow[0] * tmpvar_18);
  highp float lightShadowDataX_21;
  mediump float tmpvar_22;
  tmpvar_22 = _LightShadowData.x;
  lightShadowDataX_21 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = max (float((texture2D (_ShadowMapTexture, shadowCoord_20.xy).x > shadowCoord_20.z)), lightShadowDataX_21);
  tmpvar_19 = tmpvar_23;
  realtimeShadowAttenuation_13 = tmpvar_19;
  mediump float tmpvar_24;
  tmpvar_24 = clamp ((realtimeShadowAttenuation_13 + tmpvar_16), 0.0, 1.0);
  atten_2 = tmpvar_24;
  mediump float occ_25;
  lowp float tmpvar_26;
  tmpvar_26 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_25 = tmpvar_26;
  mediump float atten_27;
  atten_27 = atten_2;
  mediump float occlusion_28;
  occlusion_28 = ((1.0 - _OcclusionStrength) + (occ_25 * _OcclusionStrength));
  highp vec4 tmpvar_29;
  tmpvar_29 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = tmpvar_9;
  mediump vec3 x_31;
  x_31.x = dot (unity_SHAr, tmpvar_30);
  x_31.y = dot (unity_SHAg, tmpvar_30);
  x_31.z = dot (unity_SHAb, tmpvar_30);
  mediump vec3 tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = (1.0 - _Glossiness);
  tmpvar_32 = (tmpvar_10 - (2.0 * (
    dot (tmpvar_9, tmpvar_10)
   * tmpvar_9)));
  mediump vec4 hdr_34;
  hdr_34 = tmpvar_29;
  mediump vec4 tmpvar_35;
  tmpvar_35.xyz = tmpvar_32;
  tmpvar_35.w = ((tmpvar_33 * (1.7 - 
    (0.7 * tmpvar_33)
  )) * 6.0);
  lowp vec4 tmpvar_36;
  tmpvar_36 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_32, tmpvar_35.w);
  mediump vec4 tmpvar_37;
  tmpvar_37 = tmpvar_36;
  mediump vec3 viewDir_38;
  viewDir_38 = -(tmpvar_10);
  mediump float specularTerm_39;
  mediump vec3 tmpvar_40;
  mediump vec3 inVec_41;
  inVec_41 = (_WorldSpaceLightPos0.xyz + viewDir_38);
  tmpvar_40 = (inVec_41 * inversesqrt(max (0.001, 
    dot (inVec_41, inVec_41)
  )));
  mediump float tmpvar_42;
  tmpvar_42 = clamp (dot (tmpvar_9, tmpvar_40), 0.0, 1.0);
  mediump float tmpvar_43;
  tmpvar_43 = (tmpvar_33 * tmpvar_33);
  specularTerm_39 = ((tmpvar_43 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_40), 0.0, 1.0)) * (1.5 + tmpvar_43))
   * 
    (((tmpvar_42 * tmpvar_42) * ((tmpvar_43 * tmpvar_43) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_44;
  tmpvar_44 = clamp (specularTerm_39, 0.0, 100.0);
  specularTerm_39 = tmpvar_44;
  mediump float x_45;
  x_45 = (1.0 - clamp (dot (tmpvar_9, viewDir_38), 0.0, 1.0));
  mediump vec3 tmpvar_46;
  tmpvar_46 = (((
    ((tmpvar_6 + (tmpvar_44 * tmpvar_7)) * (tmpvar_11 * atten_27))
   * 
    clamp (dot (tmpvar_9, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_31)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_28)
   * tmpvar_6)) + ((
    (1.0 - ((tmpvar_43 * tmpvar_33) * 0.28))
   * 
    (((hdr_34.x * (
      (hdr_34.w * (tmpvar_37.w - 1.0))
     + 1.0)) * tmpvar_37.xyz) * occlusion_28)
  ) * mix (tmpvar_7, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_8)), 0.0, 1.0)
  ), vec3(
    ((x_45 * x_45) * (x_45 * x_45))
  ))));
  mediump vec4 tmpvar_47;
  tmpvar_47.w = 1.0;
  tmpvar_47.xyz = tmpvar_46;
  c_1.w = tmpvar_47.w;
  c_1.xyz = tmpvar_46;
  mediump vec4 xlat_varoutput_48;
  xlat_varoutput_48.xyz = c_1.xyz;
  xlat_varoutput_48.w = 1.0;
  gl_FragData[0] = xlat_varoutput_48;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 102 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  highp vec3 lightColor0_20;
  lightColor0_20 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_21;
  lightColor1_21 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_22;
  lightColor2_22 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_23;
  lightColor3_23 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_24;
  lightAttenSq_24 = unity_4LightAtten0;
  highp vec3 normal_25;
  normal_25 = normalWorld_18;
  highp vec3 col_26;
  highp vec4 ndotl_27;
  highp vec4 lengthSq_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_28 = (tmpvar_29 * tmpvar_29);
  lengthSq_28 = (lengthSq_28 + (tmpvar_30 * tmpvar_30));
  lengthSq_28 = (lengthSq_28 + (tmpvar_31 * tmpvar_31));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (lengthSq_28, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_28 = tmpvar_32;
  ndotl_27 = (tmpvar_29 * normal_25.x);
  ndotl_27 = (ndotl_27 + (tmpvar_30 * normal_25.y));
  ndotl_27 = (ndotl_27 + (tmpvar_31 * normal_25.z));
  highp vec4 tmpvar_33;
  tmpvar_33 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_27 * inversesqrt(tmpvar_32)));
  ndotl_27 = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34 = (tmpvar_33 * (1.0/((1.0 + 
    (tmpvar_32 * lightAttenSq_24)
  ))));
  col_26 = (lightColor0_20 * tmpvar_34.x);
  col_26 = (col_26 + (lightColor1_21 * tmpvar_34.y));
  col_26 = (col_26 + (lightColor2_22 * tmpvar_34.z));
  col_26 = (col_26 + (lightColor3_23 * tmpvar_34.w));
  ambientOrLightmapUV_19.xyz = col_26;
  mediump vec3 x1_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_35.x = dot (unity_SHBr, tmpvar_36);
  x1_35.y = dot (unity_SHBg, tmpvar_36);
  x1_35.z = dot (unity_SHBb, tmpvar_36);
  ambientOrLightmapUV_19.xyz = ((ambientOrLightmapUV_19.xyz * (
    (ambientOrLightmapUV_19.xyz * ((ambientOrLightmapUV_19.xyz * 0.305306) + 0.6821711))
   + 0.01252288)) + (x1_35 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp float atten_2;
  mediump vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  mediump float tmpvar_8;
  tmpvar_8 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_6 = (tmpvar_5 * tmpvar_8);
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_10;
  tmpvar_10 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  highp vec3 worldPos_12;
  worldPos_12 = tmpvar_3;
  mediump float realtimeShadowAttenuation_13;
  highp vec4 v_14;
  v_14.x = unity_MatrixV[0].z;
  v_14.y = unity_MatrixV[1].z;
  v_14.z = unity_MatrixV[2].z;
  v_14.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (worldPos_12 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_12), v_14.xyz), sqrt(dot (tmpvar_15, tmpvar_15)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_16 = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = worldPos_12;
  lowp float tmpvar_19;
  highp vec4 shadowCoord_20;
  shadowCoord_20 = (unity_WorldToShadow[0] * tmpvar_18);
  highp float lightShadowDataX_21;
  mediump float tmpvar_22;
  tmpvar_22 = _LightShadowData.x;
  lightShadowDataX_21 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = max (float((texture2D (_ShadowMapTexture, shadowCoord_20.xy).x > shadowCoord_20.z)), lightShadowDataX_21);
  tmpvar_19 = tmpvar_23;
  realtimeShadowAttenuation_13 = tmpvar_19;
  mediump float tmpvar_24;
  tmpvar_24 = clamp ((realtimeShadowAttenuation_13 + tmpvar_16), 0.0, 1.0);
  atten_2 = tmpvar_24;
  mediump float occ_25;
  lowp float tmpvar_26;
  tmpvar_26 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_25 = tmpvar_26;
  mediump float atten_27;
  atten_27 = atten_2;
  mediump float occlusion_28;
  occlusion_28 = ((1.0 - _OcclusionStrength) + (occ_25 * _OcclusionStrength));
  highp vec4 tmpvar_29;
  tmpvar_29 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = tmpvar_9;
  mediump vec3 x_31;
  x_31.x = dot (unity_SHAr, tmpvar_30);
  x_31.y = dot (unity_SHAg, tmpvar_30);
  x_31.z = dot (unity_SHAb, tmpvar_30);
  mediump vec3 tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = (1.0 - _Glossiness);
  tmpvar_32 = (tmpvar_10 - (2.0 * (
    dot (tmpvar_9, tmpvar_10)
   * tmpvar_9)));
  mediump vec4 hdr_34;
  hdr_34 = tmpvar_29;
  mediump vec4 tmpvar_35;
  tmpvar_35.xyz = tmpvar_32;
  tmpvar_35.w = ((tmpvar_33 * (1.7 - 
    (0.7 * tmpvar_33)
  )) * 6.0);
  lowp vec4 tmpvar_36;
  tmpvar_36 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_32, tmpvar_35.w);
  mediump vec4 tmpvar_37;
  tmpvar_37 = tmpvar_36;
  mediump vec3 viewDir_38;
  viewDir_38 = -(tmpvar_10);
  mediump float specularTerm_39;
  mediump vec3 tmpvar_40;
  mediump vec3 inVec_41;
  inVec_41 = (_WorldSpaceLightPos0.xyz + viewDir_38);
  tmpvar_40 = (inVec_41 * inversesqrt(max (0.001, 
    dot (inVec_41, inVec_41)
  )));
  mediump float tmpvar_42;
  tmpvar_42 = clamp (dot (tmpvar_9, tmpvar_40), 0.0, 1.0);
  mediump float tmpvar_43;
  tmpvar_43 = (tmpvar_33 * tmpvar_33);
  specularTerm_39 = ((tmpvar_43 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_40), 0.0, 1.0)) * (1.5 + tmpvar_43))
   * 
    (((tmpvar_42 * tmpvar_42) * ((tmpvar_43 * tmpvar_43) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_44;
  tmpvar_44 = clamp (specularTerm_39, 0.0, 100.0);
  specularTerm_39 = tmpvar_44;
  mediump float x_45;
  x_45 = (1.0 - clamp (dot (tmpvar_9, viewDir_38), 0.0, 1.0));
  mediump vec3 tmpvar_46;
  tmpvar_46 = (((
    ((tmpvar_6 + (tmpvar_44 * tmpvar_7)) * (tmpvar_11 * atten_27))
   * 
    clamp (dot (tmpvar_9, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_31)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_28)
   * tmpvar_6)) + ((
    (1.0 - ((tmpvar_43 * tmpvar_33) * 0.28))
   * 
    (((hdr_34.x * (
      (hdr_34.w * (tmpvar_37.w - 1.0))
     + 1.0)) * tmpvar_37.xyz) * occlusion_28)
  ) * mix (tmpvar_7, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_8)), 0.0, 1.0)
  ), vec3(
    ((x_45 * x_45) * (x_45 * x_45))
  ))));
  mediump vec4 tmpvar_47;
  tmpvar_47.w = 1.0;
  tmpvar_47.xyz = tmpvar_46;
  c_1.w = tmpvar_47.w;
  c_1.xyz = tmpvar_46;
  mediump vec4 xlat_varoutput_48;
  xlat_varoutput_48.xyz = c_1.xyz;
  xlat_varoutput_48.w = 1.0;
  gl_FragData[0] = xlat_varoutput_48;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 37 math, 5 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  normalWorld_4 = tmpvar_17;
  tmpvar_8.xyz = normalWorld_4;
  tmpvar_6.xyz = eyeVec_5;
  mediump vec4 ambientOrLightmapUV_18;
  ambientOrLightmapUV_18.w = 0.0;
  mediump vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = normalWorld_4;
  mediump vec3 res_20;
  mediump vec3 x_21;
  x_21.x = dot (unity_SHAr, tmpvar_19);
  x_21.y = dot (unity_SHAg, tmpvar_19);
  x_21.z = dot (unity_SHAb, tmpvar_19);
  mediump vec3 x1_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normalWorld_4.xyzz * normalWorld_4.yzzx);
  x1_22.x = dot (unity_SHBr, tmpvar_23);
  x1_22.y = dot (unity_SHBg, tmpvar_23);
  x1_22.z = dot (unity_SHBb, tmpvar_23);
  res_20 = (x_21 + (x1_22 + (unity_SHC.xyz * 
    ((normalWorld_4.x * normalWorld_4.x) - (normalWorld_4.y * normalWorld_4.y))
  )));
  mediump vec3 tmpvar_24;
  tmpvar_24 = max (((1.055 * 
    pow (max (res_20, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_20 = tmpvar_24;
  ambientOrLightmapUV_18.xyz = max (vec3(0.0, 0.0, 0.0), tmpvar_24);
  tmpvar_7.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  mediump float x_25;
  x_25 = (1.0 - clamp (dot (normalWorld_4, 
    -(eyeVec_5)
  ), 0.0, 1.0));
  tmpvar_8.w = ((x_25 * x_25) * (x_25 * x_25));
  tmpvar_6.w = clamp ((_Glossiness + (1.0 - 
    (0.7790837 - (_Metallic * 0.7790837))
  )), 0.0, 1.0);
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = ambientOrLightmapUV_18;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  mediump float rl_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic));
  tmpvar_5 = (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_7;
  tmpvar_7 = _LightColor0.xyz;
  mediump float tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy);
  tmpvar_8 = tmpvar_9.y;
  rl_2 = dot (xlv_TEXCOORD4.yzw, _WorldSpaceLightPos0.xyz);
  highp vec4 tmpvar_10;
  tmpvar_10 = unity_SpecCube0_HDR;
  mediump float tmpvar_11;
  tmpvar_11 = (1.0 - _Glossiness);
  mediump vec4 hdr_12;
  hdr_12 = tmpvar_10;
  mediump vec4 tmpvar_13;
  tmpvar_13.xyz = xlv_TEXCOORD4.yzw;
  tmpvar_13.w = ((tmpvar_11 * (1.7 - 
    (0.7 * tmpvar_11)
  )) * 6.0);
  lowp vec4 tmpvar_14;
  tmpvar_14 = impl_low_textureCubeLodEXT (unity_SpecCube0, xlv_TEXCOORD4.yzw, tmpvar_13.w);
  mediump vec4 tmpvar_15;
  tmpvar_15 = tmpvar_14;
  mediump vec2 tmpvar_16;
  tmpvar_16.x = ((rl_2 * rl_2) * (rl_2 * rl_2));
  tmpvar_16.y = tmpvar_11;
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (unity_NHxRoughness, tmpvar_16);
  c_1 = (((
    (xlv_TEXCOORD2.xyz * tmpvar_8)
   * tmpvar_5) + (
    (((hdr_12.x * (
      (hdr_12.w * (tmpvar_15.w - 1.0))
     + 1.0)) * tmpvar_15.xyz) * tmpvar_8)
   * 
    mix (tmpvar_6, xlv_TEXCOORD1.www, xlv_TEXCOORD5.www)
  )) + ((tmpvar_5 + 
    ((tmpvar_17.w * 16.0) * tmpvar_6)
  ) * (tmpvar_7 * 
    clamp (dot (xlv_TEXCOORD5.xyz, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  )));
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1 = (c_1 + (tmpvar_18.xyz * _EmissionColor.xyz));
  mediump vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = c_1;
  mediump vec4 xlat_varoutput_20;
  xlat_varoutput_20.xyz = tmpvar_19.xyz;
  xlat_varoutput_20.w = 1.0;
  gl_FragData[0] = xlat_varoutput_20;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 53 math, 5 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_8.xyz - _WorldSpaceCameraPos));
  tmpvar_13 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  mediump vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = normalWorld_18;
  mediump vec3 res_21;
  mediump vec3 x_22;
  x_22.x = dot (unity_SHAr, tmpvar_20);
  x_22.y = dot (unity_SHAg, tmpvar_20);
  x_22.z = dot (unity_SHAb, tmpvar_20);
  mediump vec3 x1_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_23.x = dot (unity_SHBr, tmpvar_24);
  x1_23.y = dot (unity_SHBg, tmpvar_24);
  x1_23.z = dot (unity_SHBb, tmpvar_24);
  res_21 = (x_22 + (x1_23 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )));
  mediump vec3 tmpvar_25;
  tmpvar_25 = max (((1.055 * 
    pow (max (res_21, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_21 = tmpvar_25;
  ambientOrLightmapUV_19.xyz = max (vec3(0.0, 0.0, 0.0), tmpvar_25);
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic));
  mediump float tmpvar_6;
  tmpvar_6 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_4 = (tmpvar_3 * tmpvar_6);
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = _LightColor0.xyz;
  mediump float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy);
  tmpvar_9 = tmpvar_10.y;
  highp vec4 tmpvar_11;
  tmpvar_11 = unity_SpecCube0_HDR;
  mediump vec3 tmpvar_12;
  mediump float tmpvar_13;
  tmpvar_13 = (1.0 - _Glossiness);
  tmpvar_12 = (xlv_TEXCOORD1 - (2.0 * (
    dot (tmpvar_7, xlv_TEXCOORD1)
   * tmpvar_7)));
  mediump vec4 hdr_14;
  hdr_14 = tmpvar_11;
  mediump vec4 tmpvar_15;
  tmpvar_15.xyz = tmpvar_12;
  tmpvar_15.w = ((tmpvar_13 * (1.7 - 
    (0.7 * tmpvar_13)
  )) * 6.0);
  lowp vec4 tmpvar_16;
  tmpvar_16 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_12, tmpvar_15.w);
  mediump vec4 tmpvar_17;
  tmpvar_17 = tmpvar_16;
  mediump vec3 viewDir_18;
  viewDir_18 = -(xlv_TEXCOORD1);
  mediump vec3 color_19;
  mediump vec2 tmpvar_20;
  tmpvar_20.x = dot ((viewDir_18 - (2.0 * 
    (dot (tmpvar_7, viewDir_18) * tmpvar_7)
  )), _WorldSpaceLightPos0.xyz);
  tmpvar_20.y = (1.0 - clamp (dot (tmpvar_7, viewDir_18), 0.0, 1.0));
  mediump vec2 tmpvar_21;
  tmpvar_21 = ((tmpvar_20 * tmpvar_20) * (tmpvar_20 * tmpvar_20));
  mediump vec2 tmpvar_22;
  tmpvar_22.x = tmpvar_21.x;
  tmpvar_22.y = tmpvar_13;
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_NHxRoughness, tmpvar_22);
  color_19 = ((tmpvar_4 + (
    (tmpvar_23.w * 16.0)
   * tmpvar_5)) * (tmpvar_8 * clamp (
    dot (tmpvar_7, _WorldSpaceLightPos0.xyz)
  , 0.0, 1.0)));
  color_19 = (color_19 + ((
    (xlv_TEXCOORD5.xyz * tmpvar_9)
   * tmpvar_4) + (
    (((hdr_14.x * (
      (hdr_14.w * (tmpvar_17.w - 1.0))
     + 1.0)) * tmpvar_17.xyz) * tmpvar_9)
   * 
    mix (tmpvar_5, vec3(clamp ((_Glossiness + (1.0 - tmpvar_6)), 0.0, 1.0)), tmpvar_21.yyy)
  )));
  mediump vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = color_19;
  c_1.w = tmpvar_24.w;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1.xyz = (color_19 + (tmpvar_25.xyz * _EmissionColor.xyz));
  mediump vec4 xlat_varoutput_26;
  xlat_varoutput_26.xyz = c_1.xyz;
  xlat_varoutput_26.w = 1.0;
  gl_FragData[0] = xlat_varoutput_26;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 53 math, 5 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_8.xyz - _WorldSpaceCameraPos));
  tmpvar_13 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  mediump vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = normalWorld_18;
  mediump vec3 res_21;
  mediump vec3 x_22;
  x_22.x = dot (unity_SHAr, tmpvar_20);
  x_22.y = dot (unity_SHAg, tmpvar_20);
  x_22.z = dot (unity_SHAb, tmpvar_20);
  mediump vec3 x1_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_23.x = dot (unity_SHBr, tmpvar_24);
  x1_23.y = dot (unity_SHBg, tmpvar_24);
  x1_23.z = dot (unity_SHBb, tmpvar_24);
  res_21 = (x_22 + (x1_23 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )));
  mediump vec3 tmpvar_25;
  tmpvar_25 = max (((1.055 * 
    pow (max (res_21, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_21 = tmpvar_25;
  ambientOrLightmapUV_19.xyz = max (vec3(0.0, 0.0, 0.0), tmpvar_25);
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic));
  mediump float tmpvar_6;
  tmpvar_6 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_4 = (tmpvar_3 * tmpvar_6);
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = _LightColor0.xyz;
  mediump float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy);
  tmpvar_9 = tmpvar_10.y;
  highp vec4 tmpvar_11;
  tmpvar_11 = unity_SpecCube0_HDR;
  mediump vec3 tmpvar_12;
  mediump float tmpvar_13;
  tmpvar_13 = (1.0 - _Glossiness);
  tmpvar_12 = (xlv_TEXCOORD1 - (2.0 * (
    dot (tmpvar_7, xlv_TEXCOORD1)
   * tmpvar_7)));
  mediump vec4 hdr_14;
  hdr_14 = tmpvar_11;
  mediump vec4 tmpvar_15;
  tmpvar_15.xyz = tmpvar_12;
  tmpvar_15.w = ((tmpvar_13 * (1.7 - 
    (0.7 * tmpvar_13)
  )) * 6.0);
  lowp vec4 tmpvar_16;
  tmpvar_16 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_12, tmpvar_15.w);
  mediump vec4 tmpvar_17;
  tmpvar_17 = tmpvar_16;
  mediump vec3 viewDir_18;
  viewDir_18 = -(xlv_TEXCOORD1);
  mediump vec3 color_19;
  mediump vec2 tmpvar_20;
  tmpvar_20.x = dot ((viewDir_18 - (2.0 * 
    (dot (tmpvar_7, viewDir_18) * tmpvar_7)
  )), _WorldSpaceLightPos0.xyz);
  tmpvar_20.y = (1.0 - clamp (dot (tmpvar_7, viewDir_18), 0.0, 1.0));
  mediump vec2 tmpvar_21;
  tmpvar_21 = ((tmpvar_20 * tmpvar_20) * (tmpvar_20 * tmpvar_20));
  mediump vec2 tmpvar_22;
  tmpvar_22.x = tmpvar_21.x;
  tmpvar_22.y = tmpvar_13;
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_NHxRoughness, tmpvar_22);
  color_19 = ((tmpvar_4 + (
    (tmpvar_23.w * 16.0)
   * tmpvar_5)) * (tmpvar_8 * clamp (
    dot (tmpvar_7, _WorldSpaceLightPos0.xyz)
  , 0.0, 1.0)));
  color_19 = (color_19 + ((
    (xlv_TEXCOORD5.xyz * tmpvar_9)
   * tmpvar_4) + (
    (((hdr_14.x * (
      (hdr_14.w * (tmpvar_17.w - 1.0))
     + 1.0)) * tmpvar_17.xyz) * tmpvar_9)
   * 
    mix (tmpvar_5, vec3(clamp ((_Glossiness + (1.0 - tmpvar_6)), 0.0, 1.0)), tmpvar_21.yyy)
  )));
  mediump vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = color_19;
  c_1.w = tmpvar_24.w;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1.xyz = (color_19 + (tmpvar_25.xyz * _EmissionColor.xyz));
  mediump vec4 xlat_varoutput_26;
  xlat_varoutput_26.xyz = c_1.xyz;
  xlat_varoutput_26.w = 1.0;
  gl_FragData[0] = xlat_varoutput_26;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN _EMISSION 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 44 math, 6 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  normalWorld_4 = tmpvar_17;
  tmpvar_8.xyz = normalWorld_4;
  tmpvar_6.xyz = eyeVec_5;
  mediump vec4 ambientOrLightmapUV_18;
  ambientOrLightmapUV_18.w = 0.0;
  mediump vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = normalWorld_4;
  mediump vec3 res_20;
  mediump vec3 x_21;
  x_21.x = dot (unity_SHAr, tmpvar_19);
  x_21.y = dot (unity_SHAg, tmpvar_19);
  x_21.z = dot (unity_SHAb, tmpvar_19);
  mediump vec3 x1_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normalWorld_4.xyzz * normalWorld_4.yzzx);
  x1_22.x = dot (unity_SHBr, tmpvar_23);
  x1_22.y = dot (unity_SHBg, tmpvar_23);
  x1_22.z = dot (unity_SHBb, tmpvar_23);
  res_20 = (x_21 + (x1_22 + (unity_SHC.xyz * 
    ((normalWorld_4.x * normalWorld_4.x) - (normalWorld_4.y * normalWorld_4.y))
  )));
  mediump vec3 tmpvar_24;
  tmpvar_24 = max (((1.055 * 
    pow (max (res_20, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_20 = tmpvar_24;
  ambientOrLightmapUV_18.xyz = max (vec3(0.0, 0.0, 0.0), tmpvar_24);
  tmpvar_7.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  mediump float x_25;
  x_25 = (1.0 - clamp (dot (normalWorld_4, 
    -(eyeVec_5)
  ), 0.0, 1.0));
  tmpvar_8.w = ((x_25 * x_25) * (x_25 * x_25));
  tmpvar_6.w = clamp ((_Glossiness + (1.0 - 
    (0.7790837 - (_Metallic * 0.7790837))
  )), 0.0, 1.0);
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = ambientOrLightmapUV_18;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 _LightShadowData;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  mediump float rl_2;
  mediump float realtimeShadowAttenuation_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  tmpvar_6 = (tmpvar_5 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_8;
  tmpvar_8 = _LightColor0.xyz;
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  realtimeShadowAttenuation_3 = tmpvar_9;
  mediump float occ_13;
  lowp float tmpvar_14;
  tmpvar_14 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_13 = tmpvar_14;
  rl_2 = dot (xlv_TEXCOORD4.yzw, _WorldSpaceLightPos0.xyz);
  mediump float occlusion_15;
  occlusion_15 = ((1.0 - _OcclusionStrength) + (occ_13 * _OcclusionStrength));
  highp vec4 tmpvar_16;
  tmpvar_16 = unity_SpecCube0_HDR;
  mediump float tmpvar_17;
  tmpvar_17 = (1.0 - _Glossiness);
  mediump vec4 hdr_18;
  hdr_18 = tmpvar_16;
  mediump vec4 tmpvar_19;
  tmpvar_19.xyz = xlv_TEXCOORD4.yzw;
  tmpvar_19.w = ((tmpvar_17 * (1.7 - 
    (0.7 * tmpvar_17)
  )) * 6.0);
  lowp vec4 tmpvar_20;
  tmpvar_20 = impl_low_textureCubeLodEXT (unity_SpecCube0, xlv_TEXCOORD4.yzw, tmpvar_19.w);
  mediump vec4 tmpvar_21;
  tmpvar_21 = tmpvar_20;
  mediump vec2 tmpvar_22;
  tmpvar_22.x = ((rl_2 * rl_2) * (rl_2 * rl_2));
  tmpvar_22.y = tmpvar_17;
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_NHxRoughness, tmpvar_22);
  c_1 = (((
    (xlv_TEXCOORD2.xyz * occlusion_15)
   * tmpvar_6) + (
    (((hdr_18.x * (
      (hdr_18.w * (tmpvar_21.w - 1.0))
     + 1.0)) * tmpvar_21.xyz) * occlusion_15)
   * 
    mix (tmpvar_7, xlv_TEXCOORD1.www, xlv_TEXCOORD5.www)
  )) + ((tmpvar_6 + 
    ((tmpvar_23.w * 16.0) * tmpvar_7)
  ) * (
    (tmpvar_8 * realtimeShadowAttenuation_3)
   * 
    clamp (dot (xlv_TEXCOORD5.xyz, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  )));
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1 = (c_1 + (tmpvar_24.xyz * _EmissionColor.xyz));
  mediump vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = c_1;
  mediump vec4 xlat_varoutput_26;
  xlat_varoutput_26.xyz = tmpvar_25.xyz;
  xlat_varoutput_26.w = 1.0;
  gl_FragData[0] = xlat_varoutput_26;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 104 math, 5 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  mediump vec3 x1_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_20.x = dot (unity_SHBr, tmpvar_21);
  x1_20.y = dot (unity_SHBg, tmpvar_21);
  x1_20.z = dot (unity_SHBb, tmpvar_21);
  ambientOrLightmapUV_19.xyz = (x1_20 + (unity_SHC.xyz * (
    (normalWorld_18.x * normalWorld_18.x)
   - 
    (normalWorld_18.y * normalWorld_18.y)
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp float atten_2;
  mediump vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  mediump float tmpvar_8;
  tmpvar_8 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_6 = (tmpvar_5 * tmpvar_8);
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_10;
  tmpvar_10 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  highp vec3 worldPos_12;
  worldPos_12 = tmpvar_3;
  mediump float realtimeShadowAttenuation_13;
  highp vec4 v_14;
  v_14.x = unity_MatrixV[0].z;
  v_14.y = unity_MatrixV[1].z;
  v_14.z = unity_MatrixV[2].z;
  v_14.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (worldPos_12 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_12), v_14.xyz), sqrt(dot (tmpvar_15, tmpvar_15)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_16 = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = worldPos_12;
  lowp float tmpvar_19;
  highp vec4 shadowCoord_20;
  shadowCoord_20 = (unity_WorldToShadow[0] * tmpvar_18);
  highp float lightShadowDataX_21;
  mediump float tmpvar_22;
  tmpvar_22 = _LightShadowData.x;
  lightShadowDataX_21 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = max (float((texture2D (_ShadowMapTexture, shadowCoord_20.xy).x > shadowCoord_20.z)), lightShadowDataX_21);
  tmpvar_19 = tmpvar_23;
  realtimeShadowAttenuation_13 = tmpvar_19;
  mediump float tmpvar_24;
  tmpvar_24 = clamp ((realtimeShadowAttenuation_13 + tmpvar_16), 0.0, 1.0);
  atten_2 = tmpvar_24;
  mediump float occ_25;
  lowp float tmpvar_26;
  tmpvar_26 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_25 = tmpvar_26;
  mediump float atten_27;
  atten_27 = atten_2;
  mediump float occlusion_28;
  occlusion_28 = ((1.0 - _OcclusionStrength) + (occ_25 * _OcclusionStrength));
  highp vec4 tmpvar_29;
  tmpvar_29 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = tmpvar_9;
  mediump vec3 x_31;
  x_31.x = dot (unity_SHAr, tmpvar_30);
  x_31.y = dot (unity_SHAg, tmpvar_30);
  x_31.z = dot (unity_SHAb, tmpvar_30);
  mediump vec3 tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = (1.0 - _Glossiness);
  tmpvar_32 = (tmpvar_10 - (2.0 * (
    dot (tmpvar_9, tmpvar_10)
   * tmpvar_9)));
  mediump vec4 hdr_34;
  hdr_34 = tmpvar_29;
  mediump vec4 tmpvar_35;
  tmpvar_35.xyz = tmpvar_32;
  tmpvar_35.w = ((tmpvar_33 * (1.7 - 
    (0.7 * tmpvar_33)
  )) * 6.0);
  lowp vec4 tmpvar_36;
  tmpvar_36 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_32, tmpvar_35.w);
  mediump vec4 tmpvar_37;
  tmpvar_37 = tmpvar_36;
  mediump vec3 viewDir_38;
  viewDir_38 = -(tmpvar_10);
  mediump float specularTerm_39;
  mediump vec3 tmpvar_40;
  mediump vec3 inVec_41;
  inVec_41 = (_WorldSpaceLightPos0.xyz + viewDir_38);
  tmpvar_40 = (inVec_41 * inversesqrt(max (0.001, 
    dot (inVec_41, inVec_41)
  )));
  mediump float tmpvar_42;
  tmpvar_42 = clamp (dot (tmpvar_9, tmpvar_40), 0.0, 1.0);
  mediump float tmpvar_43;
  tmpvar_43 = (tmpvar_33 * tmpvar_33);
  specularTerm_39 = ((tmpvar_43 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_40), 0.0, 1.0)) * (1.5 + tmpvar_43))
   * 
    (((tmpvar_42 * tmpvar_42) * ((tmpvar_43 * tmpvar_43) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_44;
  tmpvar_44 = clamp (specularTerm_39, 0.0, 100.0);
  specularTerm_39 = tmpvar_44;
  mediump float x_45;
  x_45 = (1.0 - clamp (dot (tmpvar_9, viewDir_38), 0.0, 1.0));
  mediump vec3 tmpvar_46;
  tmpvar_46 = (((
    ((tmpvar_6 + (tmpvar_44 * tmpvar_7)) * (tmpvar_11 * atten_27))
   * 
    clamp (dot (tmpvar_9, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_31)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_28)
   * tmpvar_6)) + ((
    (1.0 - ((tmpvar_43 * tmpvar_33) * 0.28))
   * 
    (((hdr_34.x * (
      (hdr_34.w * (tmpvar_37.w - 1.0))
     + 1.0)) * tmpvar_37.xyz) * occlusion_28)
  ) * mix (tmpvar_7, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_8)), 0.0, 1.0)
  ), vec3(
    ((x_45 * x_45) * (x_45 * x_45))
  ))));
  mediump vec4 tmpvar_47;
  tmpvar_47.w = 1.0;
  tmpvar_47.xyz = tmpvar_46;
  c_1.w = tmpvar_47.w;
  lowp vec4 tmpvar_48;
  tmpvar_48 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1.xyz = (tmpvar_46 + (tmpvar_48.xyz * _EmissionColor.xyz));
  mediump vec4 xlat_varoutput_49;
  xlat_varoutput_49.xyz = c_1.xyz;
  xlat_varoutput_49.w = 1.0;
  gl_FragData[0] = xlat_varoutput_49;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 104 math, 5 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  mediump vec3 x1_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_20.x = dot (unity_SHBr, tmpvar_21);
  x1_20.y = dot (unity_SHBg, tmpvar_21);
  x1_20.z = dot (unity_SHBb, tmpvar_21);
  ambientOrLightmapUV_19.xyz = (x1_20 + (unity_SHC.xyz * (
    (normalWorld_18.x * normalWorld_18.x)
   - 
    (normalWorld_18.y * normalWorld_18.y)
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp float atten_2;
  mediump vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  mediump float tmpvar_8;
  tmpvar_8 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_6 = (tmpvar_5 * tmpvar_8);
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_10;
  tmpvar_10 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  highp vec3 worldPos_12;
  worldPos_12 = tmpvar_3;
  mediump float realtimeShadowAttenuation_13;
  highp vec4 v_14;
  v_14.x = unity_MatrixV[0].z;
  v_14.y = unity_MatrixV[1].z;
  v_14.z = unity_MatrixV[2].z;
  v_14.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (worldPos_12 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_12), v_14.xyz), sqrt(dot (tmpvar_15, tmpvar_15)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_16 = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = worldPos_12;
  lowp float tmpvar_19;
  highp vec4 shadowCoord_20;
  shadowCoord_20 = (unity_WorldToShadow[0] * tmpvar_18);
  highp float lightShadowDataX_21;
  mediump float tmpvar_22;
  tmpvar_22 = _LightShadowData.x;
  lightShadowDataX_21 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = max (float((texture2D (_ShadowMapTexture, shadowCoord_20.xy).x > shadowCoord_20.z)), lightShadowDataX_21);
  tmpvar_19 = tmpvar_23;
  realtimeShadowAttenuation_13 = tmpvar_19;
  mediump float tmpvar_24;
  tmpvar_24 = clamp ((realtimeShadowAttenuation_13 + tmpvar_16), 0.0, 1.0);
  atten_2 = tmpvar_24;
  mediump float occ_25;
  lowp float tmpvar_26;
  tmpvar_26 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_25 = tmpvar_26;
  mediump float atten_27;
  atten_27 = atten_2;
  mediump float occlusion_28;
  occlusion_28 = ((1.0 - _OcclusionStrength) + (occ_25 * _OcclusionStrength));
  highp vec4 tmpvar_29;
  tmpvar_29 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = tmpvar_9;
  mediump vec3 x_31;
  x_31.x = dot (unity_SHAr, tmpvar_30);
  x_31.y = dot (unity_SHAg, tmpvar_30);
  x_31.z = dot (unity_SHAb, tmpvar_30);
  mediump vec3 tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = (1.0 - _Glossiness);
  tmpvar_32 = (tmpvar_10 - (2.0 * (
    dot (tmpvar_9, tmpvar_10)
   * tmpvar_9)));
  mediump vec4 hdr_34;
  hdr_34 = tmpvar_29;
  mediump vec4 tmpvar_35;
  tmpvar_35.xyz = tmpvar_32;
  tmpvar_35.w = ((tmpvar_33 * (1.7 - 
    (0.7 * tmpvar_33)
  )) * 6.0);
  lowp vec4 tmpvar_36;
  tmpvar_36 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_32, tmpvar_35.w);
  mediump vec4 tmpvar_37;
  tmpvar_37 = tmpvar_36;
  mediump vec3 viewDir_38;
  viewDir_38 = -(tmpvar_10);
  mediump float specularTerm_39;
  mediump vec3 tmpvar_40;
  mediump vec3 inVec_41;
  inVec_41 = (_WorldSpaceLightPos0.xyz + viewDir_38);
  tmpvar_40 = (inVec_41 * inversesqrt(max (0.001, 
    dot (inVec_41, inVec_41)
  )));
  mediump float tmpvar_42;
  tmpvar_42 = clamp (dot (tmpvar_9, tmpvar_40), 0.0, 1.0);
  mediump float tmpvar_43;
  tmpvar_43 = (tmpvar_33 * tmpvar_33);
  specularTerm_39 = ((tmpvar_43 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_40), 0.0, 1.0)) * (1.5 + tmpvar_43))
   * 
    (((tmpvar_42 * tmpvar_42) * ((tmpvar_43 * tmpvar_43) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_44;
  tmpvar_44 = clamp (specularTerm_39, 0.0, 100.0);
  specularTerm_39 = tmpvar_44;
  mediump float x_45;
  x_45 = (1.0 - clamp (dot (tmpvar_9, viewDir_38), 0.0, 1.0));
  mediump vec3 tmpvar_46;
  tmpvar_46 = (((
    ((tmpvar_6 + (tmpvar_44 * tmpvar_7)) * (tmpvar_11 * atten_27))
   * 
    clamp (dot (tmpvar_9, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_31)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_28)
   * tmpvar_6)) + ((
    (1.0 - ((tmpvar_43 * tmpvar_33) * 0.28))
   * 
    (((hdr_34.x * (
      (hdr_34.w * (tmpvar_37.w - 1.0))
     + 1.0)) * tmpvar_37.xyz) * occlusion_28)
  ) * mix (tmpvar_7, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_8)), 0.0, 1.0)
  ), vec3(
    ((x_45 * x_45) * (x_45 * x_45))
  ))));
  mediump vec4 tmpvar_47;
  tmpvar_47.w = 1.0;
  tmpvar_47.xyz = tmpvar_46;
  c_1.w = tmpvar_47.w;
  lowp vec4 tmpvar_48;
  tmpvar_48 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1.xyz = (tmpvar_46 + (tmpvar_48.xyz * _EmissionColor.xyz));
  mediump vec4 xlat_varoutput_49;
  xlat_varoutput_49.xyz = c_1.xyz;
  xlat_varoutput_49.w = 1.0;
  gl_FragData[0] = xlat_varoutput_49;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL _EMISSION VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 37 math, 5 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  normalWorld_4 = tmpvar_17;
  tmpvar_8.xyz = normalWorld_4;
  tmpvar_6.xyz = eyeVec_5;
  mediump vec4 ambientOrLightmapUV_18;
  ambientOrLightmapUV_18.w = 0.0;
  highp vec3 lightColor0_19;
  lightColor0_19 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_20;
  lightColor1_20 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_21;
  lightColor2_21 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_22;
  lightColor3_22 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_23;
  lightAttenSq_23 = unity_4LightAtten0;
  highp vec3 normal_24;
  normal_24 = normalWorld_4;
  highp vec3 col_25;
  highp vec4 ndotl_26;
  highp vec4 lengthSq_27;
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosX0 - tmpvar_9.x);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosY0 - tmpvar_9.y);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosZ0 - tmpvar_9.z);
  lengthSq_27 = (tmpvar_28 * tmpvar_28);
  lengthSq_27 = (lengthSq_27 + (tmpvar_29 * tmpvar_29));
  lengthSq_27 = (lengthSq_27 + (tmpvar_30 * tmpvar_30));
  highp vec4 tmpvar_31;
  tmpvar_31 = max (lengthSq_27, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_27 = tmpvar_31;
  ndotl_26 = (tmpvar_28 * normal_24.x);
  ndotl_26 = (ndotl_26 + (tmpvar_29 * normal_24.y));
  ndotl_26 = (ndotl_26 + (tmpvar_30 * normal_24.z));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_26 * inversesqrt(tmpvar_31)));
  ndotl_26 = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33 = (tmpvar_32 * (1.0/((1.0 + 
    (tmpvar_31 * lightAttenSq_23)
  ))));
  col_25 = (lightColor0_19 * tmpvar_33.x);
  col_25 = (col_25 + (lightColor1_20 * tmpvar_33.y));
  col_25 = (col_25 + (lightColor2_21 * tmpvar_33.z));
  col_25 = (col_25 + (lightColor3_22 * tmpvar_33.w));
  ambientOrLightmapUV_18.xyz = col_25;
  mediump vec4 tmpvar_34;
  tmpvar_34.w = 1.0;
  tmpvar_34.xyz = normalWorld_4;
  mediump vec3 res_35;
  mediump vec3 x_36;
  x_36.x = dot (unity_SHAr, tmpvar_34);
  x_36.y = dot (unity_SHAg, tmpvar_34);
  x_36.z = dot (unity_SHAb, tmpvar_34);
  mediump vec3 x1_37;
  mediump vec4 tmpvar_38;
  tmpvar_38 = (normalWorld_4.xyzz * normalWorld_4.yzzx);
  x1_37.x = dot (unity_SHBr, tmpvar_38);
  x1_37.y = dot (unity_SHBg, tmpvar_38);
  x1_37.z = dot (unity_SHBb, tmpvar_38);
  res_35 = (x_36 + (x1_37 + (unity_SHC.xyz * 
    ((normalWorld_4.x * normalWorld_4.x) - (normalWorld_4.y * normalWorld_4.y))
  )));
  mediump vec3 tmpvar_39;
  tmpvar_39 = max (((1.055 * 
    pow (max (res_35, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_35 = tmpvar_39;
  ambientOrLightmapUV_18.xyz = (ambientOrLightmapUV_18.xyz + max (vec3(0.0, 0.0, 0.0), tmpvar_39));
  tmpvar_7.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  mediump float x_40;
  x_40 = (1.0 - clamp (dot (normalWorld_4, 
    -(eyeVec_5)
  ), 0.0, 1.0));
  tmpvar_8.w = ((x_40 * x_40) * (x_40 * x_40));
  tmpvar_6.w = clamp ((_Glossiness + (1.0 - 
    (0.7790837 - (_Metallic * 0.7790837))
  )), 0.0, 1.0);
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = ambientOrLightmapUV_18;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  mediump float rl_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic));
  tmpvar_5 = (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_7;
  tmpvar_7 = _LightColor0.xyz;
  mediump float tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy);
  tmpvar_8 = tmpvar_9.y;
  rl_2 = dot (xlv_TEXCOORD4.yzw, _WorldSpaceLightPos0.xyz);
  highp vec4 tmpvar_10;
  tmpvar_10 = unity_SpecCube0_HDR;
  mediump float tmpvar_11;
  tmpvar_11 = (1.0 - _Glossiness);
  mediump vec4 hdr_12;
  hdr_12 = tmpvar_10;
  mediump vec4 tmpvar_13;
  tmpvar_13.xyz = xlv_TEXCOORD4.yzw;
  tmpvar_13.w = ((tmpvar_11 * (1.7 - 
    (0.7 * tmpvar_11)
  )) * 6.0);
  lowp vec4 tmpvar_14;
  tmpvar_14 = impl_low_textureCubeLodEXT (unity_SpecCube0, xlv_TEXCOORD4.yzw, tmpvar_13.w);
  mediump vec4 tmpvar_15;
  tmpvar_15 = tmpvar_14;
  mediump vec2 tmpvar_16;
  tmpvar_16.x = ((rl_2 * rl_2) * (rl_2 * rl_2));
  tmpvar_16.y = tmpvar_11;
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (unity_NHxRoughness, tmpvar_16);
  c_1 = (((
    (xlv_TEXCOORD2.xyz * tmpvar_8)
   * tmpvar_5) + (
    (((hdr_12.x * (
      (hdr_12.w * (tmpvar_15.w - 1.0))
     + 1.0)) * tmpvar_15.xyz) * tmpvar_8)
   * 
    mix (tmpvar_6, xlv_TEXCOORD1.www, xlv_TEXCOORD5.www)
  )) + ((tmpvar_5 + 
    ((tmpvar_17.w * 16.0) * tmpvar_6)
  ) * (tmpvar_7 * 
    clamp (dot (xlv_TEXCOORD5.xyz, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  )));
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1 = (c_1 + (tmpvar_18.xyz * _EmissionColor.xyz));
  mediump vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = c_1;
  mediump vec4 xlat_varoutput_20;
  xlat_varoutput_20.xyz = tmpvar_19.xyz;
  xlat_varoutput_20.w = 1.0;
  gl_FragData[0] = xlat_varoutput_20;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 53 math, 5 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_8.xyz - _WorldSpaceCameraPos));
  tmpvar_13 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  highp vec3 lightColor0_20;
  lightColor0_20 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_21;
  lightColor1_21 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_22;
  lightColor2_22 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_23;
  lightColor3_23 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_24;
  lightAttenSq_24 = unity_4LightAtten0;
  highp vec3 normal_25;
  normal_25 = normalWorld_18;
  highp vec3 col_26;
  highp vec4 ndotl_27;
  highp vec4 lengthSq_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_28 = (tmpvar_29 * tmpvar_29);
  lengthSq_28 = (lengthSq_28 + (tmpvar_30 * tmpvar_30));
  lengthSq_28 = (lengthSq_28 + (tmpvar_31 * tmpvar_31));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (lengthSq_28, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_28 = tmpvar_32;
  ndotl_27 = (tmpvar_29 * normal_25.x);
  ndotl_27 = (ndotl_27 + (tmpvar_30 * normal_25.y));
  ndotl_27 = (ndotl_27 + (tmpvar_31 * normal_25.z));
  highp vec4 tmpvar_33;
  tmpvar_33 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_27 * inversesqrt(tmpvar_32)));
  ndotl_27 = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34 = (tmpvar_33 * (1.0/((1.0 + 
    (tmpvar_32 * lightAttenSq_24)
  ))));
  col_26 = (lightColor0_20 * tmpvar_34.x);
  col_26 = (col_26 + (lightColor1_21 * tmpvar_34.y));
  col_26 = (col_26 + (lightColor2_22 * tmpvar_34.z));
  col_26 = (col_26 + (lightColor3_23 * tmpvar_34.w));
  ambientOrLightmapUV_19.xyz = col_26;
  mediump vec4 tmpvar_35;
  tmpvar_35.w = 1.0;
  tmpvar_35.xyz = normalWorld_18;
  mediump vec3 res_36;
  mediump vec3 x_37;
  x_37.x = dot (unity_SHAr, tmpvar_35);
  x_37.y = dot (unity_SHAg, tmpvar_35);
  x_37.z = dot (unity_SHAb, tmpvar_35);
  mediump vec3 x1_38;
  mediump vec4 tmpvar_39;
  tmpvar_39 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_38.x = dot (unity_SHBr, tmpvar_39);
  x1_38.y = dot (unity_SHBg, tmpvar_39);
  x1_38.z = dot (unity_SHBb, tmpvar_39);
  res_36 = (x_37 + (x1_38 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )));
  mediump vec3 tmpvar_40;
  tmpvar_40 = max (((1.055 * 
    pow (max (res_36, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_36 = tmpvar_40;
  ambientOrLightmapUV_19.xyz = (ambientOrLightmapUV_19.xyz + max (vec3(0.0, 0.0, 0.0), tmpvar_40));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic));
  mediump float tmpvar_6;
  tmpvar_6 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_4 = (tmpvar_3 * tmpvar_6);
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = _LightColor0.xyz;
  mediump float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy);
  tmpvar_9 = tmpvar_10.y;
  highp vec4 tmpvar_11;
  tmpvar_11 = unity_SpecCube0_HDR;
  mediump vec3 tmpvar_12;
  mediump float tmpvar_13;
  tmpvar_13 = (1.0 - _Glossiness);
  tmpvar_12 = (xlv_TEXCOORD1 - (2.0 * (
    dot (tmpvar_7, xlv_TEXCOORD1)
   * tmpvar_7)));
  mediump vec4 hdr_14;
  hdr_14 = tmpvar_11;
  mediump vec4 tmpvar_15;
  tmpvar_15.xyz = tmpvar_12;
  tmpvar_15.w = ((tmpvar_13 * (1.7 - 
    (0.7 * tmpvar_13)
  )) * 6.0);
  lowp vec4 tmpvar_16;
  tmpvar_16 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_12, tmpvar_15.w);
  mediump vec4 tmpvar_17;
  tmpvar_17 = tmpvar_16;
  mediump vec3 viewDir_18;
  viewDir_18 = -(xlv_TEXCOORD1);
  mediump vec3 color_19;
  mediump vec2 tmpvar_20;
  tmpvar_20.x = dot ((viewDir_18 - (2.0 * 
    (dot (tmpvar_7, viewDir_18) * tmpvar_7)
  )), _WorldSpaceLightPos0.xyz);
  tmpvar_20.y = (1.0 - clamp (dot (tmpvar_7, viewDir_18), 0.0, 1.0));
  mediump vec2 tmpvar_21;
  tmpvar_21 = ((tmpvar_20 * tmpvar_20) * (tmpvar_20 * tmpvar_20));
  mediump vec2 tmpvar_22;
  tmpvar_22.x = tmpvar_21.x;
  tmpvar_22.y = tmpvar_13;
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_NHxRoughness, tmpvar_22);
  color_19 = ((tmpvar_4 + (
    (tmpvar_23.w * 16.0)
   * tmpvar_5)) * (tmpvar_8 * clamp (
    dot (tmpvar_7, _WorldSpaceLightPos0.xyz)
  , 0.0, 1.0)));
  color_19 = (color_19 + ((
    (xlv_TEXCOORD5.xyz * tmpvar_9)
   * tmpvar_4) + (
    (((hdr_14.x * (
      (hdr_14.w * (tmpvar_17.w - 1.0))
     + 1.0)) * tmpvar_17.xyz) * tmpvar_9)
   * 
    mix (tmpvar_5, vec3(clamp ((_Glossiness + (1.0 - tmpvar_6)), 0.0, 1.0)), tmpvar_21.yyy)
  )));
  mediump vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = color_19;
  c_1.w = tmpvar_24.w;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1.xyz = (color_19 + (tmpvar_25.xyz * _EmissionColor.xyz));
  mediump vec4 xlat_varoutput_26;
  xlat_varoutput_26.xyz = c_1.xyz;
  xlat_varoutput_26.w = 1.0;
  gl_FragData[0] = xlat_varoutput_26;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 53 math, 5 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_8.xyz - _WorldSpaceCameraPos));
  tmpvar_13 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  highp vec3 lightColor0_20;
  lightColor0_20 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_21;
  lightColor1_21 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_22;
  lightColor2_22 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_23;
  lightColor3_23 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_24;
  lightAttenSq_24 = unity_4LightAtten0;
  highp vec3 normal_25;
  normal_25 = normalWorld_18;
  highp vec3 col_26;
  highp vec4 ndotl_27;
  highp vec4 lengthSq_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_28 = (tmpvar_29 * tmpvar_29);
  lengthSq_28 = (lengthSq_28 + (tmpvar_30 * tmpvar_30));
  lengthSq_28 = (lengthSq_28 + (tmpvar_31 * tmpvar_31));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (lengthSq_28, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_28 = tmpvar_32;
  ndotl_27 = (tmpvar_29 * normal_25.x);
  ndotl_27 = (ndotl_27 + (tmpvar_30 * normal_25.y));
  ndotl_27 = (ndotl_27 + (tmpvar_31 * normal_25.z));
  highp vec4 tmpvar_33;
  tmpvar_33 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_27 * inversesqrt(tmpvar_32)));
  ndotl_27 = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34 = (tmpvar_33 * (1.0/((1.0 + 
    (tmpvar_32 * lightAttenSq_24)
  ))));
  col_26 = (lightColor0_20 * tmpvar_34.x);
  col_26 = (col_26 + (lightColor1_21 * tmpvar_34.y));
  col_26 = (col_26 + (lightColor2_22 * tmpvar_34.z));
  col_26 = (col_26 + (lightColor3_23 * tmpvar_34.w));
  ambientOrLightmapUV_19.xyz = col_26;
  mediump vec4 tmpvar_35;
  tmpvar_35.w = 1.0;
  tmpvar_35.xyz = normalWorld_18;
  mediump vec3 res_36;
  mediump vec3 x_37;
  x_37.x = dot (unity_SHAr, tmpvar_35);
  x_37.y = dot (unity_SHAg, tmpvar_35);
  x_37.z = dot (unity_SHAb, tmpvar_35);
  mediump vec3 x1_38;
  mediump vec4 tmpvar_39;
  tmpvar_39 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_38.x = dot (unity_SHBr, tmpvar_39);
  x1_38.y = dot (unity_SHBg, tmpvar_39);
  x1_38.z = dot (unity_SHBb, tmpvar_39);
  res_36 = (x_37 + (x1_38 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )));
  mediump vec3 tmpvar_40;
  tmpvar_40 = max (((1.055 * 
    pow (max (res_36, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_36 = tmpvar_40;
  ambientOrLightmapUV_19.xyz = (ambientOrLightmapUV_19.xyz + max (vec3(0.0, 0.0, 0.0), tmpvar_40));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic));
  mediump float tmpvar_6;
  tmpvar_6 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_4 = (tmpvar_3 * tmpvar_6);
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = _LightColor0.xyz;
  mediump float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy);
  tmpvar_9 = tmpvar_10.y;
  highp vec4 tmpvar_11;
  tmpvar_11 = unity_SpecCube0_HDR;
  mediump vec3 tmpvar_12;
  mediump float tmpvar_13;
  tmpvar_13 = (1.0 - _Glossiness);
  tmpvar_12 = (xlv_TEXCOORD1 - (2.0 * (
    dot (tmpvar_7, xlv_TEXCOORD1)
   * tmpvar_7)));
  mediump vec4 hdr_14;
  hdr_14 = tmpvar_11;
  mediump vec4 tmpvar_15;
  tmpvar_15.xyz = tmpvar_12;
  tmpvar_15.w = ((tmpvar_13 * (1.7 - 
    (0.7 * tmpvar_13)
  )) * 6.0);
  lowp vec4 tmpvar_16;
  tmpvar_16 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_12, tmpvar_15.w);
  mediump vec4 tmpvar_17;
  tmpvar_17 = tmpvar_16;
  mediump vec3 viewDir_18;
  viewDir_18 = -(xlv_TEXCOORD1);
  mediump vec3 color_19;
  mediump vec2 tmpvar_20;
  tmpvar_20.x = dot ((viewDir_18 - (2.0 * 
    (dot (tmpvar_7, viewDir_18) * tmpvar_7)
  )), _WorldSpaceLightPos0.xyz);
  tmpvar_20.y = (1.0 - clamp (dot (tmpvar_7, viewDir_18), 0.0, 1.0));
  mediump vec2 tmpvar_21;
  tmpvar_21 = ((tmpvar_20 * tmpvar_20) * (tmpvar_20 * tmpvar_20));
  mediump vec2 tmpvar_22;
  tmpvar_22.x = tmpvar_21.x;
  tmpvar_22.y = tmpvar_13;
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_NHxRoughness, tmpvar_22);
  color_19 = ((tmpvar_4 + (
    (tmpvar_23.w * 16.0)
   * tmpvar_5)) * (tmpvar_8 * clamp (
    dot (tmpvar_7, _WorldSpaceLightPos0.xyz)
  , 0.0, 1.0)));
  color_19 = (color_19 + ((
    (xlv_TEXCOORD5.xyz * tmpvar_9)
   * tmpvar_4) + (
    (((hdr_14.x * (
      (hdr_14.w * (tmpvar_17.w - 1.0))
     + 1.0)) * tmpvar_17.xyz) * tmpvar_9)
   * 
    mix (tmpvar_5, vec3(clamp ((_Glossiness + (1.0 - tmpvar_6)), 0.0, 1.0)), tmpvar_21.yyy)
  )));
  mediump vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = color_19;
  c_1.w = tmpvar_24.w;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1.xyz = (color_19 + (tmpvar_25.xyz * _EmissionColor.xyz));
  mediump vec4 xlat_varoutput_26;
  xlat_varoutput_26.xyz = c_1.xyz;
  xlat_varoutput_26.w = 1.0;
  gl_FragData[0] = xlat_varoutput_26;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN _EMISSION VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 44 math, 6 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  normalWorld_4 = tmpvar_17;
  tmpvar_8.xyz = normalWorld_4;
  tmpvar_6.xyz = eyeVec_5;
  mediump vec4 ambientOrLightmapUV_18;
  ambientOrLightmapUV_18.w = 0.0;
  highp vec3 lightColor0_19;
  lightColor0_19 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_20;
  lightColor1_20 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_21;
  lightColor2_21 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_22;
  lightColor3_22 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_23;
  lightAttenSq_23 = unity_4LightAtten0;
  highp vec3 normal_24;
  normal_24 = normalWorld_4;
  highp vec3 col_25;
  highp vec4 ndotl_26;
  highp vec4 lengthSq_27;
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosX0 - tmpvar_9.x);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosY0 - tmpvar_9.y);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosZ0 - tmpvar_9.z);
  lengthSq_27 = (tmpvar_28 * tmpvar_28);
  lengthSq_27 = (lengthSq_27 + (tmpvar_29 * tmpvar_29));
  lengthSq_27 = (lengthSq_27 + (tmpvar_30 * tmpvar_30));
  highp vec4 tmpvar_31;
  tmpvar_31 = max (lengthSq_27, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_27 = tmpvar_31;
  ndotl_26 = (tmpvar_28 * normal_24.x);
  ndotl_26 = (ndotl_26 + (tmpvar_29 * normal_24.y));
  ndotl_26 = (ndotl_26 + (tmpvar_30 * normal_24.z));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_26 * inversesqrt(tmpvar_31)));
  ndotl_26 = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33 = (tmpvar_32 * (1.0/((1.0 + 
    (tmpvar_31 * lightAttenSq_23)
  ))));
  col_25 = (lightColor0_19 * tmpvar_33.x);
  col_25 = (col_25 + (lightColor1_20 * tmpvar_33.y));
  col_25 = (col_25 + (lightColor2_21 * tmpvar_33.z));
  col_25 = (col_25 + (lightColor3_22 * tmpvar_33.w));
  ambientOrLightmapUV_18.xyz = col_25;
  mediump vec4 tmpvar_34;
  tmpvar_34.w = 1.0;
  tmpvar_34.xyz = normalWorld_4;
  mediump vec3 res_35;
  mediump vec3 x_36;
  x_36.x = dot (unity_SHAr, tmpvar_34);
  x_36.y = dot (unity_SHAg, tmpvar_34);
  x_36.z = dot (unity_SHAb, tmpvar_34);
  mediump vec3 x1_37;
  mediump vec4 tmpvar_38;
  tmpvar_38 = (normalWorld_4.xyzz * normalWorld_4.yzzx);
  x1_37.x = dot (unity_SHBr, tmpvar_38);
  x1_37.y = dot (unity_SHBg, tmpvar_38);
  x1_37.z = dot (unity_SHBb, tmpvar_38);
  res_35 = (x_36 + (x1_37 + (unity_SHC.xyz * 
    ((normalWorld_4.x * normalWorld_4.x) - (normalWorld_4.y * normalWorld_4.y))
  )));
  mediump vec3 tmpvar_39;
  tmpvar_39 = max (((1.055 * 
    pow (max (res_35, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_35 = tmpvar_39;
  ambientOrLightmapUV_18.xyz = (ambientOrLightmapUV_18.xyz + max (vec3(0.0, 0.0, 0.0), tmpvar_39));
  tmpvar_7.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  mediump float x_40;
  x_40 = (1.0 - clamp (dot (normalWorld_4, 
    -(eyeVec_5)
  ), 0.0, 1.0));
  tmpvar_8.w = ((x_40 * x_40) * (x_40 * x_40));
  tmpvar_6.w = clamp ((_Glossiness + (1.0 - 
    (0.7790837 - (_Metallic * 0.7790837))
  )), 0.0, 1.0);
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_6;
  xlv_TEXCOORD2 = ambientOrLightmapUV_18;
  xlv_TEXCOORD3 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 _LightShadowData;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec4 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  mediump float rl_2;
  mediump float realtimeShadowAttenuation_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  tmpvar_6 = (tmpvar_5 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_8;
  tmpvar_8 = _LightColor0.xyz;
  lowp float tmpvar_9;
  highp float lightShadowDataX_10;
  mediump float tmpvar_11;
  tmpvar_11 = _LightShadowData.x;
  lightShadowDataX_10 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD3.xy).x > xlv_TEXCOORD3.z)), lightShadowDataX_10);
  tmpvar_9 = tmpvar_12;
  realtimeShadowAttenuation_3 = tmpvar_9;
  mediump float occ_13;
  lowp float tmpvar_14;
  tmpvar_14 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_13 = tmpvar_14;
  rl_2 = dot (xlv_TEXCOORD4.yzw, _WorldSpaceLightPos0.xyz);
  mediump float occlusion_15;
  occlusion_15 = ((1.0 - _OcclusionStrength) + (occ_13 * _OcclusionStrength));
  highp vec4 tmpvar_16;
  tmpvar_16 = unity_SpecCube0_HDR;
  mediump float tmpvar_17;
  tmpvar_17 = (1.0 - _Glossiness);
  mediump vec4 hdr_18;
  hdr_18 = tmpvar_16;
  mediump vec4 tmpvar_19;
  tmpvar_19.xyz = xlv_TEXCOORD4.yzw;
  tmpvar_19.w = ((tmpvar_17 * (1.7 - 
    (0.7 * tmpvar_17)
  )) * 6.0);
  lowp vec4 tmpvar_20;
  tmpvar_20 = impl_low_textureCubeLodEXT (unity_SpecCube0, xlv_TEXCOORD4.yzw, tmpvar_19.w);
  mediump vec4 tmpvar_21;
  tmpvar_21 = tmpvar_20;
  mediump vec2 tmpvar_22;
  tmpvar_22.x = ((rl_2 * rl_2) * (rl_2 * rl_2));
  tmpvar_22.y = tmpvar_17;
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_NHxRoughness, tmpvar_22);
  c_1 = (((
    (xlv_TEXCOORD2.xyz * occlusion_15)
   * tmpvar_6) + (
    (((hdr_18.x * (
      (hdr_18.w * (tmpvar_21.w - 1.0))
     + 1.0)) * tmpvar_21.xyz) * occlusion_15)
   * 
    mix (tmpvar_7, xlv_TEXCOORD1.www, xlv_TEXCOORD5.www)
  )) + ((tmpvar_6 + 
    ((tmpvar_23.w * 16.0) * tmpvar_7)
  ) * (
    (tmpvar_8 * realtimeShadowAttenuation_3)
   * 
    clamp (dot (xlv_TEXCOORD5.xyz, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  )));
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1 = (c_1 + (tmpvar_24.xyz * _EmissionColor.xyz));
  mediump vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = c_1;
  mediump vec4 xlat_varoutput_26;
  xlat_varoutput_26.xyz = tmpvar_25.xyz;
  xlat_varoutput_26.w = 1.0;
  gl_FragData[0] = xlat_varoutput_26;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 104 math, 5 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  highp vec3 lightColor0_20;
  lightColor0_20 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_21;
  lightColor1_21 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_22;
  lightColor2_22 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_23;
  lightColor3_23 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_24;
  lightAttenSq_24 = unity_4LightAtten0;
  highp vec3 normal_25;
  normal_25 = normalWorld_18;
  highp vec3 col_26;
  highp vec4 ndotl_27;
  highp vec4 lengthSq_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_28 = (tmpvar_29 * tmpvar_29);
  lengthSq_28 = (lengthSq_28 + (tmpvar_30 * tmpvar_30));
  lengthSq_28 = (lengthSq_28 + (tmpvar_31 * tmpvar_31));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (lengthSq_28, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_28 = tmpvar_32;
  ndotl_27 = (tmpvar_29 * normal_25.x);
  ndotl_27 = (ndotl_27 + (tmpvar_30 * normal_25.y));
  ndotl_27 = (ndotl_27 + (tmpvar_31 * normal_25.z));
  highp vec4 tmpvar_33;
  tmpvar_33 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_27 * inversesqrt(tmpvar_32)));
  ndotl_27 = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34 = (tmpvar_33 * (1.0/((1.0 + 
    (tmpvar_32 * lightAttenSq_24)
  ))));
  col_26 = (lightColor0_20 * tmpvar_34.x);
  col_26 = (col_26 + (lightColor1_21 * tmpvar_34.y));
  col_26 = (col_26 + (lightColor2_22 * tmpvar_34.z));
  col_26 = (col_26 + (lightColor3_23 * tmpvar_34.w));
  ambientOrLightmapUV_19.xyz = col_26;
  mediump vec3 x1_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_35.x = dot (unity_SHBr, tmpvar_36);
  x1_35.y = dot (unity_SHBg, tmpvar_36);
  x1_35.z = dot (unity_SHBb, tmpvar_36);
  ambientOrLightmapUV_19.xyz = ((ambientOrLightmapUV_19.xyz * (
    (ambientOrLightmapUV_19.xyz * ((ambientOrLightmapUV_19.xyz * 0.305306) + 0.6821711))
   + 0.01252288)) + (x1_35 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp float atten_2;
  mediump vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  mediump float tmpvar_8;
  tmpvar_8 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_6 = (tmpvar_5 * tmpvar_8);
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_10;
  tmpvar_10 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  highp vec3 worldPos_12;
  worldPos_12 = tmpvar_3;
  mediump float realtimeShadowAttenuation_13;
  highp vec4 v_14;
  v_14.x = unity_MatrixV[0].z;
  v_14.y = unity_MatrixV[1].z;
  v_14.z = unity_MatrixV[2].z;
  v_14.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (worldPos_12 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_12), v_14.xyz), sqrt(dot (tmpvar_15, tmpvar_15)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_16 = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = worldPos_12;
  lowp float tmpvar_19;
  highp vec4 shadowCoord_20;
  shadowCoord_20 = (unity_WorldToShadow[0] * tmpvar_18);
  highp float lightShadowDataX_21;
  mediump float tmpvar_22;
  tmpvar_22 = _LightShadowData.x;
  lightShadowDataX_21 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = max (float((texture2D (_ShadowMapTexture, shadowCoord_20.xy).x > shadowCoord_20.z)), lightShadowDataX_21);
  tmpvar_19 = tmpvar_23;
  realtimeShadowAttenuation_13 = tmpvar_19;
  mediump float tmpvar_24;
  tmpvar_24 = clamp ((realtimeShadowAttenuation_13 + tmpvar_16), 0.0, 1.0);
  atten_2 = tmpvar_24;
  mediump float occ_25;
  lowp float tmpvar_26;
  tmpvar_26 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_25 = tmpvar_26;
  mediump float atten_27;
  atten_27 = atten_2;
  mediump float occlusion_28;
  occlusion_28 = ((1.0 - _OcclusionStrength) + (occ_25 * _OcclusionStrength));
  highp vec4 tmpvar_29;
  tmpvar_29 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = tmpvar_9;
  mediump vec3 x_31;
  x_31.x = dot (unity_SHAr, tmpvar_30);
  x_31.y = dot (unity_SHAg, tmpvar_30);
  x_31.z = dot (unity_SHAb, tmpvar_30);
  mediump vec3 tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = (1.0 - _Glossiness);
  tmpvar_32 = (tmpvar_10 - (2.0 * (
    dot (tmpvar_9, tmpvar_10)
   * tmpvar_9)));
  mediump vec4 hdr_34;
  hdr_34 = tmpvar_29;
  mediump vec4 tmpvar_35;
  tmpvar_35.xyz = tmpvar_32;
  tmpvar_35.w = ((tmpvar_33 * (1.7 - 
    (0.7 * tmpvar_33)
  )) * 6.0);
  lowp vec4 tmpvar_36;
  tmpvar_36 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_32, tmpvar_35.w);
  mediump vec4 tmpvar_37;
  tmpvar_37 = tmpvar_36;
  mediump vec3 viewDir_38;
  viewDir_38 = -(tmpvar_10);
  mediump float specularTerm_39;
  mediump vec3 tmpvar_40;
  mediump vec3 inVec_41;
  inVec_41 = (_WorldSpaceLightPos0.xyz + viewDir_38);
  tmpvar_40 = (inVec_41 * inversesqrt(max (0.001, 
    dot (inVec_41, inVec_41)
  )));
  mediump float tmpvar_42;
  tmpvar_42 = clamp (dot (tmpvar_9, tmpvar_40), 0.0, 1.0);
  mediump float tmpvar_43;
  tmpvar_43 = (tmpvar_33 * tmpvar_33);
  specularTerm_39 = ((tmpvar_43 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_40), 0.0, 1.0)) * (1.5 + tmpvar_43))
   * 
    (((tmpvar_42 * tmpvar_42) * ((tmpvar_43 * tmpvar_43) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_44;
  tmpvar_44 = clamp (specularTerm_39, 0.0, 100.0);
  specularTerm_39 = tmpvar_44;
  mediump float x_45;
  x_45 = (1.0 - clamp (dot (tmpvar_9, viewDir_38), 0.0, 1.0));
  mediump vec3 tmpvar_46;
  tmpvar_46 = (((
    ((tmpvar_6 + (tmpvar_44 * tmpvar_7)) * (tmpvar_11 * atten_27))
   * 
    clamp (dot (tmpvar_9, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_31)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_28)
   * tmpvar_6)) + ((
    (1.0 - ((tmpvar_43 * tmpvar_33) * 0.28))
   * 
    (((hdr_34.x * (
      (hdr_34.w * (tmpvar_37.w - 1.0))
     + 1.0)) * tmpvar_37.xyz) * occlusion_28)
  ) * mix (tmpvar_7, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_8)), 0.0, 1.0)
  ), vec3(
    ((x_45 * x_45) * (x_45 * x_45))
  ))));
  mediump vec4 tmpvar_47;
  tmpvar_47.w = 1.0;
  tmpvar_47.xyz = tmpvar_46;
  c_1.w = tmpvar_47.w;
  lowp vec4 tmpvar_48;
  tmpvar_48 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1.xyz = (tmpvar_46 + (tmpvar_48.xyz * _EmissionColor.xyz));
  mediump vec4 xlat_varoutput_49;
  xlat_varoutput_49.xyz = c_1.xyz;
  xlat_varoutput_49.w = 1.0;
  gl_FragData[0] = xlat_varoutput_49;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 104 math, 5 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4.w = tmpvar_8.x;
  tmpvar_5.w = tmpvar_8.y;
  tmpvar_6.w = tmpvar_8.z;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  highp vec3 lightColor0_20;
  lightColor0_20 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_21;
  lightColor1_21 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_22;
  lightColor2_22 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_23;
  lightColor3_23 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_24;
  lightAttenSq_24 = unity_4LightAtten0;
  highp vec3 normal_25;
  normal_25 = normalWorld_18;
  highp vec3 col_26;
  highp vec4 ndotl_27;
  highp vec4 lengthSq_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_28 = (tmpvar_29 * tmpvar_29);
  lengthSq_28 = (lengthSq_28 + (tmpvar_30 * tmpvar_30));
  lengthSq_28 = (lengthSq_28 + (tmpvar_31 * tmpvar_31));
  highp vec4 tmpvar_32;
  tmpvar_32 = max (lengthSq_28, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_28 = tmpvar_32;
  ndotl_27 = (tmpvar_29 * normal_25.x);
  ndotl_27 = (ndotl_27 + (tmpvar_30 * normal_25.y));
  ndotl_27 = (ndotl_27 + (tmpvar_31 * normal_25.z));
  highp vec4 tmpvar_33;
  tmpvar_33 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_27 * inversesqrt(tmpvar_32)));
  ndotl_27 = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34 = (tmpvar_33 * (1.0/((1.0 + 
    (tmpvar_32 * lightAttenSq_24)
  ))));
  col_26 = (lightColor0_20 * tmpvar_34.x);
  col_26 = (col_26 + (lightColor1_21 * tmpvar_34.y));
  col_26 = (col_26 + (lightColor2_22 * tmpvar_34.z));
  col_26 = (col_26 + (lightColor3_23 * tmpvar_34.w));
  ambientOrLightmapUV_19.xyz = col_26;
  mediump vec3 x1_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_35.x = dot (unity_SHBr, tmpvar_36);
  x1_35.y = dot (unity_SHBg, tmpvar_36);
  x1_35.z = dot (unity_SHBb, tmpvar_36);
  ambientOrLightmapUV_19.xyz = ((ambientOrLightmapUV_19.xyz * (
    (ambientOrLightmapUV_19.xyz * ((ambientOrLightmapUV_19.xyz * 0.305306) + 0.6821711))
   + 0.01252288)) + (x1_35 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )));
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform mediump float _OcclusionStrength;
uniform mediump vec4 _EmissionColor;
uniform sampler2D _EmissionMap;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp float atten_2;
  mediump vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  mediump float tmpvar_8;
  tmpvar_8 = (0.7790837 - (_Metallic * 0.7790837));
  tmpvar_6 = (tmpvar_5 * tmpvar_8);
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_10;
  tmpvar_10 = normalize(xlv_TEXCOORD1);
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  highp vec3 worldPos_12;
  worldPos_12 = tmpvar_3;
  mediump float realtimeShadowAttenuation_13;
  highp vec4 v_14;
  v_14.x = unity_MatrixV[0].z;
  v_14.y = unity_MatrixV[1].z;
  v_14.z = unity_MatrixV[2].z;
  v_14.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (worldPos_12 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_12), v_14.xyz), sqrt(dot (tmpvar_15, tmpvar_15)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_16 = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = worldPos_12;
  lowp float tmpvar_19;
  highp vec4 shadowCoord_20;
  shadowCoord_20 = (unity_WorldToShadow[0] * tmpvar_18);
  highp float lightShadowDataX_21;
  mediump float tmpvar_22;
  tmpvar_22 = _LightShadowData.x;
  lightShadowDataX_21 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = max (float((texture2D (_ShadowMapTexture, shadowCoord_20.xy).x > shadowCoord_20.z)), lightShadowDataX_21);
  tmpvar_19 = tmpvar_23;
  realtimeShadowAttenuation_13 = tmpvar_19;
  mediump float tmpvar_24;
  tmpvar_24 = clamp ((realtimeShadowAttenuation_13 + tmpvar_16), 0.0, 1.0);
  atten_2 = tmpvar_24;
  mediump float occ_25;
  lowp float tmpvar_26;
  tmpvar_26 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  occ_25 = tmpvar_26;
  mediump float atten_27;
  atten_27 = atten_2;
  mediump float occlusion_28;
  occlusion_28 = ((1.0 - _OcclusionStrength) + (occ_25 * _OcclusionStrength));
  highp vec4 tmpvar_29;
  tmpvar_29 = unity_SpecCube0_HDR;
  mediump vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = tmpvar_9;
  mediump vec3 x_31;
  x_31.x = dot (unity_SHAr, tmpvar_30);
  x_31.y = dot (unity_SHAg, tmpvar_30);
  x_31.z = dot (unity_SHAb, tmpvar_30);
  mediump vec3 tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = (1.0 - _Glossiness);
  tmpvar_32 = (tmpvar_10 - (2.0 * (
    dot (tmpvar_9, tmpvar_10)
   * tmpvar_9)));
  mediump vec4 hdr_34;
  hdr_34 = tmpvar_29;
  mediump vec4 tmpvar_35;
  tmpvar_35.xyz = tmpvar_32;
  tmpvar_35.w = ((tmpvar_33 * (1.7 - 
    (0.7 * tmpvar_33)
  )) * 6.0);
  lowp vec4 tmpvar_36;
  tmpvar_36 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_32, tmpvar_35.w);
  mediump vec4 tmpvar_37;
  tmpvar_37 = tmpvar_36;
  mediump vec3 viewDir_38;
  viewDir_38 = -(tmpvar_10);
  mediump float specularTerm_39;
  mediump vec3 tmpvar_40;
  mediump vec3 inVec_41;
  inVec_41 = (_WorldSpaceLightPos0.xyz + viewDir_38);
  tmpvar_40 = (inVec_41 * inversesqrt(max (0.001, 
    dot (inVec_41, inVec_41)
  )));
  mediump float tmpvar_42;
  tmpvar_42 = clamp (dot (tmpvar_9, tmpvar_40), 0.0, 1.0);
  mediump float tmpvar_43;
  tmpvar_43 = (tmpvar_33 * tmpvar_33);
  specularTerm_39 = ((tmpvar_43 / (
    (max (0.32, clamp (dot (_WorldSpaceLightPos0.xyz, tmpvar_40), 0.0, 1.0)) * (1.5 + tmpvar_43))
   * 
    (((tmpvar_42 * tmpvar_42) * ((tmpvar_43 * tmpvar_43) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_44;
  tmpvar_44 = clamp (specularTerm_39, 0.0, 100.0);
  specularTerm_39 = tmpvar_44;
  mediump float x_45;
  x_45 = (1.0 - clamp (dot (tmpvar_9, viewDir_38), 0.0, 1.0));
  mediump vec3 tmpvar_46;
  tmpvar_46 = (((
    ((tmpvar_6 + (tmpvar_44 * tmpvar_7)) * (tmpvar_11 * atten_27))
   * 
    clamp (dot (tmpvar_9, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (max (((1.055 * 
      pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_31)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0)) * occlusion_28)
   * tmpvar_6)) + ((
    (1.0 - ((tmpvar_43 * tmpvar_33) * 0.28))
   * 
    (((hdr_34.x * (
      (hdr_34.w * (tmpvar_37.w - 1.0))
     + 1.0)) * tmpvar_37.xyz) * occlusion_28)
  ) * mix (tmpvar_7, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_8)), 0.0, 1.0)
  ), vec3(
    ((x_45 * x_45) * (x_45 * x_45))
  ))));
  mediump vec4 tmpvar_47;
  tmpvar_47.w = 1.0;
  tmpvar_47.xyz = tmpvar_46;
  c_1.w = tmpvar_47.w;
  lowp vec4 tmpvar_48;
  tmpvar_48 = texture2D (_EmissionMap, xlv_TEXCOORD0.xy);
  c_1.xyz = (tmpvar_46 + (tmpvar_48.xyz * _EmissionColor.xyz));
  mediump vec4 xlat_varoutput_49;
  xlat_varoutput_49.xyz = c_1.xyz;
  xlat_varoutput_49.w = 1.0;
  gl_FragData[0] = xlat_varoutput_49;
}


#endif


-- Fragment shader for "gles":
// No shader variant for this keyword set. The closest match will be used instead.

 }


 // Stats for Vertex shader:
 //         gles: 34 avg math (19..58), 3 avg texture (2..5), 0 avg branch (0..1)
 Pass {
  Name "FORWARD_DELTA"
  Tags { "LIGHTMODE"="FORWARDADD" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite Off
  Blend [_SrcBlend] One
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords set in this variant: POINT 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 19 math, 2 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  lightDir_6 = tmpvar_14;
  mediump vec3 tmpvar_15;
  highp vec3 n_16;
  n_16 = lightDir_6;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(n_16);
  tmpvar_15 = tmpvar_17;
  lightDir_6 = tmpvar_15;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_18;
  highp vec3 norm_19;
  norm_19 = tmpvar_1;
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((norm_19 * tmpvar_20));
  normalWorld_4 = tmpvar_21;
  tmpvar_8.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = tmpvar_15;
  xlv_TEXCOORD5 = normalWorld_4;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump float tmpvar_4;
  tmpvar_4 = dot (xlv_TEXCOORD3.yzw, xlv_TEXCOORD4);
  mediump vec2 tmpvar_5;
  tmpvar_5.x = ((tmpvar_4 * tmpvar_4) * (tmpvar_4 * tmpvar_4));
  tmpvar_5.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_NHxRoughness, tmpvar_5);
  c_1 = (((tmpvar_3 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_6.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic))
  )) * _LightColor0.xyz);
  c_1 = (c_1 * clamp (dot (xlv_TEXCOORD5, xlv_TEXCOORD4), 0.0, 1.0));
  mediump vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = c_1;
  mediump vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 32 math, 3 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  tmpvar_14 = tmpvar_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  mediump vec3 tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_19 = tmpvar_20;
  lightDir_4 = tmpvar_19;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec3 lightCoord_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = i_posWorld_2;
  lightCoord_1 = (unity_WorldToLight * tmpvar_6).xyz;
  highp float tmpvar_7;
  tmpvar_7 = dot (lightCoord_1, lightCoord_1);
  lowp float tmpvar_8;
  tmpvar_8 = texture2D (_LightTexture0, vec2(tmpvar_7)).w;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = xlv_TEXCOORD2.w;
  tmpvar_9.y = xlv_TEXCOORD2_1.w;
  tmpvar_9.z = xlv_TEXCOORD2_2.w;
  mediump float atten_10;
  atten_10 = tmpvar_8;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  tmpvar_11 = (tmpvar_11 * atten_10);
  mediump vec3 viewDir_12;
  viewDir_12 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_13;
  tmpvar_13.x = dot ((viewDir_12 - (2.0 * 
    (dot (tmpvar_5, viewDir_12) * tmpvar_5)
  )), tmpvar_9);
  tmpvar_13.y = (1.0 - clamp (dot (tmpvar_5, viewDir_12), 0.0, 1.0));
  mediump vec2 tmpvar_14;
  tmpvar_14.x = ((tmpvar_13 * tmpvar_13) * (tmpvar_13 * tmpvar_13)).x;
  tmpvar_14.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (unity_NHxRoughness, tmpvar_14);
  mediump vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = (((tmpvar_4 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_15.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic))
  )) * (tmpvar_11 * clamp (
    dot (tmpvar_5, tmpvar_9)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_17;
  xlat_varoutput_17.xyz = tmpvar_16.xyz;
  xlat_varoutput_17.w = 1.0;
  gl_FragData[0] = xlat_varoutput_17;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 32 math, 3 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  tmpvar_14 = tmpvar_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  mediump vec3 tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_19 = tmpvar_20;
  lightDir_4 = tmpvar_19;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec3 lightCoord_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = i_posWorld_2;
  lightCoord_1 = (unity_WorldToLight * tmpvar_6).xyz;
  highp float tmpvar_7;
  tmpvar_7 = dot (lightCoord_1, lightCoord_1);
  lowp float tmpvar_8;
  tmpvar_8 = texture2D (_LightTexture0, vec2(tmpvar_7)).w;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = xlv_TEXCOORD2.w;
  tmpvar_9.y = xlv_TEXCOORD2_1.w;
  tmpvar_9.z = xlv_TEXCOORD2_2.w;
  mediump float atten_10;
  atten_10 = tmpvar_8;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  tmpvar_11 = (tmpvar_11 * atten_10);
  mediump vec3 viewDir_12;
  viewDir_12 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_13;
  tmpvar_13.x = dot ((viewDir_12 - (2.0 * 
    (dot (tmpvar_5, viewDir_12) * tmpvar_5)
  )), tmpvar_9);
  tmpvar_13.y = (1.0 - clamp (dot (tmpvar_5, viewDir_12), 0.0, 1.0));
  mediump vec2 tmpvar_14;
  tmpvar_14.x = ((tmpvar_13 * tmpvar_13) * (tmpvar_13 * tmpvar_13)).x;
  tmpvar_14.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (unity_NHxRoughness, tmpvar_14);
  mediump vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = (((tmpvar_4 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_15.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic))
  )) * (tmpvar_11 * clamp (
    dot (tmpvar_5, tmpvar_9)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_17;
  xlat_varoutput_17.xyz = tmpvar_16.xyz;
  xlat_varoutput_17.w = 1.0;
  gl_FragData[0] = xlat_varoutput_17;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 19 math, 2 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  lightDir_6 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  normalWorld_4 = tmpvar_18;
  tmpvar_8.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = lightDir_6;
  xlv_TEXCOORD5 = normalWorld_4;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump float tmpvar_4;
  tmpvar_4 = dot (xlv_TEXCOORD3.yzw, xlv_TEXCOORD4);
  mediump vec2 tmpvar_5;
  tmpvar_5.x = ((tmpvar_4 * tmpvar_4) * (tmpvar_4 * tmpvar_4));
  tmpvar_5.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_NHxRoughness, tmpvar_5);
  c_1 = (((tmpvar_3 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_6.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic))
  )) * _LightColor0.xyz);
  c_1 = (c_1 * clamp (dot (xlv_TEXCOORD5, xlv_TEXCOORD4), 0.0, 1.0));
  mediump vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = c_1;
  mediump vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 28 math, 2 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_8.xyz - _WorldSpaceCameraPos));
  tmpvar_13 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (_WorldSpaceLightPos0.xyz - (tmpvar_8.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_18.x;
  tmpvar_5.w = tmpvar_18.y;
  tmpvar_6.w = tmpvar_18.z;
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_8.xyz;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * tmpvar_1.xyz);
  mediump vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_4;
  tmpvar_4.x = xlv_TEXCOORD2.w;
  tmpvar_4.y = xlv_TEXCOORD2_1.w;
  tmpvar_4.z = xlv_TEXCOORD2_2.w;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _LightColor0.xyz;
  mediump vec3 viewDir_6;
  viewDir_6 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_7;
  tmpvar_7.x = dot ((viewDir_6 - (2.0 * 
    (dot (tmpvar_3, viewDir_6) * tmpvar_3)
  )), tmpvar_4);
  tmpvar_7.y = (1.0 - clamp (dot (tmpvar_3, viewDir_6), 0.0, 1.0));
  mediump vec2 tmpvar_8;
  tmpvar_8.x = ((tmpvar_7 * tmpvar_7) * (tmpvar_7 * tmpvar_7)).x;
  tmpvar_8.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_NHxRoughness, tmpvar_8);
  mediump vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = (((tmpvar_2 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_9.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_2, vec3(_Metallic))
  )) * (tmpvar_5 * clamp (
    dot (tmpvar_3, tmpvar_4)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_11;
  xlat_varoutput_11.xyz = tmpvar_10.xyz;
  xlat_varoutput_11.w = 1.0;
  gl_FragData[0] = xlat_varoutput_11;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 28 math, 2 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_8.xyz - _WorldSpaceCameraPos));
  tmpvar_13 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (_WorldSpaceLightPos0.xyz - (tmpvar_8.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_18.x;
  tmpvar_5.w = tmpvar_18.y;
  tmpvar_6.w = tmpvar_18.z;
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_8.xyz;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * tmpvar_1.xyz);
  mediump vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_4;
  tmpvar_4.x = xlv_TEXCOORD2.w;
  tmpvar_4.y = xlv_TEXCOORD2_1.w;
  tmpvar_4.z = xlv_TEXCOORD2_2.w;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _LightColor0.xyz;
  mediump vec3 viewDir_6;
  viewDir_6 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_7;
  tmpvar_7.x = dot ((viewDir_6 - (2.0 * 
    (dot (tmpvar_3, viewDir_6) * tmpvar_3)
  )), tmpvar_4);
  tmpvar_7.y = (1.0 - clamp (dot (tmpvar_3, viewDir_6), 0.0, 1.0));
  mediump vec2 tmpvar_8;
  tmpvar_8.x = ((tmpvar_7 * tmpvar_7) * (tmpvar_7 * tmpvar_7)).x;
  tmpvar_8.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_NHxRoughness, tmpvar_8);
  mediump vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = (((tmpvar_2 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_9.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_2, vec3(_Metallic))
  )) * (tmpvar_5 * clamp (
    dot (tmpvar_3, tmpvar_4)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_11;
  xlat_varoutput_11.xyz = tmpvar_10.xyz;
  xlat_varoutput_11.w = 1.0;
  gl_FragData[0] = xlat_varoutput_11;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 19 math, 2 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  lightDir_6 = tmpvar_14;
  mediump vec3 tmpvar_15;
  highp vec3 n_16;
  n_16 = lightDir_6;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(n_16);
  tmpvar_15 = tmpvar_17;
  lightDir_6 = tmpvar_15;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_18;
  highp vec3 norm_19;
  norm_19 = tmpvar_1;
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((norm_19 * tmpvar_20));
  normalWorld_4 = tmpvar_21;
  tmpvar_8.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = tmpvar_15;
  xlv_TEXCOORD5 = normalWorld_4;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump float tmpvar_4;
  tmpvar_4 = dot (xlv_TEXCOORD3.yzw, xlv_TEXCOORD4);
  mediump vec2 tmpvar_5;
  tmpvar_5.x = ((tmpvar_4 * tmpvar_4) * (tmpvar_4 * tmpvar_4));
  tmpvar_5.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_NHxRoughness, tmpvar_5);
  c_1 = (((tmpvar_3 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_6.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic))
  )) * _LightColor0.xyz);
  c_1 = (c_1 * clamp (dot (xlv_TEXCOORD5, xlv_TEXCOORD4), 0.0, 1.0));
  mediump vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = c_1;
  mediump vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 38 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  tmpvar_14 = tmpvar_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  mediump vec3 tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_19 = tmpvar_20;
  lightDir_4 = tmpvar_19;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float atten_1;
  highp vec4 lightCoord_2;
  mediump vec3 i_posWorld_3;
  i_posWorld_3 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = i_posWorld_3;
  lightCoord_2 = (unity_WorldToLight * tmpvar_7);
  lowp vec4 tmpvar_8;
  highp vec2 P_9;
  P_9 = ((lightCoord_2.xy / lightCoord_2.w) + 0.5);
  tmpvar_8 = texture2D (_LightTexture0, P_9);
  highp float tmpvar_10;
  tmpvar_10 = dot (lightCoord_2.xyz, lightCoord_2.xyz);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_LightTextureB0, vec2(tmpvar_10));
  highp float tmpvar_12;
  tmpvar_12 = ((float(
    (lightCoord_2.z > 0.0)
  ) * tmpvar_8.w) * tmpvar_11.w);
  atten_1 = tmpvar_12;
  mediump vec3 tmpvar_13;
  tmpvar_13.x = xlv_TEXCOORD2.w;
  tmpvar_13.y = xlv_TEXCOORD2_1.w;
  tmpvar_13.z = xlv_TEXCOORD2_2.w;
  mediump float atten_14;
  atten_14 = atten_1;
  mediump vec3 tmpvar_15;
  tmpvar_15 = _LightColor0.xyz;
  tmpvar_15 = (tmpvar_15 * atten_14);
  mediump vec3 viewDir_16;
  viewDir_16 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_17;
  tmpvar_17.x = dot ((viewDir_16 - (2.0 * 
    (dot (tmpvar_6, viewDir_16) * tmpvar_6)
  )), tmpvar_13);
  tmpvar_17.y = (1.0 - clamp (dot (tmpvar_6, viewDir_16), 0.0, 1.0));
  mediump vec2 tmpvar_18;
  tmpvar_18.x = ((tmpvar_17 * tmpvar_17) * (tmpvar_17 * tmpvar_17)).x;
  tmpvar_18.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture2D (unity_NHxRoughness, tmpvar_18);
  mediump vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = (((tmpvar_5 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_19.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic))
  )) * (tmpvar_15 * clamp (
    dot (tmpvar_6, tmpvar_13)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_21;
  xlat_varoutput_21.xyz = tmpvar_20.xyz;
  xlat_varoutput_21.w = 1.0;
  gl_FragData[0] = xlat_varoutput_21;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 38 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  tmpvar_14 = tmpvar_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  mediump vec3 tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_19 = tmpvar_20;
  lightDir_4 = tmpvar_19;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float atten_1;
  highp vec4 lightCoord_2;
  mediump vec3 i_posWorld_3;
  i_posWorld_3 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = i_posWorld_3;
  lightCoord_2 = (unity_WorldToLight * tmpvar_7);
  lowp vec4 tmpvar_8;
  highp vec2 P_9;
  P_9 = ((lightCoord_2.xy / lightCoord_2.w) + 0.5);
  tmpvar_8 = texture2D (_LightTexture0, P_9);
  highp float tmpvar_10;
  tmpvar_10 = dot (lightCoord_2.xyz, lightCoord_2.xyz);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_LightTextureB0, vec2(tmpvar_10));
  highp float tmpvar_12;
  tmpvar_12 = ((float(
    (lightCoord_2.z > 0.0)
  ) * tmpvar_8.w) * tmpvar_11.w);
  atten_1 = tmpvar_12;
  mediump vec3 tmpvar_13;
  tmpvar_13.x = xlv_TEXCOORD2.w;
  tmpvar_13.y = xlv_TEXCOORD2_1.w;
  tmpvar_13.z = xlv_TEXCOORD2_2.w;
  mediump float atten_14;
  atten_14 = atten_1;
  mediump vec3 tmpvar_15;
  tmpvar_15 = _LightColor0.xyz;
  tmpvar_15 = (tmpvar_15 * atten_14);
  mediump vec3 viewDir_16;
  viewDir_16 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_17;
  tmpvar_17.x = dot ((viewDir_16 - (2.0 * 
    (dot (tmpvar_6, viewDir_16) * tmpvar_6)
  )), tmpvar_13);
  tmpvar_17.y = (1.0 - clamp (dot (tmpvar_6, viewDir_16), 0.0, 1.0));
  mediump vec2 tmpvar_18;
  tmpvar_18.x = ((tmpvar_17 * tmpvar_17) * (tmpvar_17 * tmpvar_17)).x;
  tmpvar_18.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture2D (unity_NHxRoughness, tmpvar_18);
  mediump vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = (((tmpvar_5 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_19.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic))
  )) * (tmpvar_15 * clamp (
    dot (tmpvar_6, tmpvar_13)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_21;
  xlat_varoutput_21.xyz = tmpvar_20.xyz;
  xlat_varoutput_21.w = 1.0;
  gl_FragData[0] = xlat_varoutput_21;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: POINT_COOKIE 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 19 math, 2 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  lightDir_6 = tmpvar_14;
  mediump vec3 tmpvar_15;
  highp vec3 n_16;
  n_16 = lightDir_6;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(n_16);
  tmpvar_15 = tmpvar_17;
  lightDir_6 = tmpvar_15;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_18;
  highp vec3 norm_19;
  norm_19 = tmpvar_1;
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((norm_19 * tmpvar_20));
  normalWorld_4 = tmpvar_21;
  tmpvar_8.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = tmpvar_15;
  xlv_TEXCOORD5 = normalWorld_4;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump float tmpvar_4;
  tmpvar_4 = dot (xlv_TEXCOORD3.yzw, xlv_TEXCOORD4);
  mediump vec2 tmpvar_5;
  tmpvar_5.x = ((tmpvar_4 * tmpvar_4) * (tmpvar_4 * tmpvar_4));
  tmpvar_5.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_NHxRoughness, tmpvar_5);
  c_1 = (((tmpvar_3 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_6.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic))
  )) * _LightColor0.xyz);
  c_1 = (c_1 * clamp (dot (xlv_TEXCOORD5, xlv_TEXCOORD4), 0.0, 1.0));
  mediump vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = c_1;
  mediump vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 33 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  tmpvar_14 = tmpvar_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  mediump vec3 tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_19 = tmpvar_20;
  lightDir_4 = tmpvar_19;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform lowp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec3 lightCoord_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = i_posWorld_2;
  lightCoord_1 = (unity_WorldToLight * tmpvar_6).xyz;
  highp float tmpvar_7;
  tmpvar_7 = dot (lightCoord_1, lightCoord_1);
  lowp float tmpvar_8;
  tmpvar_8 = (texture2D (_LightTextureB0, vec2(tmpvar_7)).w * textureCube (_LightTexture0, lightCoord_1).w);
  mediump vec3 tmpvar_9;
  tmpvar_9.x = xlv_TEXCOORD2.w;
  tmpvar_9.y = xlv_TEXCOORD2_1.w;
  tmpvar_9.z = xlv_TEXCOORD2_2.w;
  mediump float atten_10;
  atten_10 = tmpvar_8;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  tmpvar_11 = (tmpvar_11 * atten_10);
  mediump vec3 viewDir_12;
  viewDir_12 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_13;
  tmpvar_13.x = dot ((viewDir_12 - (2.0 * 
    (dot (tmpvar_5, viewDir_12) * tmpvar_5)
  )), tmpvar_9);
  tmpvar_13.y = (1.0 - clamp (dot (tmpvar_5, viewDir_12), 0.0, 1.0));
  mediump vec2 tmpvar_14;
  tmpvar_14.x = ((tmpvar_13 * tmpvar_13) * (tmpvar_13 * tmpvar_13)).x;
  tmpvar_14.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (unity_NHxRoughness, tmpvar_14);
  mediump vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = (((tmpvar_4 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_15.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic))
  )) * (tmpvar_11 * clamp (
    dot (tmpvar_5, tmpvar_9)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_17;
  xlat_varoutput_17.xyz = tmpvar_16.xyz;
  xlat_varoutput_17.w = 1.0;
  gl_FragData[0] = xlat_varoutput_17;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 33 math, 4 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  tmpvar_14 = tmpvar_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  mediump vec3 tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_19 = tmpvar_20;
  lightDir_4 = tmpvar_19;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform lowp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec3 lightCoord_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = i_posWorld_2;
  lightCoord_1 = (unity_WorldToLight * tmpvar_6).xyz;
  highp float tmpvar_7;
  tmpvar_7 = dot (lightCoord_1, lightCoord_1);
  lowp float tmpvar_8;
  tmpvar_8 = (texture2D (_LightTextureB0, vec2(tmpvar_7)).w * textureCube (_LightTexture0, lightCoord_1).w);
  mediump vec3 tmpvar_9;
  tmpvar_9.x = xlv_TEXCOORD2.w;
  tmpvar_9.y = xlv_TEXCOORD2_1.w;
  tmpvar_9.z = xlv_TEXCOORD2_2.w;
  mediump float atten_10;
  atten_10 = tmpvar_8;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _LightColor0.xyz;
  tmpvar_11 = (tmpvar_11 * atten_10);
  mediump vec3 viewDir_12;
  viewDir_12 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_13;
  tmpvar_13.x = dot ((viewDir_12 - (2.0 * 
    (dot (tmpvar_5, viewDir_12) * tmpvar_5)
  )), tmpvar_9);
  tmpvar_13.y = (1.0 - clamp (dot (tmpvar_5, viewDir_12), 0.0, 1.0));
  mediump vec2 tmpvar_14;
  tmpvar_14.x = ((tmpvar_13 * tmpvar_13) * (tmpvar_13 * tmpvar_13)).x;
  tmpvar_14.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (unity_NHxRoughness, tmpvar_14);
  mediump vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = (((tmpvar_4 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_15.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic))
  )) * (tmpvar_11 * clamp (
    dot (tmpvar_5, tmpvar_9)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_17;
  xlat_varoutput_17.xyz = tmpvar_16.xyz;
  xlat_varoutput_17.w = 1.0;
  gl_FragData[0] = xlat_varoutput_17;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 19 math, 2 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  lightDir_6 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  normalWorld_4 = tmpvar_18;
  tmpvar_8.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = lightDir_6;
  xlv_TEXCOORD5 = normalWorld_4;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump float tmpvar_4;
  tmpvar_4 = dot (xlv_TEXCOORD3.yzw, xlv_TEXCOORD4);
  mediump vec2 tmpvar_5;
  tmpvar_5.x = ((tmpvar_4 * tmpvar_4) * (tmpvar_4 * tmpvar_4));
  tmpvar_5.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (unity_NHxRoughness, tmpvar_5);
  c_1 = (((tmpvar_3 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_6.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_3, vec3(_Metallic))
  )) * _LightColor0.xyz);
  c_1 = (c_1 * clamp (dot (xlv_TEXCOORD5, xlv_TEXCOORD4), 0.0, 1.0));
  mediump vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = c_1;
  mediump vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 31 math, 3 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_8.xyz - _WorldSpaceCameraPos));
  tmpvar_13 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (_WorldSpaceLightPos0.xyz - (tmpvar_8.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_18.x;
  tmpvar_5.w = tmpvar_18.y;
  tmpvar_6.w = tmpvar_18.z;
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_8.xyz;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec2 lightCoord_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = i_posWorld_2;
  lightCoord_1 = (unity_WorldToLight * tmpvar_6).xy;
  lowp float tmpvar_7;
  tmpvar_7 = texture2D (_LightTexture0, lightCoord_1).w;
  mediump vec3 tmpvar_8;
  tmpvar_8.x = xlv_TEXCOORD2.w;
  tmpvar_8.y = xlv_TEXCOORD2_1.w;
  tmpvar_8.z = xlv_TEXCOORD2_2.w;
  mediump float atten_9;
  atten_9 = tmpvar_7;
  mediump vec3 tmpvar_10;
  tmpvar_10 = _LightColor0.xyz;
  tmpvar_10 = (tmpvar_10 * atten_9);
  mediump vec3 viewDir_11;
  viewDir_11 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_12;
  tmpvar_12.x = dot ((viewDir_11 - (2.0 * 
    (dot (tmpvar_5, viewDir_11) * tmpvar_5)
  )), tmpvar_8);
  tmpvar_12.y = (1.0 - clamp (dot (tmpvar_5, viewDir_11), 0.0, 1.0));
  mediump vec2 tmpvar_13;
  tmpvar_13.x = ((tmpvar_12 * tmpvar_12) * (tmpvar_12 * tmpvar_12)).x;
  tmpvar_13.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (unity_NHxRoughness, tmpvar_13);
  mediump vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = (((tmpvar_4 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_14.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic))
  )) * (tmpvar_10 * clamp (
    dot (tmpvar_5, tmpvar_8)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_16;
  xlat_varoutput_16.xyz = tmpvar_15.xyz;
  xlat_varoutput_16.w = 1.0;
  gl_FragData[0] = xlat_varoutput_16;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 31 math, 3 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_8.xyz - _WorldSpaceCameraPos));
  tmpvar_13 = tmpvar_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (_WorldSpaceLightPos0.xyz - (tmpvar_8.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_18.x;
  tmpvar_5.w = tmpvar_18.y;
  tmpvar_6.w = tmpvar_18.z;
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_8.xyz;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec2 lightCoord_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = i_posWorld_2;
  lightCoord_1 = (unity_WorldToLight * tmpvar_6).xy;
  lowp float tmpvar_7;
  tmpvar_7 = texture2D (_LightTexture0, lightCoord_1).w;
  mediump vec3 tmpvar_8;
  tmpvar_8.x = xlv_TEXCOORD2.w;
  tmpvar_8.y = xlv_TEXCOORD2_1.w;
  tmpvar_8.z = xlv_TEXCOORD2_2.w;
  mediump float atten_9;
  atten_9 = tmpvar_7;
  mediump vec3 tmpvar_10;
  tmpvar_10 = _LightColor0.xyz;
  tmpvar_10 = (tmpvar_10 * atten_9);
  mediump vec3 viewDir_11;
  viewDir_11 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_12;
  tmpvar_12.x = dot ((viewDir_11 - (2.0 * 
    (dot (tmpvar_5, viewDir_11) * tmpvar_5)
  )), tmpvar_8);
  tmpvar_12.y = (1.0 - clamp (dot (tmpvar_5, viewDir_11), 0.0, 1.0));
  mediump vec2 tmpvar_13;
  tmpvar_13.x = ((tmpvar_12 * tmpvar_12) * (tmpvar_12 * tmpvar_12)).x;
  tmpvar_13.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (unity_NHxRoughness, tmpvar_13);
  mediump vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = (((tmpvar_4 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_14.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic))
  )) * (tmpvar_10 * clamp (
    dot (tmpvar_5, tmpvar_8)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_16;
  xlat_varoutput_16.xyz = tmpvar_15.xyz;
  xlat_varoutput_16.w = 1.0;
  gl_FragData[0] = xlat_varoutput_16;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: SPOT SHADOWS_DEPTH 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 26 math, 3 textures, 1 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  lightDir_6 = tmpvar_14;
  mediump vec3 tmpvar_15;
  highp vec3 n_16;
  n_16 = lightDir_6;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(n_16);
  tmpvar_15 = tmpvar_17;
  lightDir_6 = tmpvar_15;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_18;
  highp vec3 norm_19;
  norm_19 = tmpvar_1;
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((norm_19 * tmpvar_20));
  normalWorld_4 = tmpvar_21;
  tmpvar_8.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = tmpvar_15;
  xlv_TEXCOORD5 = normalWorld_4;
}


#endif
#ifdef FRAGMENT
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform highp sampler2D _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  mediump vec3 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  tmpvar_2 = xlv_TEXCOORD1;
  mediump float tmpvar_5;
  tmpvar_5 = dot (xlv_TEXCOORD3.yzw, xlv_TEXCOORD4);
  mediump vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5));
  tmpvar_6.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_NHxRoughness, tmpvar_6);
  c_1 = (((tmpvar_4 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_7.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic))
  )) * _LightColor0.xyz);
  highp vec3 worldPos_8;
  worldPos_8 = tmpvar_2;
  mediump float realtimeShadowAttenuation_9;
  realtimeShadowAttenuation_9 = 1.0;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = worldPos_8;
  highp vec4 tmpvar_11;
  tmpvar_11 = (unity_WorldToShadow[0] * tmpvar_10);
  lowp float tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13 = texture2DProj (_ShadowMapTexture, tmpvar_11);
  mediump float tmpvar_14;
  if ((tmpvar_13.x < (tmpvar_11.z / tmpvar_11.w))) {
    tmpvar_14 = _LightShadowData.x;
  } else {
    tmpvar_14 = 1.0;
  };
  tmpvar_12 = tmpvar_14;
  realtimeShadowAttenuation_9 = tmpvar_12;
  c_1 = (c_1 * (realtimeShadowAttenuation_9 * clamp (
    dot (xlv_TEXCOORD5, xlv_TEXCOORD4)
  , 0.0, 1.0)));
  mediump vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = c_1;
  mediump vec4 xlat_varoutput_16;
  xlat_varoutput_16.xyz = tmpvar_15.xyz;
  xlat_varoutput_16.w = 1.0;
  gl_FragData[0] = xlat_varoutput_16;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 45 math, 5 textures, 1 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  tmpvar_14 = tmpvar_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  mediump vec3 tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_19 = tmpvar_20;
  lightDir_4 = tmpvar_19;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform highp sampler2D _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float atten_1;
  lowp float shadow_2;
  highp vec4 lightCoord_3;
  mediump vec3 i_posWorld_4;
  i_posWorld_4 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_6;
  tmpvar_6 = (_Color.xyz * tmpvar_5.xyz);
  mediump vec3 tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_6, vec3(_Metallic));
  tmpvar_7 = (tmpvar_6 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = i_posWorld_4;
  lightCoord_3 = (unity_WorldToLight * tmpvar_10);
  highp vec3 worldPos_11;
  worldPos_11 = i_posWorld_4;
  mediump float realtimeShadowAttenuation_12;
  realtimeShadowAttenuation_12 = 1.0;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = worldPos_11;
  highp vec4 tmpvar_14;
  tmpvar_14 = (unity_WorldToShadow[0] * tmpvar_13);
  lowp float tmpvar_15;
  highp vec4 tmpvar_16;
  tmpvar_16 = texture2DProj (_ShadowMapTexture, tmpvar_14);
  mediump float tmpvar_17;
  if ((tmpvar_16.x < (tmpvar_14.z / tmpvar_14.w))) {
    tmpvar_17 = _LightShadowData.x;
  } else {
    tmpvar_17 = 1.0;
  };
  tmpvar_15 = tmpvar_17;
  realtimeShadowAttenuation_12 = tmpvar_15;
  shadow_2 = realtimeShadowAttenuation_12;
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = ((lightCoord_3.xy / lightCoord_3.w) + 0.5);
  tmpvar_18 = texture2D (_LightTexture0, P_19);
  highp float tmpvar_20;
  tmpvar_20 = dot (lightCoord_3.xyz, lightCoord_3.xyz);
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_LightTextureB0, vec2(tmpvar_20));
  highp float tmpvar_22;
  tmpvar_22 = (((
    float((lightCoord_3.z > 0.0))
   * tmpvar_18.w) * tmpvar_21.w) * shadow_2);
  atten_1 = tmpvar_22;
  mediump vec3 tmpvar_23;
  tmpvar_23.x = xlv_TEXCOORD2.w;
  tmpvar_23.y = xlv_TEXCOORD2_1.w;
  tmpvar_23.z = xlv_TEXCOORD2_2.w;
  mediump float atten_24;
  atten_24 = atten_1;
  mediump vec3 tmpvar_25;
  tmpvar_25 = _LightColor0.xyz;
  tmpvar_25 = (tmpvar_25 * atten_24);
  mediump vec3 viewDir_26;
  viewDir_26 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_27;
  tmpvar_27.x = dot ((viewDir_26 - (2.0 * 
    (dot (tmpvar_9, viewDir_26) * tmpvar_9)
  )), tmpvar_23);
  tmpvar_27.y = (1.0 - clamp (dot (tmpvar_9, viewDir_26), 0.0, 1.0));
  mediump vec2 tmpvar_28;
  tmpvar_28.x = ((tmpvar_27 * tmpvar_27) * (tmpvar_27 * tmpvar_27)).x;
  tmpvar_28.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (unity_NHxRoughness, tmpvar_28);
  mediump vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = ((tmpvar_7 + (
    (tmpvar_29.w * 16.0)
   * tmpvar_8)) * (tmpvar_25 * clamp (
    dot (tmpvar_9, tmpvar_23)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_31;
  xlat_varoutput_31.xyz = tmpvar_30.xyz;
  xlat_varoutput_31.w = 1.0;
  gl_FragData[0] = xlat_varoutput_31;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 45 math, 5 textures, 1 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  tmpvar_14 = tmpvar_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  mediump vec3 tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_19 = tmpvar_20;
  lightDir_4 = tmpvar_19;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform highp sampler2D _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float atten_1;
  lowp float shadow_2;
  highp vec4 lightCoord_3;
  mediump vec3 i_posWorld_4;
  i_posWorld_4 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_6;
  tmpvar_6 = (_Color.xyz * tmpvar_5.xyz);
  mediump vec3 tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_6, vec3(_Metallic));
  tmpvar_7 = (tmpvar_6 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = i_posWorld_4;
  lightCoord_3 = (unity_WorldToLight * tmpvar_10);
  highp vec3 worldPos_11;
  worldPos_11 = i_posWorld_4;
  mediump float realtimeShadowAttenuation_12;
  realtimeShadowAttenuation_12 = 1.0;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = worldPos_11;
  highp vec4 tmpvar_14;
  tmpvar_14 = (unity_WorldToShadow[0] * tmpvar_13);
  lowp float tmpvar_15;
  highp vec4 tmpvar_16;
  tmpvar_16 = texture2DProj (_ShadowMapTexture, tmpvar_14);
  mediump float tmpvar_17;
  if ((tmpvar_16.x < (tmpvar_14.z / tmpvar_14.w))) {
    tmpvar_17 = _LightShadowData.x;
  } else {
    tmpvar_17 = 1.0;
  };
  tmpvar_15 = tmpvar_17;
  realtimeShadowAttenuation_12 = tmpvar_15;
  shadow_2 = realtimeShadowAttenuation_12;
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = ((lightCoord_3.xy / lightCoord_3.w) + 0.5);
  tmpvar_18 = texture2D (_LightTexture0, P_19);
  highp float tmpvar_20;
  tmpvar_20 = dot (lightCoord_3.xyz, lightCoord_3.xyz);
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_LightTextureB0, vec2(tmpvar_20));
  highp float tmpvar_22;
  tmpvar_22 = (((
    float((lightCoord_3.z > 0.0))
   * tmpvar_18.w) * tmpvar_21.w) * shadow_2);
  atten_1 = tmpvar_22;
  mediump vec3 tmpvar_23;
  tmpvar_23.x = xlv_TEXCOORD2.w;
  tmpvar_23.y = xlv_TEXCOORD2_1.w;
  tmpvar_23.z = xlv_TEXCOORD2_2.w;
  mediump float atten_24;
  atten_24 = atten_1;
  mediump vec3 tmpvar_25;
  tmpvar_25 = _LightColor0.xyz;
  tmpvar_25 = (tmpvar_25 * atten_24);
  mediump vec3 viewDir_26;
  viewDir_26 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_27;
  tmpvar_27.x = dot ((viewDir_26 - (2.0 * 
    (dot (tmpvar_9, viewDir_26) * tmpvar_9)
  )), tmpvar_23);
  tmpvar_27.y = (1.0 - clamp (dot (tmpvar_9, viewDir_26), 0.0, 1.0));
  mediump vec2 tmpvar_28;
  tmpvar_28.x = ((tmpvar_27 * tmpvar_27) * (tmpvar_27 * tmpvar_27)).x;
  tmpvar_28.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (unity_NHxRoughness, tmpvar_28);
  mediump vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = ((tmpvar_7 + (
    (tmpvar_29.w * 16.0)
   * tmpvar_8)) * (tmpvar_25 * clamp (
    dot (tmpvar_9, tmpvar_23)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_31;
  xlat_varoutput_31.xyz = tmpvar_30.xyz;
  xlat_varoutput_31.w = 1.0;
  gl_FragData[0] = xlat_varoutput_31;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 25 math, 3 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  lightDir_6 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  normalWorld_4 = tmpvar_18;
  tmpvar_8.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = lightDir_6;
  xlv_TEXCOORD5 = normalWorld_4;
}


#endif
#ifdef FRAGMENT
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  mediump vec3 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  tmpvar_2 = xlv_TEXCOORD1;
  mediump float tmpvar_5;
  tmpvar_5 = dot (xlv_TEXCOORD3.yzw, xlv_TEXCOORD4);
  mediump vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5));
  tmpvar_6.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_NHxRoughness, tmpvar_6);
  c_1 = (((tmpvar_4 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_7.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic))
  )) * _LightColor0.xyz);
  highp vec3 worldPos_8;
  worldPos_8 = tmpvar_2;
  mediump float realtimeShadowAttenuation_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = worldPos_8;
  lowp float tmpvar_11;
  highp vec4 shadowCoord_12;
  shadowCoord_12 = (unity_WorldToShadow[0] * tmpvar_10);
  highp float lightShadowDataX_13;
  mediump float tmpvar_14;
  tmpvar_14 = _LightShadowData.x;
  lightShadowDataX_13 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = max (float((texture2D (_ShadowMapTexture, shadowCoord_12.xy).x > shadowCoord_12.z)), lightShadowDataX_13);
  tmpvar_11 = tmpvar_15;
  realtimeShadowAttenuation_9 = tmpvar_11;
  c_1 = (c_1 * (realtimeShadowAttenuation_9 * clamp (
    dot (xlv_TEXCOORD5, xlv_TEXCOORD4)
  , 0.0, 1.0)));
  mediump vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = c_1;
  mediump vec4 xlat_varoutput_17;
  xlat_varoutput_17.xyz = tmpvar_16.xyz;
  xlat_varoutput_17.w = 1.0;
  gl_FragData[0] = xlat_varoutput_17;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 55 math, 2 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (_WorldSpaceLightPos0.xyz - (tmpvar_8.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_18.x;
  tmpvar_5.w = tmpvar_18.y;
  tmpvar_6.w = tmpvar_18.z;
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_8.xyz;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float atten_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2_2.xyz);
  highp vec3 worldPos_6;
  worldPos_6 = i_posWorld_2;
  mediump float realtimeShadowAttenuation_7;
  highp vec4 v_8;
  v_8.x = unity_MatrixV[0].z;
  v_8.y = unity_MatrixV[1].z;
  v_8.z = unity_MatrixV[2].z;
  v_8.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (worldPos_6 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_6), v_8.xyz), sqrt(dot (tmpvar_9, tmpvar_9)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_10 = tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = worldPos_6;
  lowp float tmpvar_13;
  highp vec4 shadowCoord_14;
  shadowCoord_14 = (unity_WorldToShadow[0] * tmpvar_12);
  highp float lightShadowDataX_15;
  mediump float tmpvar_16;
  tmpvar_16 = _LightShadowData.x;
  lightShadowDataX_15 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = max (float((texture2D (_ShadowMapTexture, shadowCoord_14.xy).x > shadowCoord_14.z)), lightShadowDataX_15);
  tmpvar_13 = tmpvar_17;
  realtimeShadowAttenuation_7 = tmpvar_13;
  mediump float tmpvar_18;
  tmpvar_18 = clamp ((realtimeShadowAttenuation_7 + tmpvar_10), 0.0, 1.0);
  atten_1 = tmpvar_18;
  mediump vec3 tmpvar_19;
  tmpvar_19.x = xlv_TEXCOORD2.w;
  tmpvar_19.y = xlv_TEXCOORD2_1.w;
  tmpvar_19.z = xlv_TEXCOORD2_2.w;
  mediump float atten_20;
  atten_20 = atten_1;
  mediump vec3 tmpvar_21;
  tmpvar_21 = _LightColor0.xyz;
  tmpvar_21 = (tmpvar_21 * atten_20);
  mediump float specularTerm_22;
  mediump vec3 tmpvar_23;
  mediump vec3 inVec_24;
  inVec_24 = (tmpvar_19 - normalize(xlv_TEXCOORD1));
  tmpvar_23 = (inVec_24 * inversesqrt(max (0.001, 
    dot (inVec_24, inVec_24)
  )));
  mediump float tmpvar_25;
  tmpvar_25 = clamp (dot (tmpvar_5, tmpvar_23), 0.0, 1.0);
  mediump float tmpvar_26;
  tmpvar_26 = (1.0 - _Glossiness);
  mediump float tmpvar_27;
  tmpvar_27 = (tmpvar_26 * tmpvar_26);
  specularTerm_22 = ((tmpvar_27 / (
    (max (0.32, clamp (dot (tmpvar_19, tmpvar_23), 0.0, 1.0)) * (1.5 + tmpvar_27))
   * 
    (((tmpvar_25 * tmpvar_25) * ((tmpvar_27 * tmpvar_27) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_28;
  tmpvar_28 = clamp (specularTerm_22, 0.0, 100.0);
  specularTerm_22 = tmpvar_28;
  mediump vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = (((
    (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)))
   + 
    (tmpvar_28 * mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic)))
  ) * tmpvar_21) * clamp (dot (tmpvar_5, tmpvar_19), 0.0, 1.0));
  mediump vec4 xlat_varoutput_30;
  xlat_varoutput_30.xyz = tmpvar_29.xyz;
  xlat_varoutput_30.w = 1.0;
  gl_FragData[0] = xlat_varoutput_30;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 55 math, 2 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (_WorldSpaceLightPos0.xyz - (tmpvar_8.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_18.x;
  tmpvar_5.w = tmpvar_18.y;
  tmpvar_6.w = tmpvar_18.z;
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_8.xyz;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float atten_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2_2.xyz);
  highp vec3 worldPos_6;
  worldPos_6 = i_posWorld_2;
  mediump float realtimeShadowAttenuation_7;
  highp vec4 v_8;
  v_8.x = unity_MatrixV[0].z;
  v_8.y = unity_MatrixV[1].z;
  v_8.z = unity_MatrixV[2].z;
  v_8.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (worldPos_6 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_6), v_8.xyz), sqrt(dot (tmpvar_9, tmpvar_9)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_10 = tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = worldPos_6;
  lowp float tmpvar_13;
  highp vec4 shadowCoord_14;
  shadowCoord_14 = (unity_WorldToShadow[0] * tmpvar_12);
  highp float lightShadowDataX_15;
  mediump float tmpvar_16;
  tmpvar_16 = _LightShadowData.x;
  lightShadowDataX_15 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = max (float((texture2D (_ShadowMapTexture, shadowCoord_14.xy).x > shadowCoord_14.z)), lightShadowDataX_15);
  tmpvar_13 = tmpvar_17;
  realtimeShadowAttenuation_7 = tmpvar_13;
  mediump float tmpvar_18;
  tmpvar_18 = clamp ((realtimeShadowAttenuation_7 + tmpvar_10), 0.0, 1.0);
  atten_1 = tmpvar_18;
  mediump vec3 tmpvar_19;
  tmpvar_19.x = xlv_TEXCOORD2.w;
  tmpvar_19.y = xlv_TEXCOORD2_1.w;
  tmpvar_19.z = xlv_TEXCOORD2_2.w;
  mediump float atten_20;
  atten_20 = atten_1;
  mediump vec3 tmpvar_21;
  tmpvar_21 = _LightColor0.xyz;
  tmpvar_21 = (tmpvar_21 * atten_20);
  mediump float specularTerm_22;
  mediump vec3 tmpvar_23;
  mediump vec3 inVec_24;
  inVec_24 = (tmpvar_19 - normalize(xlv_TEXCOORD1));
  tmpvar_23 = (inVec_24 * inversesqrt(max (0.001, 
    dot (inVec_24, inVec_24)
  )));
  mediump float tmpvar_25;
  tmpvar_25 = clamp (dot (tmpvar_5, tmpvar_23), 0.0, 1.0);
  mediump float tmpvar_26;
  tmpvar_26 = (1.0 - _Glossiness);
  mediump float tmpvar_27;
  tmpvar_27 = (tmpvar_26 * tmpvar_26);
  specularTerm_22 = ((tmpvar_27 / (
    (max (0.32, clamp (dot (tmpvar_19, tmpvar_23), 0.0, 1.0)) * (1.5 + tmpvar_27))
   * 
    (((tmpvar_25 * tmpvar_25) * ((tmpvar_27 * tmpvar_27) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_28;
  tmpvar_28 = clamp (specularTerm_22, 0.0, 100.0);
  specularTerm_22 = tmpvar_28;
  mediump vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = (((
    (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)))
   + 
    (tmpvar_28 * mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic)))
  ) * tmpvar_21) * clamp (dot (tmpvar_5, tmpvar_19), 0.0, 1.0));
  mediump vec4 xlat_varoutput_30;
  xlat_varoutput_30.xyz = tmpvar_29.xyz;
  xlat_varoutput_30.w = 1.0;
  gl_FragData[0] = xlat_varoutput_30;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL_COOKIE SHADOWS_SCREEN 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 25 math, 3 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  lightDir_6 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  normalWorld_4 = tmpvar_18;
  tmpvar_8.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = lightDir_6;
  xlv_TEXCOORD5 = normalWorld_4;
}


#endif
#ifdef FRAGMENT
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  mediump vec3 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  tmpvar_2 = xlv_TEXCOORD1;
  mediump float tmpvar_5;
  tmpvar_5 = dot (xlv_TEXCOORD3.yzw, xlv_TEXCOORD4);
  mediump vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5));
  tmpvar_6.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_NHxRoughness, tmpvar_6);
  c_1 = (((tmpvar_4 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_7.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic))
  )) * _LightColor0.xyz);
  highp vec3 worldPos_8;
  worldPos_8 = tmpvar_2;
  mediump float realtimeShadowAttenuation_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = worldPos_8;
  lowp float tmpvar_11;
  highp vec4 shadowCoord_12;
  shadowCoord_12 = (unity_WorldToShadow[0] * tmpvar_10);
  highp float lightShadowDataX_13;
  mediump float tmpvar_14;
  tmpvar_14 = _LightShadowData.x;
  lightShadowDataX_13 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = max (float((texture2D (_ShadowMapTexture, shadowCoord_12.xy).x > shadowCoord_12.z)), lightShadowDataX_13);
  tmpvar_11 = tmpvar_15;
  realtimeShadowAttenuation_9 = tmpvar_11;
  c_1 = (c_1 * (realtimeShadowAttenuation_9 * clamp (
    dot (xlv_TEXCOORD5, xlv_TEXCOORD4)
  , 0.0, 1.0)));
  mediump vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = c_1;
  mediump vec4 xlat_varoutput_17;
  xlat_varoutput_17.xyz = tmpvar_16.xyz;
  xlat_varoutput_17.w = 1.0;
  gl_FragData[0] = xlat_varoutput_17;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 58 math, 3 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (_WorldSpaceLightPos0.xyz - (tmpvar_8.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_18.x;
  tmpvar_5.w = tmpvar_18.y;
  tmpvar_6.w = tmpvar_18.z;
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_8.xyz;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float shadow_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = i_posWorld_2;
  highp vec2 tmpvar_7;
  tmpvar_7 = (unity_WorldToLight * tmpvar_6).xy;
  highp vec3 worldPos_8;
  worldPos_8 = i_posWorld_2;
  mediump float realtimeShadowAttenuation_9;
  highp vec4 v_10;
  v_10.x = unity_MatrixV[0].z;
  v_10.y = unity_MatrixV[1].z;
  v_10.z = unity_MatrixV[2].z;
  v_10.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (worldPos_8 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_8), v_10.xyz), sqrt(dot (tmpvar_11, tmpvar_11)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_12 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = worldPos_8;
  lowp float tmpvar_15;
  highp vec4 shadowCoord_16;
  shadowCoord_16 = (unity_WorldToShadow[0] * tmpvar_14);
  highp float lightShadowDataX_17;
  mediump float tmpvar_18;
  tmpvar_18 = _LightShadowData.x;
  lightShadowDataX_17 = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = max (float((texture2D (_ShadowMapTexture, shadowCoord_16.xy).x > shadowCoord_16.z)), lightShadowDataX_17);
  tmpvar_15 = tmpvar_19;
  realtimeShadowAttenuation_9 = tmpvar_15;
  mediump float tmpvar_20;
  tmpvar_20 = clamp ((realtimeShadowAttenuation_9 + tmpvar_12), 0.0, 1.0);
  shadow_1 = tmpvar_20;
  lowp float tmpvar_21;
  tmpvar_21 = (texture2D (_LightTexture0, tmpvar_7).w * shadow_1);
  mediump vec3 tmpvar_22;
  tmpvar_22.x = xlv_TEXCOORD2.w;
  tmpvar_22.y = xlv_TEXCOORD2_1.w;
  tmpvar_22.z = xlv_TEXCOORD2_2.w;
  mediump float atten_23;
  atten_23 = tmpvar_21;
  mediump vec3 tmpvar_24;
  tmpvar_24 = _LightColor0.xyz;
  tmpvar_24 = (tmpvar_24 * atten_23);
  mediump float specularTerm_25;
  mediump vec3 tmpvar_26;
  mediump vec3 inVec_27;
  inVec_27 = (tmpvar_22 - normalize(xlv_TEXCOORD1));
  tmpvar_26 = (inVec_27 * inversesqrt(max (0.001, 
    dot (inVec_27, inVec_27)
  )));
  mediump float tmpvar_28;
  tmpvar_28 = clamp (dot (tmpvar_5, tmpvar_26), 0.0, 1.0);
  mediump float tmpvar_29;
  tmpvar_29 = (1.0 - _Glossiness);
  mediump float tmpvar_30;
  tmpvar_30 = (tmpvar_29 * tmpvar_29);
  specularTerm_25 = ((tmpvar_30 / (
    (max (0.32, clamp (dot (tmpvar_22, tmpvar_26), 0.0, 1.0)) * (1.5 + tmpvar_30))
   * 
    (((tmpvar_28 * tmpvar_28) * ((tmpvar_30 * tmpvar_30) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_31;
  tmpvar_31 = clamp (specularTerm_25, 0.0, 100.0);
  specularTerm_25 = tmpvar_31;
  mediump vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = (((
    (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)))
   + 
    (tmpvar_31 * mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic)))
  ) * tmpvar_24) * clamp (dot (tmpvar_5, tmpvar_22), 0.0, 1.0));
  mediump vec4 xlat_varoutput_33;
  xlat_varoutput_33.xyz = tmpvar_32.xyz;
  xlat_varoutput_33.w = 1.0;
  gl_FragData[0] = xlat_varoutput_33;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 58 math, 3 textures
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  highp vec2 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_13;
  highp vec3 n_14;
  n_14 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  tmpvar_13 = n_14;
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((norm_15 * tmpvar_16));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (_WorldSpaceLightPos0.xyz - (tmpvar_8.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_18.x;
  tmpvar_5.w = tmpvar_18.y;
  tmpvar_6.w = tmpvar_18.z;
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_8.xyz;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _LightColor0;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float shadow_1;
  mediump vec3 i_posWorld_2;
  i_posWorld_2 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = i_posWorld_2;
  highp vec2 tmpvar_7;
  tmpvar_7 = (unity_WorldToLight * tmpvar_6).xy;
  highp vec3 worldPos_8;
  worldPos_8 = i_posWorld_2;
  mediump float realtimeShadowAttenuation_9;
  highp vec4 v_10;
  v_10.x = unity_MatrixV[0].z;
  v_10.y = unity_MatrixV[1].z;
  v_10.z = unity_MatrixV[2].z;
  v_10.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (worldPos_8 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - worldPos_8), v_10.xyz), sqrt(dot (tmpvar_11, tmpvar_11)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_12 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = worldPos_8;
  lowp float tmpvar_15;
  highp vec4 shadowCoord_16;
  shadowCoord_16 = (unity_WorldToShadow[0] * tmpvar_14);
  highp float lightShadowDataX_17;
  mediump float tmpvar_18;
  tmpvar_18 = _LightShadowData.x;
  lightShadowDataX_17 = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = max (float((texture2D (_ShadowMapTexture, shadowCoord_16.xy).x > shadowCoord_16.z)), lightShadowDataX_17);
  tmpvar_15 = tmpvar_19;
  realtimeShadowAttenuation_9 = tmpvar_15;
  mediump float tmpvar_20;
  tmpvar_20 = clamp ((realtimeShadowAttenuation_9 + tmpvar_12), 0.0, 1.0);
  shadow_1 = tmpvar_20;
  lowp float tmpvar_21;
  tmpvar_21 = (texture2D (_LightTexture0, tmpvar_7).w * shadow_1);
  mediump vec3 tmpvar_22;
  tmpvar_22.x = xlv_TEXCOORD2.w;
  tmpvar_22.y = xlv_TEXCOORD2_1.w;
  tmpvar_22.z = xlv_TEXCOORD2_2.w;
  mediump float atten_23;
  atten_23 = tmpvar_21;
  mediump vec3 tmpvar_24;
  tmpvar_24 = _LightColor0.xyz;
  tmpvar_24 = (tmpvar_24 * atten_23);
  mediump float specularTerm_25;
  mediump vec3 tmpvar_26;
  mediump vec3 inVec_27;
  inVec_27 = (tmpvar_22 - normalize(xlv_TEXCOORD1));
  tmpvar_26 = (inVec_27 * inversesqrt(max (0.001, 
    dot (inVec_27, inVec_27)
  )));
  mediump float tmpvar_28;
  tmpvar_28 = clamp (dot (tmpvar_5, tmpvar_26), 0.0, 1.0);
  mediump float tmpvar_29;
  tmpvar_29 = (1.0 - _Glossiness);
  mediump float tmpvar_30;
  tmpvar_30 = (tmpvar_29 * tmpvar_29);
  specularTerm_25 = ((tmpvar_30 / (
    (max (0.32, clamp (dot (tmpvar_22, tmpvar_26), 0.0, 1.0)) * (1.5 + tmpvar_30))
   * 
    (((tmpvar_28 * tmpvar_28) * ((tmpvar_30 * tmpvar_30) - 1.0)) + 1.00001)
  )) - 0.0001);
  mediump float tmpvar_31;
  tmpvar_31 = clamp (specularTerm_25, 0.0, 100.0);
  specularTerm_25 = tmpvar_31;
  mediump vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = (((
    (tmpvar_4 * (0.7790837 - (_Metallic * 0.7790837)))
   + 
    (tmpvar_31 * mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic)))
  ) * tmpvar_24) * clamp (dot (tmpvar_5, tmpvar_22), 0.0, 1.0));
  mediump vec4 xlat_varoutput_33;
  xlat_varoutput_33.xyz = tmpvar_32.xyz;
  xlat_varoutput_33.w = 1.0;
  gl_FragData[0] = xlat_varoutput_33;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: POINT SHADOWS_CUBE 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 28 math, 3 textures, 1 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  lightDir_6 = tmpvar_14;
  mediump vec3 tmpvar_15;
  highp vec3 n_16;
  n_16 = lightDir_6;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(n_16);
  tmpvar_15 = tmpvar_17;
  lightDir_6 = tmpvar_15;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_18;
  highp vec3 norm_19;
  norm_19 = tmpvar_1;
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((norm_19 * tmpvar_20));
  normalWorld_4 = tmpvar_21;
  tmpvar_8.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = tmpvar_15;
  xlv_TEXCOORD5 = normalWorld_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  mediump vec3 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  tmpvar_2 = xlv_TEXCOORD1;
  mediump float tmpvar_5;
  tmpvar_5 = dot (xlv_TEXCOORD3.yzw, xlv_TEXCOORD4);
  mediump vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5));
  tmpvar_6.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_NHxRoughness, tmpvar_6);
  c_1 = (((tmpvar_4 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_7.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic))
  )) * _LightColor0.xyz);
  highp vec3 worldPos_8;
  worldPos_8 = tmpvar_2;
  highp vec3 vec_9;
  vec_9 = (worldPos_8 - _LightPositionRange.xyz);
  highp float mydist_10;
  mydist_10 = ((sqrt(
    dot (vec_9, vec_9)
  ) * _LightPositionRange.w) * 0.97);
  highp float tmpvar_11;
  tmpvar_11 = dot (textureCube (_ShadowMapTexture, vec_9), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  mediump float tmpvar_12;
  if ((tmpvar_11 < mydist_10)) {
    tmpvar_12 = _LightShadowData.x;
  } else {
    tmpvar_12 = 1.0;
  };
  c_1 = (c_1 * (tmpvar_12 * clamp (
    dot (xlv_TEXCOORD5, xlv_TEXCOORD4)
  , 0.0, 1.0)));
  mediump vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = c_1;
  mediump vec4 xlat_varoutput_14;
  xlat_varoutput_14.xyz = tmpvar_13.xyz;
  xlat_varoutput_14.w = 1.0;
  gl_FragData[0] = xlat_varoutput_14;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 41 math, 4 textures, 1 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  tmpvar_14 = tmpvar_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  mediump vec3 tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_19 = tmpvar_20;
  lightDir_4 = tmpvar_19;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float shadow_1;
  highp vec3 lightCoord_2;
  mediump vec3 i_posWorld_3;
  i_posWorld_3 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  tmpvar_6 = (tmpvar_5 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = i_posWorld_3;
  lightCoord_2 = (unity_WorldToLight * tmpvar_9).xyz;
  highp vec3 worldPos_10;
  worldPos_10 = i_posWorld_3;
  highp vec3 vec_11;
  vec_11 = (worldPos_10 - _LightPositionRange.xyz);
  highp float mydist_12;
  mydist_12 = ((sqrt(
    dot (vec_11, vec_11)
  ) * _LightPositionRange.w) * 0.97);
  highp float tmpvar_13;
  tmpvar_13 = dot (textureCube (_ShadowMapTexture, vec_11), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  mediump float tmpvar_14;
  if ((tmpvar_13 < mydist_12)) {
    tmpvar_14 = _LightShadowData.x;
  } else {
    tmpvar_14 = 1.0;
  };
  shadow_1 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (lightCoord_2, lightCoord_2);
  lowp float tmpvar_16;
  tmpvar_16 = (texture2D (_LightTexture0, vec2(tmpvar_15)).w * shadow_1);
  mediump vec3 tmpvar_17;
  tmpvar_17.x = xlv_TEXCOORD2.w;
  tmpvar_17.y = xlv_TEXCOORD2_1.w;
  tmpvar_17.z = xlv_TEXCOORD2_2.w;
  mediump float atten_18;
  atten_18 = tmpvar_16;
  mediump vec3 tmpvar_19;
  tmpvar_19 = _LightColor0.xyz;
  tmpvar_19 = (tmpvar_19 * atten_18);
  mediump vec3 viewDir_20;
  viewDir_20 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_21;
  tmpvar_21.x = dot ((viewDir_20 - (2.0 * 
    (dot (tmpvar_8, viewDir_20) * tmpvar_8)
  )), tmpvar_17);
  tmpvar_21.y = (1.0 - clamp (dot (tmpvar_8, viewDir_20), 0.0, 1.0));
  mediump vec2 tmpvar_22;
  tmpvar_22.x = ((tmpvar_21 * tmpvar_21) * (tmpvar_21 * tmpvar_21)).x;
  tmpvar_22.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_NHxRoughness, tmpvar_22);
  mediump vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = ((tmpvar_6 + (
    (tmpvar_23.w * 16.0)
   * tmpvar_7)) * (tmpvar_19 * clamp (
    dot (tmpvar_8, tmpvar_17)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_25;
  xlat_varoutput_25.xyz = tmpvar_24.xyz;
  xlat_varoutput_25.w = 1.0;
  gl_FragData[0] = xlat_varoutput_25;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 41 math, 4 textures, 1 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  tmpvar_14 = tmpvar_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  mediump vec3 tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_19 = tmpvar_20;
  lightDir_4 = tmpvar_19;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float shadow_1;
  highp vec3 lightCoord_2;
  mediump vec3 i_posWorld_3;
  i_posWorld_3 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  tmpvar_6 = (tmpvar_5 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = i_posWorld_3;
  lightCoord_2 = (unity_WorldToLight * tmpvar_9).xyz;
  highp vec3 worldPos_10;
  worldPos_10 = i_posWorld_3;
  highp vec3 vec_11;
  vec_11 = (worldPos_10 - _LightPositionRange.xyz);
  highp float mydist_12;
  mydist_12 = ((sqrt(
    dot (vec_11, vec_11)
  ) * _LightPositionRange.w) * 0.97);
  highp float tmpvar_13;
  tmpvar_13 = dot (textureCube (_ShadowMapTexture, vec_11), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  mediump float tmpvar_14;
  if ((tmpvar_13 < mydist_12)) {
    tmpvar_14 = _LightShadowData.x;
  } else {
    tmpvar_14 = 1.0;
  };
  shadow_1 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (lightCoord_2, lightCoord_2);
  lowp float tmpvar_16;
  tmpvar_16 = (texture2D (_LightTexture0, vec2(tmpvar_15)).w * shadow_1);
  mediump vec3 tmpvar_17;
  tmpvar_17.x = xlv_TEXCOORD2.w;
  tmpvar_17.y = xlv_TEXCOORD2_1.w;
  tmpvar_17.z = xlv_TEXCOORD2_2.w;
  mediump float atten_18;
  atten_18 = tmpvar_16;
  mediump vec3 tmpvar_19;
  tmpvar_19 = _LightColor0.xyz;
  tmpvar_19 = (tmpvar_19 * atten_18);
  mediump vec3 viewDir_20;
  viewDir_20 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_21;
  tmpvar_21.x = dot ((viewDir_20 - (2.0 * 
    (dot (tmpvar_8, viewDir_20) * tmpvar_8)
  )), tmpvar_17);
  tmpvar_21.y = (1.0 - clamp (dot (tmpvar_8, viewDir_20), 0.0, 1.0));
  mediump vec2 tmpvar_22;
  tmpvar_22.x = ((tmpvar_21 * tmpvar_21) * (tmpvar_21 * tmpvar_21)).x;
  tmpvar_22.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_NHxRoughness, tmpvar_22);
  mediump vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = ((tmpvar_6 + (
    (tmpvar_23.w * 16.0)
   * tmpvar_7)) * (tmpvar_19 * clamp (
    dot (tmpvar_8, tmpvar_17)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_25;
  xlat_varoutput_25.xyz = tmpvar_24.xyz;
  xlat_varoutput_25.w = 1.0;
  gl_FragData[0] = xlat_varoutput_25;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: POINT_COOKIE SHADOWS_CUBE 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 28 math, 3 textures, 1 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec3 normalWorld_4;
  mediump vec3 eyeVec_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  highp vec3 tmpvar_14;
  tmpvar_14 = (_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w));
  lightDir_6 = tmpvar_14;
  mediump vec3 tmpvar_15;
  highp vec3 n_16;
  n_16 = lightDir_6;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(n_16);
  tmpvar_15 = tmpvar_17;
  lightDir_6 = tmpvar_15;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  eyeVec_5 = tmpvar_18;
  highp vec3 norm_19;
  norm_19 = tmpvar_1;
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((norm_19 * tmpvar_20));
  normalWorld_4 = tmpvar_21;
  tmpvar_8.yzw = (eyeVec_5 - (2.0 * (
    dot (normalWorld_4, eyeVec_5)
   * normalWorld_4)));
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_9.xyz;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_8;
  xlv_TEXCOORD4 = tmpvar_15;
  xlv_TEXCOORD5 = normalWorld_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 c_1;
  mediump vec3 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  tmpvar_2 = xlv_TEXCOORD1;
  mediump float tmpvar_5;
  tmpvar_5 = dot (xlv_TEXCOORD3.yzw, xlv_TEXCOORD4);
  mediump vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5));
  tmpvar_6.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (unity_NHxRoughness, tmpvar_6);
  c_1 = (((tmpvar_4 * 
    (0.7790837 - (_Metallic * 0.7790837))
  ) + (
    (tmpvar_7.w * 16.0)
   * 
    mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_4, vec3(_Metallic))
  )) * _LightColor0.xyz);
  highp vec3 worldPos_8;
  worldPos_8 = tmpvar_2;
  highp vec3 vec_9;
  vec_9 = (worldPos_8 - _LightPositionRange.xyz);
  highp float mydist_10;
  mydist_10 = ((sqrt(
    dot (vec_9, vec_9)
  ) * _LightPositionRange.w) * 0.97);
  highp float tmpvar_11;
  tmpvar_11 = dot (textureCube (_ShadowMapTexture, vec_9), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  mediump float tmpvar_12;
  if ((tmpvar_11 < mydist_10)) {
    tmpvar_12 = _LightShadowData.x;
  } else {
    tmpvar_12 = 1.0;
  };
  c_1 = (c_1 * (tmpvar_12 * clamp (
    dot (xlv_TEXCOORD5, xlv_TEXCOORD4)
  , 0.0, 1.0)));
  mediump vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = c_1;
  mediump vec4 xlat_varoutput_14;
  xlat_varoutput_14.xyz = tmpvar_13.xyz;
  xlat_varoutput_14.w = 1.0;
  gl_FragData[0] = xlat_varoutput_14;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 42 math, 5 textures, 1 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  tmpvar_14 = tmpvar_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  mediump vec3 tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_19 = tmpvar_20;
  lightDir_4 = tmpvar_19;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform lowp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float shadow_1;
  highp vec3 lightCoord_2;
  mediump vec3 i_posWorld_3;
  i_posWorld_3 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  tmpvar_6 = (tmpvar_5 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = i_posWorld_3;
  lightCoord_2 = (unity_WorldToLight * tmpvar_9).xyz;
  highp vec3 worldPos_10;
  worldPos_10 = i_posWorld_3;
  highp vec3 vec_11;
  vec_11 = (worldPos_10 - _LightPositionRange.xyz);
  highp float mydist_12;
  mydist_12 = ((sqrt(
    dot (vec_11, vec_11)
  ) * _LightPositionRange.w) * 0.97);
  highp float tmpvar_13;
  tmpvar_13 = dot (textureCube (_ShadowMapTexture, vec_11), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  mediump float tmpvar_14;
  if ((tmpvar_13 < mydist_12)) {
    tmpvar_14 = _LightShadowData.x;
  } else {
    tmpvar_14 = 1.0;
  };
  shadow_1 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (lightCoord_2, lightCoord_2);
  lowp float tmpvar_16;
  tmpvar_16 = ((texture2D (_LightTextureB0, vec2(tmpvar_15)).w * textureCube (_LightTexture0, lightCoord_2).w) * shadow_1);
  mediump vec3 tmpvar_17;
  tmpvar_17.x = xlv_TEXCOORD2.w;
  tmpvar_17.y = xlv_TEXCOORD2_1.w;
  tmpvar_17.z = xlv_TEXCOORD2_2.w;
  mediump float atten_18;
  atten_18 = tmpvar_16;
  mediump vec3 tmpvar_19;
  tmpvar_19 = _LightColor0.xyz;
  tmpvar_19 = (tmpvar_19 * atten_18);
  mediump vec3 viewDir_20;
  viewDir_20 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_21;
  tmpvar_21.x = dot ((viewDir_20 - (2.0 * 
    (dot (tmpvar_8, viewDir_20) * tmpvar_8)
  )), tmpvar_17);
  tmpvar_21.y = (1.0 - clamp (dot (tmpvar_8, viewDir_20), 0.0, 1.0));
  mediump vec2 tmpvar_22;
  tmpvar_22.x = ((tmpvar_21 * tmpvar_21) * (tmpvar_21 * tmpvar_21)).x;
  tmpvar_22.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_NHxRoughness, tmpvar_22);
  mediump vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = ((tmpvar_6 + (
    (tmpvar_23.w * 16.0)
   * tmpvar_7)) * (tmpvar_19 * clamp (
    dot (tmpvar_8, tmpvar_17)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_25;
  xlat_varoutput_25.xyz = tmpvar_24.xyz;
  xlat_varoutput_25.w = 1.0;
  gl_FragData[0] = xlat_varoutput_25;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 42 math, 5 textures, 1 branches
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec3 lightDir_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec2 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _glesVertex.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_9.xyz - _WorldSpaceCameraPos));
  tmpvar_14 = tmpvar_15;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_18;
  mediump vec3 tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_9.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_19 = tmpvar_20;
  lightDir_4 = tmpvar_19;
  tmpvar_5.w = lightDir_4.x;
  tmpvar_6.w = lightDir_4.y;
  tmpvar_7.w = lightDir_4.z;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_9.xyz;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform lowp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp float shadow_1;
  highp vec3 lightCoord_2;
  mediump vec3 i_posWorld_3;
  i_posWorld_3 = xlv_TEXCOORD5;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * tmpvar_4.xyz);
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_7 = mix (vec3(0.2209163, 0.2209163, 0.2209163), tmpvar_5, vec3(_Metallic));
  tmpvar_6 = (tmpvar_5 * (0.7790837 - (_Metallic * 0.7790837)));
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = i_posWorld_3;
  lightCoord_2 = (unity_WorldToLight * tmpvar_9).xyz;
  highp vec3 worldPos_10;
  worldPos_10 = i_posWorld_3;
  highp vec3 vec_11;
  vec_11 = (worldPos_10 - _LightPositionRange.xyz);
  highp float mydist_12;
  mydist_12 = ((sqrt(
    dot (vec_11, vec_11)
  ) * _LightPositionRange.w) * 0.97);
  highp float tmpvar_13;
  tmpvar_13 = dot (textureCube (_ShadowMapTexture, vec_11), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  mediump float tmpvar_14;
  if ((tmpvar_13 < mydist_12)) {
    tmpvar_14 = _LightShadowData.x;
  } else {
    tmpvar_14 = 1.0;
  };
  shadow_1 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (lightCoord_2, lightCoord_2);
  lowp float tmpvar_16;
  tmpvar_16 = ((texture2D (_LightTextureB0, vec2(tmpvar_15)).w * textureCube (_LightTexture0, lightCoord_2).w) * shadow_1);
  mediump vec3 tmpvar_17;
  tmpvar_17.x = xlv_TEXCOORD2.w;
  tmpvar_17.y = xlv_TEXCOORD2_1.w;
  tmpvar_17.z = xlv_TEXCOORD2_2.w;
  mediump float atten_18;
  atten_18 = tmpvar_16;
  mediump vec3 tmpvar_19;
  tmpvar_19 = _LightColor0.xyz;
  tmpvar_19 = (tmpvar_19 * atten_18);
  mediump vec3 viewDir_20;
  viewDir_20 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_21;
  tmpvar_21.x = dot ((viewDir_20 - (2.0 * 
    (dot (tmpvar_8, viewDir_20) * tmpvar_8)
  )), tmpvar_17);
  tmpvar_21.y = (1.0 - clamp (dot (tmpvar_8, viewDir_20), 0.0, 1.0));
  mediump vec2 tmpvar_22;
  tmpvar_22.x = ((tmpvar_21 * tmpvar_21) * (tmpvar_21 * tmpvar_21)).x;
  tmpvar_22.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_NHxRoughness, tmpvar_22);
  mediump vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = ((tmpvar_6 + (
    (tmpvar_23.w * 16.0)
   * tmpvar_7)) * (tmpvar_19 * clamp (
    dot (tmpvar_8, tmpvar_17)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_25;
  xlat_varoutput_25.xyz = tmpvar_24.xyz;
  xlat_varoutput_25.w = 1.0;
  gl_FragData[0] = xlat_varoutput_25;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

 }


 // Stats for Vertex shader:
 //         gles: 5 avg math (1..9)
 Pass {
  Name "SHADOWCASTER"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords set in this variant: SHADOWS_DEPTH 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 1 math
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 wPos_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
  wPos_2 = tmpvar_3;
  if ((unity_LightShadowBias.z != 0.0)) {
    highp mat3 tmpvar_4;
    tmpvar_4[0] = unity_WorldToObject[0].xyz;
    tmpvar_4[1] = unity_WorldToObject[1].xyz;
    tmpvar_4[2] = unity_WorldToObject[2].xyz;
    highp vec3 tmpvar_5;
    tmpvar_5 = normalize((_glesNormal * tmpvar_4));
    highp float tmpvar_6;
    tmpvar_6 = dot (tmpvar_5, normalize((_WorldSpaceLightPos0.xyz - 
      (tmpvar_3.xyz * _WorldSpaceLightPos0.w)
    )));
    wPos_2.xyz = (tmpvar_3.xyz - (tmpvar_5 * (unity_LightShadowBias.z * 
      sqrt((1.0 - (tmpvar_6 * tmpvar_6)))
    )));
  };
  tmpvar_1 = (unity_MatrixVP * wPos_2);
  highp vec4 clipPos_7;
  clipPos_7.xyw = tmpvar_1.xyw;
  clipPos_7.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
  clipPos_7.z = mix (clipPos_7.z, max (clipPos_7.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_7;
}


#endif
#ifdef FRAGMENT
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 1 math
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 wPos_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
  wPos_2 = tmpvar_3;
  if ((unity_LightShadowBias.z != 0.0)) {
    highp mat3 tmpvar_4;
    tmpvar_4[0] = unity_WorldToObject[0].xyz;
    tmpvar_4[1] = unity_WorldToObject[1].xyz;
    tmpvar_4[2] = unity_WorldToObject[2].xyz;
    highp vec3 tmpvar_5;
    tmpvar_5 = normalize((_glesNormal * tmpvar_4));
    highp float tmpvar_6;
    tmpvar_6 = dot (tmpvar_5, normalize((_WorldSpaceLightPos0.xyz - 
      (tmpvar_3.xyz * _WorldSpaceLightPos0.w)
    )));
    wPos_2.xyz = (tmpvar_3.xyz - (tmpvar_5 * (unity_LightShadowBias.z * 
      sqrt((1.0 - (tmpvar_6 * tmpvar_6)))
    )));
  };
  tmpvar_1 = (unity_MatrixVP * wPos_2);
  highp vec4 clipPos_7;
  clipPos_7.xyw = tmpvar_1.xyw;
  clipPos_7.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
  clipPos_7.z = mix (clipPos_7.z, max (clipPos_7.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_7;
}


#endif
#ifdef FRAGMENT
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 1 math
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 wPos_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
  wPos_2 = tmpvar_3;
  if ((unity_LightShadowBias.z != 0.0)) {
    highp mat3 tmpvar_4;
    tmpvar_4[0] = unity_WorldToObject[0].xyz;
    tmpvar_4[1] = unity_WorldToObject[1].xyz;
    tmpvar_4[2] = unity_WorldToObject[2].xyz;
    highp vec3 tmpvar_5;
    tmpvar_5 = normalize((_glesNormal * tmpvar_4));
    highp float tmpvar_6;
    tmpvar_6 = dot (tmpvar_5, normalize((_WorldSpaceLightPos0.xyz - 
      (tmpvar_3.xyz * _WorldSpaceLightPos0.w)
    )));
    wPos_2.xyz = (tmpvar_3.xyz - (tmpvar_5 * (unity_LightShadowBias.z * 
      sqrt((1.0 - (tmpvar_6 * tmpvar_6)))
    )));
  };
  tmpvar_1 = (unity_MatrixVP * wPos_2);
  highp vec4 clipPos_7;
  clipPos_7.xyw = tmpvar_1.xyw;
  clipPos_7.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
  clipPos_7.z = mix (clipPos_7.z, max (clipPos_7.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_7;
}


#endif
#ifdef FRAGMENT
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: SHADOWS_CUBE 
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
// Stats: 9 math
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 tmpvar_1;
  highp vec4 enc_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  enc_2 = (tmpvar_3 - (tmpvar_3.yzww * 0.003921569));
  tmpvar_1 = enc_2;
  gl_FragData[0] = tmpvar_1;
}


#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
// Stats: 9 math
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 tmpvar_1;
  highp vec4 enc_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  enc_2 = (tmpvar_3 - (tmpvar_3.yzww * 0.003921569));
  tmpvar_1 = enc_2;
  gl_FragData[0] = tmpvar_1;
}


#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
// Stats: 9 math
Shader Disassembly:
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 tmpvar_1;
  highp vec4 enc_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  enc_2 = (tmpvar_3 - (tmpvar_3.yzww * 0.003921569));
  tmpvar_1 = enc_2;
  gl_FragData[0] = tmpvar_1;
}


#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

 }
}
CustomEditor "StandardShaderGUI"
Fallback "VertexLit"
}