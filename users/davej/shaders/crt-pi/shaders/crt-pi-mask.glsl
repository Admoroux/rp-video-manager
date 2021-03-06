#define BARREL_DISTORTION_X 0.15
#define BARREL_DISTORTION_Y 0.25

/* COMPATIBILITY
   - GLSL compilers
*/

/*
    crt-pi

    Copyright (C) 2015 davej

    This program is free software; you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by the Free
    Software Foundation; either version 2 of the License, or (at your option)
    any later version.
*/

#ifdef GL_ES
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif

uniform vec2 TextureSize;

varying COMPAT_PRECISION vec2 screenScale;
varying COMPAT_PRECISION vec2 TEX0;

#if defined(VERTEX)
uniform mat4 MVPMatrix;
attribute vec4 VertexCoord;
attribute vec2 TexCoord;
uniform vec2 InputSize;
uniform vec2 OutputSize;

void main()
{
	screenScale = TextureSize / InputSize;
	TEX0 = TexCoord;
	gl_Position = MVPMatrix * VertexCoord;
}
#elif defined(FRAGMENT)

#define BARREL_DISTORTION vec2(BARREL_DISTORTION_X, BARREL_DISTORTION_Y)
// Barrel distortion shrinks the display area a bit, this will allow us to counteract that.
const vec2 barrelScale = 1.0 - (0.23 * BARREL_DISTORTION);

vec2 Distort(vec2 coord)
{
	coord *= screenScale;
	coord -= vec2(0.5);
	float rsq = coord.x * coord.x + coord.y * coord.y;
	coord += coord * (BARREL_DISTORTION * rsq);
	coord *= barrelScale;
	if (abs(coord.x) >= 0.5 || abs(coord.y) >= 0.5)
		coord = vec2(-1.0);		// If out of bounds, return an invalid value.
	else
	{
		coord += vec2(0.5);
		coord /= screenScale;
	}

	return coord;
}

void main()
{
	vec2 texcoord = Distort(TEX0);
	if (texcoord.x < 0.0)
		gl_FragColor = vec4(1.0);
	else
		gl_FragColor = vec4(0.0);

}
#endif
