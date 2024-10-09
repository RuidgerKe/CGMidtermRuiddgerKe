Shader "Custom/Rock"
{
    Properties
    {
        _RockTex("MainTex", 2D) = "white"{}

    }
    SubShader
    {
       Tags{
           "Queue" = "Transparent"
           }
        CGPROGRAM
        #pragma surface surf Lambert alpha:fade 

        sampler2D _RockTex;

        struct Input{
            float2 uv_MainTex;
            };

        void surf (Input IN, inout SurfaceOutput o ){
            fixed4 c= tex2D(_RockTex, IN.uv_MainTex);
            o.Albedo = c.rgb;
            o.Alpha = c.a;
            }



        ENDCG
    }
    FallBack "Diffuse"
}
