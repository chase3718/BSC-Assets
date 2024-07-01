
precision highp float;

uniform sampler2D rippleTexture;
uniform sampler2D maskTexture;
uniform float textureScale;
uniform vec3 lightPosition;
uniform vec4 foamAmbient;
uniform vec4 foamDiffuse;

varying mediump vec2 var_texCoord;
varying mediump vec2 var_texCoordEast;
varying mediump vec2 var_texCoordWest;
varying mediump vec2 var_texCoordSouth;
varying mediump vec2 var_texCoordNorth;

void main() {
	mediump vec4 ripple = texture2D(rippleTexture,var_texCoord);
	mediump vec4 rippleEast = texture2D(rippleTexture,var_texCoordEast);
	mediump vec4 rippleWest = texture2D(rippleTexture,var_texCoordWest);
	mediump vec4 rippleSouth = texture2D(rippleTexture,var_texCoordSouth);
	mediump vec4 rippleNorth = texture2D(rippleTexture,var_texCoordNorth);
	mediump vec3 normal = normalize(vec3(rippleWest.z-rippleWest.z,rippleSouth.z-rippleNorth.z,textureScale));
	lowp float light = dot(normal.xy,lightPosition.xy);
	lowp float sunniness = max(0.0,light);
	lowp float darkness = max(0.0,-light);
	lowp vec4 lightColor = vec4(sunniness,sunniness,sunniness,darkness);
	lowp vec4 foamColor = foamAmbient+foamDiffuse*sunniness;
	lowp vec4 mask = texture2D(maskTexture,var_texCoord);
	gl_FragColor = mix(lightColor,foamColor,ripple.a)*mask.a;
}
