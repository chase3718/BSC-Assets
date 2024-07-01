
precision highp float;

uniform mat4 transform;
uniform mat4 foregroundTransform;
uniform mat4 backgroundTransform;
uniform mat4 positionOperator[4];
uniform mat4 tangentXOperator[4];
uniform mat4 tangentYOperator[4];

uniform vec3 eyePosition;
uniform vec3 lightPosition;
uniform vec4 waterAmbient;
uniform vec4 waterDiffuse;
uniform vec4 foamAmbient;
uniform vec4 foamDiffuse;
uniform vec4 fogColor;
uniform vec2 fogCenter;
uniform float inverseFogDistance;

attribute vec4 origin;
attribute vec4 phase0;
attribute vec4 phase1;
attribute vec4 phase2;
attribute vec4 phase3;

varying highp vec2 var_foregroundCoord;
varying highp vec2 var_backgroundCoord;
varying lowp vec4 var_waterColor;

void main() {
	var_foregroundCoord = (foregroundTransform*origin).xy;
	var_backgroundCoord = (backgroundTransform*origin).xy;
	highp vec4 position = origin+
		positionOperator[0]*phase0+
		positionOperator[1]*phase1+
		positionOperator[2]*phase2+
		positionOperator[3]*phase3;
	mediump vec3 tangentX = vec3(1.0,0.0,0.0)+(
		tangentXOperator[0]*phase0+
		tangentXOperator[1]*phase1+
		tangentXOperator[2]*phase2+
		tangentXOperator[3]*phase3).xyz;
	mediump vec3 tangentY = vec3(0.0,1.0,0.0)+(
		tangentYOperator[0]*phase0+
		tangentYOperator[1]*phase1+
		tangentYOperator[2]*phase2+
		tangentYOperator[3]*phase3).xyz;
	mediump vec3 tangentZ = cross(tangentX,tangentY);
	mediump vec3 normal = normalize(tangentZ);
	mediump vec3 ray = normalize(position.xyz-eyePosition);
	lowp vec4 waterColor = waterAmbient+(1.0-refract(normal,ray,0.75).z)*waterDiffuse;
	lowp vec4 foamColor = (foamAmbient+dot(normal,lightPosition)*foamDiffuse);
	var_waterColor = mix(mix(
		waterColor,
		fogColor,min(distance(position.xy,fogCenter)*inverseFogDistance,1.0)),
		foamColor,max(0.0,1.0-dot(tangentZ,tangentZ)));
	gl_Position = transform*position;
	gl_Position.z = clamp(gl_Position.z,-gl_Position.w,gl_Position.w);
}
