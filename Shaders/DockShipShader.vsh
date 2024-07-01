
uniform mat4 transform;
uniform mat4 localTransform;
uniform vec3 lightPosition;
uniform vec4 baseColor;

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;

varying lowp vec4 var_color;

void main() {
	vec4 globalPosition = localTransform*position;
	vec3 globalNormal = (localTransform*vec4(normal,0.0)).xyz;
	gl_Position = transform*globalPosition;
	float diffuse = 0.7+0.3*dot(globalNormal,lightPosition);
	var_color = vec4(((1.0-color.a)*baseColor.rgb+color.rgb)*diffuse,1.0);
}
