
uniform mat4 transform;
uniform vec4 eyeNormal;
uniform float transformScale;
uniform vec4 baseColor;
uniform vec4 fogColor;
uniform vec2 fogCenter;
uniform float inverseFogDistance;

attribute vec4 position;
attribute vec2 texCoord;
attribute vec4 color;
attribute float variance;
attribute float density;

varying lowp vec2 var_texCoord;
varying lowp vec4 var_color;

void main() {
	highp float radius = max(sqrt(variance),2.0);
	gl_Position = transform*(position+radius*eyeNormal);
	gl_PointSize =  min(transformScale*radius/gl_Position.w,256.0);
	var_texCoord = texCoord;
	var_color = density*mix(
		baseColor*color,fogColor,
		min(distance(position.xy,fogCenter)*inverseFogDistance,1.0)*color.a);
}
