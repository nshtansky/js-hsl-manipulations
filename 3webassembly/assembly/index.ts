import { rgb2hsl, hsl2rgb, clamp } from "./color";

export function lch(lightness: f64, chroma: f64, hue:f64, length: u32, pic: Uint8Array): Uint8Array {
    for (let i: u32 = 0; i < length; i += 4) {
        let hsl = rgb2hsl(pic[i], pic[i + 1], pic[i + 2]);
        hsl[2] += lightness;
        hsl[2] = clamp(hsl[2], 0.0, 1.0);
        hsl[1] += chroma;
        hsl[1] = clamp(hsl[1], 0.0, 1.0);
        hsl[0] += hue;
        hsl[0] += 360.0;
        hsl[0] %= 360.0;
        let rgb = hsl2rgb(hsl[0], hsl[1], hsl[2]);
        pic[i] = rgb[0];
        pic[i+1] = rgb[1];
        pic[i+2] = rgb[2];
    }
    return pic;
}
