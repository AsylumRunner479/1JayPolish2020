Shader "Custom/VertexFog"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white"{}
    }
        SubShader
    {
        Tags{ "RenderType" = "Opaque"}
        LOD 200
        CGPROGRAM
#pragma surface surf Lambert finalcolor: colour vertex: vert
#pragma multi_compile_fog
        sampler2D _MainTex;
    uniform half4 unity_FogStart
        uniform half4 unity_FogEnd;
    struct Input
    {
        float2 uv_MainTex;
        half fog;
    };
    void vert(inout appdata_full v, out Input data)
    {
        UNITY_INITIALIZE_OUTPUT(Input, data);
        float pos = length(UnityObjectToViewPos(v.vertex).xyz);
        float diff = unity_FogEnd.x - unity_FogStart.x;
        float invDiff = 1.0f / diff;
        data.fog = clamp((unity_FogEnd.x - pos) * invDiff, 0.0, 1.0);
    }
    void colour(Input IN, SurfaceOutput o, inout fixed4 fogcc)
    {
#ifdef UNITY_PASS_FORWARDADD
        UNITY_APPLY_FOG_COLOR(IN.fog, fogcolour, float4(0, 0, 0, 0));
#else
        UNITY_APPLY_FOR_COLOR(IN.fog, fogcolour, unity_FogColor);
#endif
    }
    void surf(Inout IN, inout SurfaceOutput o)
    {
        half4 c = tex2D(_MainTex, IN.uv_MainTex);
        o.Albedo = c.rgb
            o.Alpha = c.a;
    }

        ENDCG
    }
        FallBack"Diffuse"
}
