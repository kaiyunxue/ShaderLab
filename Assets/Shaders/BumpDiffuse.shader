Shader "Custom/BumpS"
{
    Properties
    {
		_myDiffuse ("Diffuse Texture", 2D) = "white"{}
		_myBump ("Bump Texture", 2D) = "bump"{}
		_Noisy("Noisy", 2D) = "white"{}
		_mySlider ("Bump Amount", Range(0,10)) = 1
		_myCube("Cube", CUBE) = "" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _myDiffuse;
		sampler2D _myBump;
		sampler2D _Noisy;
		half _mySlider;
		samplerCUBE _myCube;

        struct Input
        {
            float2 uv_myDiffuse;
			float2 uv_myBump;
			float2 uv_Noisy;
			float3 worldRefl; INTERNAL_DATA
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
			o.Albedo = tex2D(_myDiffuse, IN.uv_myDiffuse).rgb;
			o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump));
			float a = sin(_Time * 10);
			float b = cos(_Time * 10);
			float c = tex2D(_Noisy, IN.uv_Noisy + float2(a,b)).b;
			o.Normal *= float3(_mySlider * a, b * _mySlider, 1) * c;
			//o.Emission = texCUBE(_myCube, WorldReflectionVector(IN, o.Normal)).rgb;
		}
        ENDCG
    }
    FallBack "Diffuse"
}
