Shader "Course/1/Course1"{
	Properties{
		_myColour("Colour", Color) = (1,1,1,1)
		_myEmission("Emission Colour", Color) = (1,1,1,1)
	}
	SubShader{
		CGPROGRAM
			#pragma surface surf Lambert

			struct Input {
				float2 uvMainTex;
			};
		
			fixed4 _myColour;
			fixed4 _myEmission;

			void surf(Input IN, inout SurfaceOutput o){
				o.Albedo = _myColour.rgb;
				o.Emission = _myEmission.rgb;
			}
		ENDCG
	}
	FallBack "Diffuse"
}