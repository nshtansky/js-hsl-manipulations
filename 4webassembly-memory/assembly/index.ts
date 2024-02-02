export function lch(lightness: f64, chroma: f64, hue:f64, length: u32): void {
    for (let i: u32 = 0; i < length; i += 4) {
        /// RGB 2 HSL
        let rr = f64(load<u8>(i)) / 255.0;
        let gg = f64(load<u8>(i+1)) / 255.0;
        let bb = f64(load<u8>(i+2)) / 255.0;
        const min = Math.min(Math.min(rr, gg), bb);
        const max = Math.max(Math.max(rr, gg), bb);
        let l: f64 = (max + min) / 2.0;
        let s: f64 = 0;
        let h: f64 = 0;
        if (max !== min) {
            s = l < 0.5 ? (max - min) / (max + min) : (max - min) / (2.0 - max - min);
        }
        if (rr === max) h = (gg - bb) / (max - min);
        else if (gg === max) h = 2.0 + (bb - rr) / (max - min);
        else if (bb === max) h = 4.0 + (rr - gg) / (max - min);
        h *= 60;
        if (h < 0) h += 360;
        /// Tweak
        l += lightness;
        l = clamp(l, 0.0, 1.0);
        s += chroma;
        s = clamp(s, 0.0, 1.0);
        h += hue;
        h += 360.0;
        h %= 360.0;
        /// HSL 2 RGB
        let r: u8 = 0;
        let b: u8 = 0;
        let g: u8 = 0;
        if (s === 0) {
            r = g = b = <u8>Math.round( l*255 );
        } else {
            let c_0 = 0.0;
            let c_1 = 0.0;
            let c_2 = 0.0;
            const t2 = l < 0.5 ? l * (1.0+s) : l+s-l*s;
            const t1 = 2.0 * l - t2;
            const h_ = h / 360.0;
            let t3_0 = h_ + 1.0/3.0;
            let t3_1 = h_;
            let t3_2 = h_ - 1.0/3.0;

            if (t3_0 < 0) t3_0 += 1.0;
            if (t3_0 > 1) t3_0 -= 1.0;
            if (6.0 * t3_0 < 1.0)
                c_0 = t1 + (t2 - t1) * 6.0 * t3_0;
            else if (2.0 * t3_0 < 1.0)
                c_0 = t2;
            else if (3.0 * t3_0 < 2.0)
                c_0 = t1 + (t2 - t1) * ((2.0 / 3.0) - t3_0) * 6.0;
            else
                c_0 = t1;

            if (t3_1 < 0) t3_1 += 1.0;
            if (t3_1 > 1) t3_1 -= 1.0;
            if (6.0 * t3_1 < 1.0)
                c_1 = t1 + (t2 - t1) * 6.0 * t3_1;
            else if (2.0 * t3_1 < 1.0)
                c_1 = t2;
            else if (3.0 * t3_1 < 2.0)
                c_1 = t1 + (t2 - t1) * ((2.0 / 3.0) - t3_1) * 6.0;
            else
                c_1 = t1;

            if (t3_2 < 0) t3_2 += 1.0;
            if (t3_2 > 1) t3_2 -= 1.0;
            if (6.0 * t3_2 < 1.0)
                c_2 = t1 + (t2 - t1) * 6.0 * t3_2;
            else if (2.0 * t3_2 < 1.0)
                c_2 = t2;
            else if (3.0 * t3_2 < 2.0)
                c_2 = t1 + (t2 - t1) * ((2.0 / 3.0) - t3_2) * 6.0;
            else
                c_2 = t1;

            r = <u8>Math.round(c_0*255.0);
            g = <u8>Math.round(c_1*255.0);
            b = <u8>Math.round(c_2*255.0);
        }

        /// Store
        store<u8>(i, r);
        store<u8>(i+1, g);
        store<u8>(i+2, b);
    }
}

function clamp(n: f64, min: f64, max: f64): f64 {
    return n < min ? min : n > max ? max : n;
}
