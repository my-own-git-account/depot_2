
#version 450
#extension GL_ARB_separate_shader_objects : enable
//doneNecip's transfer from https://www.youtube.com/watch?v=9oYssHkOn0I
// More examples: https://github.com/lewislepton/shadertutorialseries

#ifdef GL_ES
precision mediump float;
#endif

varying vec2 surfacePosition;
uniform vec2 resolution;
uniform float time;

void main(){
  vec2 coord = surfacePosition;
  coord += 0.5;
	
  vec3 color0 = vec3(0.0); 
  vec3 color1 = vec3(0.0); 
  vec3 color2 = vec3(0.0);
  vec2 translate = vec2(-0.5, -0.5);
  coord += translate;

  for(int i = 0; i < 100; i++){
    float radius = 0.3+0.1*(sin(3.0*time));
    float rad = (radians(360.0 / 30.0) * float(i))+(time*3.14*2.0);
	float rad2 = (radians(360.0 / 40.0) * float(i))+(time*3.14*1.0);

    color0 += 0.001 / length(coord + vec2(radius * sin(rad), radius * cos(rad2)));
	  color1 += 0.001 / length(coord + vec2(radius * cos(rad), radius * sin(rad2)));
	  color2 += 0.001 / length(coord + vec2(radius * sin(rad2), radius * cos(rad2)));
	  
  }


  gl_FragColor = vec4(color0.x, color1.x, color2.x, .1);
	gl_FragColor.q = 1.0;
	
