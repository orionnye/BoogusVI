shader_type spatial;

//var noise = OpenSimplexNoise.new();
uniform vec3 albedo : source_color;
uniform sampler2D noise;
uniform float metallic : hint_range(0.0, 1.0, 0.01) = 0;
uniform float roughness : hint_range(0.0, 1.0, 0.01) = 0.02;

void fragment() {
	ALBEDO = albedo;
	METALLIC = metallic;
	ROUGHNESS = roughness;
}