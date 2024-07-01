
uniform vec2 textureDelta;

attribute vec4 position;

varying mediump vec2 var_texCoord;
varying mediump vec2 var_texCoordEast;
varying mediump vec2 var_texCoordWest;
varying mediump vec2 var_texCoordSouth;
varying mediump vec2 var_texCoordNorth;

void main() {
	gl_Position = position;
	vec2 texCoord = 0.5*(position.xy+1.0);
	var_texCoord = texCoord;
	var_texCoordEast = texCoord-vec2(textureDelta.x,0.0);
	var_texCoordWest = texCoord+vec2(textureDelta.x,0.0);
	var_texCoordSouth = texCoord-vec2(0.0,textureDelta.y);
	var_texCoordNorth = texCoord+vec2(0.0,textureDelta.y);
}
