// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "CoolShit"
{
	Properties
	{
		_TransitionDistance("Transition Distance", Float) = 34
		_Float0("Float 0", Float) = 10
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf StandardCustomLighting keepalpha addshadow fullforwardshadows noforwardadd exclude_path:deferred 
		struct Input
		{
			float3 worldPos;
		};

		struct SurfaceOutputCustomLightingCustom
		{
			half3 Albedo;
			half3 Normal;
			half3 Emission;
			half Metallic;
			half Smoothness;
			half Occlusion;
			half Alpha;
			Input SurfInput;
			UnityGIInput GIData;
		};

		uniform float _TransitionDistance;
		uniform float _Float0;

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			c.rgb = 0;
			c.a = 1;
			return c;
		}

		inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
		{
			s.GIData = data;
		}

		void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
		{
			o.SurfInput = i;
			o.Normal = float3(0,0,1);
			float4 color1 = IsGammaSpace() ? float4(0.9433962,0.02224991,0.02224991,1) : float4(0.8760344,0.001722129,0.001722129,1);
			float4 color2 = IsGammaSpace() ? float4(0.04313727,0.2124171,0.972549,0) : float4(0.003346537,0.03710634,0.9386859,0);
			float3 ase_worldPos = i.worldPos;
			float clampResult10 = clamp( pow( ( distance( ase_worldPos.x , _WorldSpaceCameraPos.x ) / _TransitionDistance ) , _Float0 ) , 0.0 , 1.0 );
			float lerpResult11 = lerp( color1.r , color2.r , clampResult10);
			float3 temp_cast_0 = (lerpResult11).xxx;
			o.Emission = temp_cast_0 + 1E-5;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17800
3;167;1920;1133;1147.069;445.5315;1.321377;True;False
Node;AmplifyShaderEditor.WorldPosInputsNode;3;-718.2244,-509.7148;Inherit;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldSpaceCameraPos;29;-1152.656,-23.64454;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;12;-413.9073,412.0389;Inherit;False;Property;_TransitionDistance1;Transition Distance;9;0;Create;True;0;0;False;0;34;34;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-420.8424,-120.6646;Inherit;False;Property;_TransitionDistance;Transition Distance;7;0;Create;True;0;0;False;0;34;34;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;5;-444.0543,-382.0298;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;19;-377.3193,699.2734;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-354.1075,960.6386;Inherit;False;Property;_TransitionDistance2;Transition Distance;8;0;Create;True;0;0;False;0;34;34;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;18;-437.1192,150.6737;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;6;-129.7314,-108.6106;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;13;-122.7964,424.093;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;22;-62.99638,972.6926;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-396.4557,548.936;Inherit;False;Property;_Float1;Float 0;12;0;Create;True;0;0;False;0;10;7.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-183.256,567.136;Inherit;False;Property;_Float2;Float 0;11;0;Create;True;0;0;False;0;10;7.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;9;-249.9909,-514.1673;Inherit;False;Property;_Float0;Float 0;10;0;Create;True;0;0;False;0;10;7.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;23;1.716272,723.8716;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;15;-58.08363,175.2719;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;8;-65.01865,-357.4316;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;10;60.29084,-195.9265;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;26;-6.603567,0.2219572;Inherit;False;Constant;_Int0;Int 0;6;0;Create;True;0;0;False;0;0;0;0;1;INT;0
Node;AmplifyShaderEditor.ClampOpNode;24;127.0258,885.3766;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;16;67.22584,336.777;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;2;-737.2204,162.0836;Inherit;False;Constant;_Secondary;Secondary;0;0;Create;True;0;0;False;0;0.04313727,0.2124171,0.972549,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1;-758.5475,-48.69306;Inherit;False;Constant;_Primary;Primary;0;0;Create;True;0;0;False;0;0.9433962,0.02224991,0.02224991,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;25;273.6603,502.1127;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;27;283.2965,-86.87801;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;17;285.3369,261.8301;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;11;278.7499,72.61787;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;824.7061,122.1084;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;CoolShit;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;ForwardOnly;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;0;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;5;0;3;1
WireConnection;5;1;29;1
WireConnection;19;0;3;3
WireConnection;19;1;29;3
WireConnection;18;0;3;2
WireConnection;18;1;29;2
WireConnection;6;0;5;0
WireConnection;6;1;7;0
WireConnection;13;0;18;0
WireConnection;13;1;12;0
WireConnection;22;0;19;0
WireConnection;22;1;20;0
WireConnection;23;0;22;0
WireConnection;23;1;21;0
WireConnection;15;0;13;0
WireConnection;15;1;14;0
WireConnection;8;0;6;0
WireConnection;8;1;9;0
WireConnection;10;0;8;0
WireConnection;24;0;23;0
WireConnection;16;0;15;0
WireConnection;25;0;1;3
WireConnection;25;1;2;3
WireConnection;25;2;24;0
WireConnection;27;0;1;4
WireConnection;27;1;2;4
WireConnection;27;2;26;0
WireConnection;17;0;1;2
WireConnection;17;1;2;2
WireConnection;17;2;16;0
WireConnection;11;0;1;1
WireConnection;11;1;2;1
WireConnection;11;2;10;0
WireConnection;0;0;11;0
WireConnection;0;1;17;0
WireConnection;0;2;25;0
WireConnection;0;7;27;0
WireConnection;0;15;11;0
ASEEND*/
//CHKSM=8713275782AC10954263DC461B2B8A9EEF26025D