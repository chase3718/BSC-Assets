
uniform sampler2D maskTexture;
uniform sampler2D sourceTexture;

varying mediump vec2 var_texCoord;
varying lowp float var_density;
varying lowp vec4 var_velocity;

void main() {
	lowp float mask = texture2D(maskTexture,gl_PointCoord).a;
	lowp vec4 source = texture2D(sourceTexture,var_texCoord);
	gl_FragColor = mask*var_density*(var_velocity+vec4(0.0,0.0,source.zw));
}
