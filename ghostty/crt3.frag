void mainImage( out vec4 O,  vec2 U )
{
	vec2 R = iResolution.xy;
    float US1 = sin(U.y)/2.+.7;					//Screen Stripes
    vec3 US2;
    US2.x = sin(20./iResolution.y*U.y+(-iTime*2.-.4))/10.+.85;	//R Chromatic Screen Waves
   	US2.y = sin(20./iResolution.y*U.y+(-iTime*2.))/10.+.85;		//G Chromatic Screen Waves
    US2.z = sin(20./iResolution.y*U.y+(-iTime*2.+.4))/10.+.85;	//B Chromatic Screen Waves
    vec3 US = US1 * US2;												//Screen Stripes & Screen Waves Combined
    U =U/R;
    vec2 UR = U + vec2(.001,0.);	//Red UV
    vec2 UG = U + vec2(0.,0.);		//Green UV
    vec2 UB = U + vec2(-.001,0.);	//Blue UV
    vec4 C = texture(iChannel0, U.xy);
    vec4 CR = texture(iChannel0, UR.xy) * vec4(.8,.1,.1,0.);	//Red Channel
    vec4 CG = texture(iChannel0, UG.xy) * vec4(.1,.8,.1,0.);	//Green Channel
    vec4 CB = texture(iChannel0, UB.xy) * vec4(.1,.1,.8,0.);	//BLue Channel
    vec4 CL = 1.+vec4(vec3(.2),0.);				//Contrast Loss
    O = (CR+CB+CG)/CL;						//RGB Channels / Contrast Loss * Screen Stripes * Compensation
	O *= vec4(US*1.1,0);
}