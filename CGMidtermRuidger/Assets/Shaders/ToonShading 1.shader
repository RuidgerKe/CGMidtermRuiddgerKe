Shader "Custom/ToonShadingSS"
{
    Properties
    {
       _ColorIB ("Color", Color) = (1, 1, 1, 1)
       _RampTexIB ("Ramp Texture", 2D) = "white"{}
       Animated("WorkPles", Range(0,1)) = 1
    }
    SubShader
    {
         CGPROGRAM
       #pragma surface surf ToonRamp

       float4 _ColorIB;
       sampler2D _RampTexIB;
       float4 Animated;
       float4 randomVariable;

       
       

       float4 LightingToonRamp (SurfaceOutput s, fixed3 LightDir, fixed atten){
           float diff = dot(s.Normal, LightDir);
           float h = diff * 0.5 +0.5;
           float2 rh = h;
           float3 ramp = tex2D(_RampTexIB, rh).rgb;

           float4 c;
           c.rgb = s.Albedo * _LightColor0.rgb * (ramp );
           c.a = s.Alpha;
           return c;
           }

        struct Input {
            float2 uv_MainTex;
            };

        void surf (Input IN, inout SurfaceOutput o){
            o.Albedo = _ColorIB.rgb;
            }
        
        ENDCG
    }
    FallBack "Diffuse"
}
