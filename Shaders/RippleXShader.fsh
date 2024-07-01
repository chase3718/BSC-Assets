
precision highp float;

uniform sampler2D sourceTexture;
uniform sampler2D maskTexture;

varying vec2 var_prevCoord;
varying vec2 var_thisCoord;
varying vec2 var_nextCoord;

const lowp vec4 base = vec4(0.5,0.5,0.5,0.0);

void main() {
	mediump vec4 mask = texture2D(maskTexture,var_thisCoord);
	mediump vec4 prevColor = texture2D(sourceTexture,var_prevCoord);
	mediump vec4 thisColor = texture2D(sourceTexture,var_thisCoord);
	mediump vec4 nextColor = texture2D(sourceTexture,var_nextCoord);
	gl_FragColor = mix(base,vec4(
		0.5*(prevColor.z+prevColor.x-nextColor.z+nextColor.x),
		thisColor.y,
		0.5*(prevColor.z+prevColor.x+nextColor.z-nextColor.x),
		0.1*(prevColor.w+nextColor.w)+0.79*thisColor.w),mask.a);
}
