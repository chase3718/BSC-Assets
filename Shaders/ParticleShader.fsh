
uniform sampler2D texture;
uniform sampler2D maskTexture;

varying lowp vec2 var_texCoord;
varying lowp vec4 var_color;

void main() {
	lowp vec4 texColor = texture2D(texture,gl_PointCoord+var_texCoord);
	lowp float mask = texture2D(maskTexture,gl_PointCoord).a;
	gl_FragColor = mask*texColor*var_color;
}
