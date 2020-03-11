
#version 450
#extension GL_ARB_separate_shader_objects : enable

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 surfacePosition;

uniform float time;

void main(){
  vec2 coord = surfacePosition;
	if(coord.x == 0.) {
		  gl_FragColor = vec4(0.0, 1.0, 1.0, 1.0);
	}

}
