shader_type canvas_item;

uniform sampler2D gradient_texture;
uniform vec3 primary_color:source_color;
uniform vec3 secondary_color:source_color = vec3(1.0);
uniform float amount:hint_range(0.0, 1.0, 0.001);
uniform float degree:hint_range(-1.0, 1.0, 0.01);

vec2 rotateUV(vec2 uv, vec2 pivot, float rotation) {
	float sine = sin(rotation);
	float cosine = cos(rotation);

	uv -= pivot;
	uv.x = uv.x * cosine - uv.y * sine;
	uv.y = uv.x * sine + uv.y * cosine;
	uv += pivot;

	return uv;
}

void fragment() {
	vec4 tex = texture(gradient_texture, rotateUV(UV, vec2(0.5), degree) );
	tex.r = smoothstep(amount, amount + 0.002, tex.r);
	vec3 col = mix(primary_color, secondary_color, tex.r);
	COLOR.rgb = col;
}
