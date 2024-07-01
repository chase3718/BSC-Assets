
uniform mat4 transform;
uniform vec2 speed;

attribute vec4 position;

varying vec2 var_prevCoord;
varying vec2 var_thisCoord;
varying vec2 var_nextCoord;

void main() {
	gl_Position = transform*position;
	vec2 texCoord = 0.5*position.xy+0.5;
	var_prevCoord = texCoord-speed;
	var_thisCoord = texCoord;
	var_nextCoord = texCoord+speed;
}
