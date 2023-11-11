#version 330 core

out vec4 FragColor;

uniform vec3 lightPos;
uniform vec3 viewPos;

in vec3 normal;
in vec3 FragPos;
in vec2 TexCoords;

vec3 lightColor = vec3(1.0f, 1.0f, 1.0f);

uniform sampler2D texture_diffuse0;
uniform sampler2D texture_specular0;

void main()
{
	vec3 N = normalize(normal);

	vec3 diffuseColor = texture(texture_diffuse0, TexCoords).rgb;
	vec3 specularColor = texture(texture_specular0, TexCoords).rgb;

	//ambient
	vec3 ambientStrenght = lightColor * 0.3;
	vec3 ambient = ambientStrenght * lightColor * diffuseColor;
	
	//diffuse
	vec3 lightDirection = normalize(lightPos - FragPos);
	float diffuseStrength = max(dot(N, lightDirection) , 0.0);
	vec3 diffuse = diffuseStrength * lightColor * diffuseColor;

	//specular
	vec3 viewDir = normalize(viewPos - FragPos);
	vec3 reflectDir = reflect(-lightDirection, N);
	float specularStrenght = pow(max(dot(viewDir, reflectDir), 0.0),32)*0.5;
	vec3 specular = specularStrenght * lightColor * specularColor;

	//result
	vec3 finalColor = ambient + diffuse + specular;

	FragColor = vec4(finalColor,1.0);
}