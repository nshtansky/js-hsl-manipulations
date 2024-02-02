export function rgb2hsl (r:u8, g:u8, b:u8) : f64[] {
    let rr = f64(r) / 255.0;
    let gg = f64(g) / 255.0;
    let bb = f64(b) / 255.0;

    const min = Math.min(Math.min(rr, gg), bb);
    const max = Math.max(Math.max(rr, gg), bb);

    const l = (max + min) / 2;
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

    return [h,s,l];
}

export function hsl2rgb (h:f64, s:f64, l:f64) : u8[] {
    let r: u8 = 0;
    let b: u8 = 0;
    let g: u8 = 0;
    if (s === 0) {
        r = g = b = <u8>Math.round( l*255 );
    } else {
        const t3 = [0.0,0.0,0.0];
        const c = [0.0,0.0,0.0];
        const t2 = l < 0.5 ? l * (1.0+s) : l+s-l*s;
        const t1 = 2.0 * l - t2;
        const h_ = h / 360.0;
        t3[0] = h_ + 1.0/3.0;
        t3[1] = h_;
        t3[2] = h_ - 1.0/3.0;
        for (let i=0; i<3; i++) {
            if (t3[i] < 0) t3[i] += 1.0;
            if (t3[i] > 1) t3[i] -= 1.0;
            if (6.0 * t3[i] < 1.0)
                c[i] = t1 + (t2 - t1) * 6.0 * t3[i];
            else if (2.0 * t3[i] < 1.0)
                c[i] = t2;
            else if (3.0 * t3[i] < 2.0)
                c[i] = t1 + (t2 - t1) * ((2.0 / 3.0) - t3[i]) * 6.0;
            else
                c[i] = t1;
        }
        r = <u8>Math.round(c[0]*255.0);
        g = <u8>Math.round(c[1]*255.0);
        b = <u8>Math.round(c[2]*255.0);
    }
    return [r,g,b];
}

export function clamp(n: f64, min: f64, max: f64): f64 {
    return n < min ? min : n > max ? max : n;
}
