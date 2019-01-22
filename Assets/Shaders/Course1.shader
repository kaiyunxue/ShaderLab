Shader "Course/1/Course1"{
	Properties{
		_myColour("Colour", Color) = (1,1,1,1)
		_myRange("Range", Range(0,1)) = 1
		_myTex ("Texture", 2D) = "white"{}
		_emissionTex ("Emission Texture", 2D) = "white"{}
		_myCube ("Cube", CUBE) = "" {}
		_myFloat("Float", Float) = 0.5
		_myVector("Vector", vector) = (0.5,1,1,1)
		_myEmission("Emission Colour", Color) = (1,1,1,1)
	}
		SubShader{
			CGPROGRAM
			#pragma surface surf Lambert


		fixed4 _myColour;
		half _myRange;
		sampler2D _myTex;
		sampler2D _emissionTex;
		samplerCUBE _myCube;
		float _myFloat;
		float4 _myVector;
		fixed4 _myEmission;
			struct Input {
				float2 uv_myTex;
				float3 worldRefl;
			};
		


		void surf(Input IN, inout SurfaceOutput o){
			o.Albedo = tex2D(_myTex, IN.uv_myTex).rgb * _myColour;
			float r = sin(_Time * 10) + 0.5;
			//o.Emission =  r * texCUBE(_myCube, IN.worldRefl).rgb;
			o.Emission = (r * texCUBE(_myCube, IN.worldRefl).rgb + (1-r) * tex2D(_emissionTex, IN.uv_myTex).rgb) * _myRange;
		}
		ENDCG
	}
	FallBack "Diffuse"
}