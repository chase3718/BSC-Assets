
uniform mat4 transform;

attribute vec4 position;
attribute vec2 texCoord;

varying vec2 var_texCoord;

void main() {
	gl_Position = transform*position;
	var_texCoord = texCoord;
}
