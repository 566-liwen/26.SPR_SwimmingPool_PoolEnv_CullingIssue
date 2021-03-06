Shader "Unlit/SimpleColor"
{
    Properties
    {
         _Color("Color", Color) = (0.2,1,0,1) 
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Cull OFF

        Pass
        {
            Tags { "LightMode"="ObjectA" }

            // Cull OFF

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            
            fixed4 _Color;
            float4 _MainTex_ST;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

            void frag (v2f i,
            out half4 GRT0:SV_Target0
            )
			{                
				GRT0 = _Color;
			}
            ENDCG
        }
    }
}
