
uniform sampler2D texture;

varying lowp vec4 var_color;
varying mediump vec2 var_texCoord;

void main() {
	gl_FragColor = var_color*texture2D(texture,var_texCoord);
}
