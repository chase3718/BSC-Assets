
uniform mat4 transform;
uniform vec3 lightPosition;
uniform vec4 baseColor;

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;

varying lowp vec4 var_color;

void main() {
	gl_Position = transform*position;
	float diffuse = 0.7+0.3*dot(normalize((transform*vec4(normal,0.0)).xyz),lightPosition);
	var_color = vec4(((1.0-color.a)*baseColor.rgb+color.rgb)*diffuse,1.0);
}
