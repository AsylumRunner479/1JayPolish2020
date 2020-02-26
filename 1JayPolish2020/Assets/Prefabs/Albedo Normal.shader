Shader "PolishBuilds/Example/Albedo Normal"
{
	Properties
	{
		_MainTex("Texture RGB", 2D) = "white"{}
	_NormalMap ("Normal Map", 2D) = "bump" {}
	//sets it to white
	}
		SubShader
	{
	   Tags{"RenderType" = "Opaque"}
	   //designates something as high alpha
	   CGPROGRAM
		#pragma surface rendFunk Lambert
		struct Input
		{

		float2 uv_MainTex;
		float2 uv_NormalMap;
		//combination of two values to represent the x and y
		};
	sampler2D _MainTex;
	sampler2D _NormalMap;

	void rendFunk(Input inputInfo, inout SurfaceOutput outputInfo)
	{
		outputInfo.Albedo = tex2D(_MainTex, inputInfo.uv_MainTex).rgb;
		//uses the input field alter the output colour based on rgb
		outputInfo.Normal = UnpackNormal(tex2D(_NormalMap, inputInfo.uv_NormalMap));
	
	}
	   ENDCG
	}
		//makes the deafult colour run through
		   FallBack "Diffuse"
}
