// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Example/SM_cliff"
{
	Properties
	{
		_T_base_cliff_basecolor("T_base_cliff_basecolor", 2D) = "white" {}
		_T_base_cliff_normal("T_base_cliff_normal", 2D) = "bump" {}
		_T_cliff_a_normal("T_cliff_a_normal", 2D) = "bump" {}
		_scale_UV_fardis("scale _UV_fardis", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityStandardUtils.cginc"
		#pragma target 3.0
		#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
			#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
		#else//ASE Sampling Macros
			#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
		#endif//ASE Sampling Macros

		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		UNITY_DECLARE_TEX2D_NOSAMPLER(_T_cliff_a_normal);
		uniform float4 _T_cliff_a_normal_ST;
		SamplerState sampler_T_cliff_a_normal;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_T_base_cliff_normal);
		uniform float _scale_UV_fardis;
		SamplerState sampler_T_base_cliff_normal;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_T_base_cliff_basecolor);
		uniform float4 _T_base_cliff_basecolor_ST;
		SamplerState sampler_T_base_cliff_basecolor;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_T_cliff_a_normal = i.uv_texcoord * _T_cliff_a_normal_ST.xy + _T_cliff_a_normal_ST.zw;
			o.Normal = BlendNormals( UnpackNormal( SAMPLE_TEXTURE2D( _T_cliff_a_normal, sampler_T_cliff_a_normal, uv_T_cliff_a_normal ) ) , UnpackNormal( SAMPLE_TEXTURE2D( _T_base_cliff_normal, sampler_T_base_cliff_normal, ( i.uv_texcoord * _scale_UV_fardis ) ) ) );
			float2 uv_T_base_cliff_basecolor = i.uv_texcoord * _T_base_cliff_basecolor_ST.xy + _T_base_cliff_basecolor_ST.zw;
			o.Albedo = SAMPLE_TEXTURE2D( _T_base_cliff_basecolor, sampler_T_base_cliff_basecolor, uv_T_base_cliff_basecolor ).rgb;
			float temp_output_3_0 = 0.3;
			o.Metallic = temp_output_3_0;
			o.Smoothness = temp_output_3_0;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18400
152;364;1206;613;2249.647;-469.8835;1.20581;True;True
Node;AmplifyShaderEditor.TexCoordVertexDataNode;11;-2268.723,594.0199;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;12;-2246.532,728.9913;Inherit;False;Property;_scale_UV_fardis;scale _UV_fardis;5;0;Create;True;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;-1883.508,690.1693;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;6;-1264.391,474.2189;Inherit;True;Property;_T_cliff_a_normal;T_cliff_a_normal;4;0;Create;True;0;0;False;0;False;-1;1bae2fb0211663a468017f52e95f0755;1bae2fb0211663a468017f52e95f0755;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-1477.771,722.6846;Inherit;True;Property;_T_base_cliff_normal;T_base_cliff_normal;1;0;Create;True;0;0;False;0;False;-1;a19aee7f393d52940a166d7dae6cc2b9;a19aee7f393d52940a166d7dae6cc2b9;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;3;-214.5093,255.3642;Inherit;False;Constant;_Float0;Float 0;2;0;Create;True;0;0;False;0;False;0.3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BlendNormalsNode;7;-747.8088,518.4317;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;1;-1185.294,-484.3273;Inherit;True;Property;_T_base_cliff_basecolor;T_base_cliff_basecolor;0;0;Create;True;0;0;False;0;False;-1;efe1e3e6ae736334ab464023106ae368;efe1e3e6ae736334ab464023106ae368;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;4;-1639.925,-264.0713;Inherit;True;Property;_T_cliff_a_mask_A;T_cliff_a_mask_A;2;0;Create;True;0;0;False;0;False;-1;7e7703bbbd905804ea29bb9f643e9e4f;7e7703bbbd905804ea29bb9f643e9e4f;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;5;-1619.977,-41.88284;Inherit;True;Property;_T_cliff_a_mask_B;T_cliff_a_mask_B;3;0;Create;True;0;0;False;0;False;-1;b57b83a07ea5710489cce0229b3c818e;b57b83a07ea5710489cce0229b3c818e;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;SM_cliff;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;10;0;11;0
WireConnection;10;1;12;0
WireConnection;2;1;10;0
WireConnection;7;0;6;0
WireConnection;7;1;2;0
WireConnection;0;0;1;0
WireConnection;0;1;7;0
WireConnection;0;3;3;0
WireConnection;0;4;3;0
ASEEND*/
//CHKSM=9AE544472E57E44AC7F4890F84E618D049A57FFF