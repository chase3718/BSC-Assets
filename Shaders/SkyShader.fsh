
precision highp float;

uniform sampler2D texture;

varying vec4 var_skyColor;
varying vec4 var_fogColor;
varying vec2 var_texCoord;

void main() {
	lowp vec4 texColor = texture2D(texture,var_texCoord);
	gl_FragColor = (1.0-var_fogColor.a)*((1.0-texColor.a)*var_skyColor+texColor)+var_fogColor;
}
