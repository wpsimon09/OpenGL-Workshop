#version 330 core

//	vector
//	colection of number
//	can be 1,2,3,4 component vector

//this is input of the vertex shader 
layout (location = 0) in vec3 aPos;

void main()
{
	gl_Position = vec4(aPos,1.0);
}