
precision highp float;

uniform vec4 color;
uniform sampler2D texture;

varying vec2 var_texCoord;

void main() {
	gl_FragColor = color*texture2D(texture,var_texCoord);
}
