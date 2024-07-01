
uniform mat4 transform;
uniform float transformScale;
uniform vec4 velocityScale;

attribute vec4 position;
attribute vec4 velocity;
attribute float variance;
attribute float density;

varying mediump vec2 var_texCoord;
varying lowp float var_density;
varying lowp vec4 var_velocity;

void main() {
	gl_Position = transform*position;
	gl_PointSize =  transformScale*sqrt(variance);
	var_texCoord = 0.5*gl_Position.xy+0.5;
	var_velocity = velocityScale*velocity;
	var_density = density*min(2.0*dot(var_velocity.xyz,var_velocity.xyz),1.0);
}
