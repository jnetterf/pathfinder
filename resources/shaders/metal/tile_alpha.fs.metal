#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct spvDescriptorSetBuffer0
{
    texture2d<float> uStencilTexture [[id(0)]];
    sampler uStencilTextureSmplr [[id(1)]];
};

struct main0_out
{
    float4 oFragColor [[color(0)]];
};

struct main0_in
{
    float2 vTexCoord [[user(locn0)]];
    float vBackdrop [[user(locn1)]];
    float4 vColor [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float2 texCoord = in.vTexCoord;
    texCoord.y = 1.0 - texCoord.y;
    float coverage = abs(spvDescriptorSet0.uStencilTexture.sample(spvDescriptorSet0.uStencilTextureSmplr, texCoord).x + in.vBackdrop);
    //out.oFragColor = float4(in.vColor.xyz, in.vColor.w * coverage);
    out.oFragColor = float4(1.0, 0.0, 0.0, coverage);
    //out.oFragColor = float4(1.0, 0.0, 0.0, 1.0);
    return out;
}

