
precision highp float;

uniform samplerCube texture;

varying vec3 var_ray;

void main() {
	gl_FragColor = textureCube(texture,var_ray);
}
