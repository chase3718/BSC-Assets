
precision highp float;

uniform sampler2D foregroundTexture;
uniform sampler2D backgroundTexture;

varying highp vec2 var_foregroundCoord;
varying highp vec2 var_backgroundCoord;
varying lowp vec4 var_waterColor;

void main() {
	lowp vec4 foreground = texture2D(foregroundTexture,var_foregroundCoord);
	lowp vec4 background = texture2D(backgroundTexture,var_backgroundCoord);
	gl_FragColor = (1.0-foreground.a)*((1.0-var_waterColor.a)*background+var_waterColor)+foreground;
}
