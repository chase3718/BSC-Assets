
uniform mat4 inverseTransform;

attribute vec4 position;

varying vec3 var_ray;

const mat3 cubeTransform = mat3(
	1.0,0.0,0.0,
	0.0,0.0,-1.0,
	0.0,1.0,0.0);

void main() {
	gl_Position = position;
	vec4 rayStart = inverseTransform*position;
	vec4 rayEnd = inverseTransform*(position+vec4(0.0,0.0,0.1,0.0));
	var_ray = cubeTransform*(rayEnd*rayStart.w-rayStart*rayEnd.w).xyz;
}
