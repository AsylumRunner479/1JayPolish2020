Shader "PolishBuilds/Example/Albedo"
{
	Properties
	{
		_MainTex("Texture RGB", 2D) = "white"{}
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
		//combination of two values to represent the x and y
		};
	sampler2D _MainTex;

	void rendFunk(Input inputInfo, inout SurfaceOutput outputInfo)
	{
		outputInfo.Albedo = tex2D(_MainTex, inputInfo.uv_MainTex).rgb;
		//uses the input field alter the output colour based on rgb
	}
	   ENDCG
	}
		//makes the deafult colour run through
		   FallBack "Diffuse"
}
