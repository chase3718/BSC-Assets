
uniform mat4 transform;
uniform mat4 localTransform;
uniform mat4 illumination;
uniform vec3 lightPosition;
uniform vec4 baseColor;
uniform vec4 ambient;
uniform vec4 diffuse;
uniform vec4 fogColor;
uniform vec2 fogCenter;
uniform float inverseFogDistance;

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;

varying lowp vec4 var_color;

void main() {
	vec4 globalPosition = localTransform*position;
	vec3 globalNormal = (localTransform*vec4(normal,0.0)).xyz;
	vec4 globalNormal4 = vec4(globalNormal,1.0);
	gl_Position = transform*globalPosition;
	var_color = mix(
		(ambient+diffuse*max(0.0,dot(globalNormal,lightPosition)))*
		dot(globalNormal4,illumination*globalNormal4)*
		((1.0-color.a)*baseColor+color),
		fogColor,min(distance(globalPosition.xy,fogCenter)*inverseFogDistance,1.0));
}
