
Shader "Custom/Colour"
{
	Properties
	{
		_Colour("Colour", Color) = (1,1,1,1)
		//black is 0,0,0,1

	}
		SubShader
	{
		Pass
		{
			CGPROGRAM
			#pragma vertex vertexPos
			#pragma fragment pixelColour
			float4 vertexPos(float4 vertex : POSITION) : SV_POSITION
			{
				return UnityObjectToClipPos(vertex);
			}
			
			fixed4 _Colour;

			fixed4 pixelColour() : SV_Target
			{
				return _Colour;
			}
			ENDCG
		}
	}
}
