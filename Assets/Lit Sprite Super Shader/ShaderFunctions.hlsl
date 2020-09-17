#ifndef MY_CUSTOM_FUNCS
#define MY_CUSTOM_FUNCS

void Stroke_float(Texture2D Texture, SamplerState  Sampler, float StrokeSize, float2 UV, out float StrokeOutput) 
{
	float2 UVLeft = UV + float2(-StrokeSize, 0.0);
	float4 Left = Texture.Sample(Sampler, UVLeft);

	float2 UVRight = UV + float2(StrokeSize, 0.0);
	float4 Right = Texture.Sample(Sampler, UVRight);

	float2 UVUp = UV + float2(0.0, StrokeSize);
	float4 Up = Texture.Sample(Sampler, UVUp);

	float2 UVDown = UV + float2(0.0, -StrokeSize);
	float4 Down = Texture.Sample(Sampler, UVDown);


	StrokeOutput = saturate(Left.w + Right.w + Down.w + Up.w);
}

void SuperSample_float(Texture2D Texture, SamplerState  Sampler, float Offset, float2 UV, out float4 Output)
{
	float2 UVLeft = UV + float2(-Offset, 0.0);
	float4 Left = Texture.Sample(Sampler, UVLeft);

	float2 UVRight = UV + float2(Offset, 0.0);
	float4 Right = Texture.Sample(Sampler, UVRight);

	float2 UVUp = UV + float2(0.0, Offset);
	float4 Up = Texture.Sample(Sampler, UVUp);

	float2 UVDown = UV + float2(0.0, -Offset);
	float4 Down = Texture.Sample(Sampler, UVDown);


	Output = (Left + Right + Down + Up) / float4(4, 4, 4, 4);
}
#endif