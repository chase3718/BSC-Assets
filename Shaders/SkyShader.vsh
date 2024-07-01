
uniform mat4 transform;
uniform mat4 inverseTransform;
uniform vec4 skyColor;
uniform vec4 fogColor;
uniform float inverseFogAngle;

attribute vec4 position;

varying vec4 var_skyColor;
varying vec4 var_fogColor;
varying vec2 var_texCoord;

const vec2 scale = vec2(0.1591549430918953,1.273239544735163);
const vec4 rayDirection = vec4(0.0,0.0,1.0,0.0);
const vec4 transformedCenter = vec4(0.0,0.0,0.0,1.0);

vec3 calcRay(vec4 position) {
	vec4 rayStart = inverseTransform*position;
	vec4 rayEnd = inverseTransform*(position+rayDirection);
	return normalize((rayEnd*rayStart.w-rayStart*rayEnd.w).xyz);
}

void main() {
	vec4 transformedPosition = transform*position;
	gl_Position = transformedPosition;
	vec3 ray = calcRay(transformedPosition);
	vec3 ray0 = calcRay(transformedCenter);
	var_skyColor = skyColor;
	var_fogColor = fogColor*max(0.0,1.0-ray.z*inverseFogAngle);
	var_texCoord = scale*vec2(asin(cross(ray,ray0).z)-atan(ray0.y,ray0.x),ray.z);
}
