
uniform mat4 transform;
uniform mat4 localTransform;
uniform vec3 lightPosition;
uniform vec4 ambient;
uniform vec4 diffuse;
uniform vec4 fogColor;
uniform vec2 fogCenter;
uniform float brightness;
uniform float inverseFogDistance;

attribute vec4 position;
attribute vec2 texCoord;
attribute vec3 normal;

varying lowp vec4 var_color;
varying mediump vec2 var_texCoord;

void main() {
	vec4 globalPosition = localTransform*position;
	vec3 globalNormal = (localTransform*vec4(normal,0.0)).xyz;
	gl_Position = transform*globalPosition;
	var_color = mix(
		brightness*(ambient+diffuse*abs(dot(globalNormal,lightPosition))),fogColor,
		min(distance(globalPosition.xy,fogCenter)*inverseFogDistance,1.0));
	var_texCoord = texCoord;
}
