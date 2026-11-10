// Independent numeric oracle for direct compiler intrinsic/call-order regressions.
// The generated fixture resolves this import to the plugin's core/index.js binding.
export const lerp = (a, b, u) => a + (b - a) * u;
