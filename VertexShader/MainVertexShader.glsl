#version 330 core

//	vector
//	colection of number
//	can be 1,2,3,4 component vector

//this is input of the vertex shader 
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

out vec3 normal;
out vec3 FragPos;

void main()
{
	
	FragPos = vec3(model * vec4(aPos,1.0));
	normal = mat3(transpose(inverse(model))) * aNormal;
	gl_Position = projection * view * vec4(FragPos,1.0);
}