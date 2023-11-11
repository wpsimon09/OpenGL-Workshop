#version 330 core

out vec4 FragColor;

uniform vec3 cubeColor;
uniform vec3 lightPos;
uniform vec3 viewPos;

in vec3 normal;
in vec3 FragPos;

vec3 lightColor = vec3(1.0f, 1.0f, 1.0f);


void main()
{
	vec3 N = normalize(normal);

	//ambient
	vec3 ambientStrenght = lightColor * 0.1;
	vec3 ambient = ambientStrenght * lightColor;
	
	//diffuse
	vec3 lightDirection = normalize(lightPos - FragPos);
	float diffuseStrength = max(dot(N, lightDirection) , 0.0);
	vec3 diffuse = diffuseStrength * lightColor;

	//specular
	vec3 viewDir = normalize(viewPos - FragPos);
	vec3 reflectDir = reflect(-lightDirection, N);
	float specularStrenght = pow(max(dot(viewDir, reflectDir), 0.0),16)*0.5;
	vec3 specular =specularStrenght * lightColor;

	//result
	vec3 finalColor = (ambient + diffuse + specular) * cubeColor;

	FragColor = vec4(finalColor,1.0);
}