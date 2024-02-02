export const rgb2hsl = (r, g, b)  => {
    r /= 255;
    g /= 255;
    b /= 255;

    const min = Math.min(r, g, b);
    const max = Math.max(r, g, b);

    const l = (max + min) / 2;
    let s, h;

    if (max === min){
        s = 0;
        h = Number.NaN;
    } else {
        s = l < 0.5 ? (max - min) / (max + min) : (max - min) / (2 - max - min);
    }

    if (r === max) h = (g - b) / (max - min);
    else if (g === max) h = 2 + (b - r) / (max - min);
    else if (b === max) h = 4 + (r - g) / (max - min);

    h *= 60;
    if (h < 0) h += 360;

    return [h,s,l];
}

export const hsl2rgb = (h, s, l) => {

    let r,g,b;
    if (s === 0) {
        r = g = b = l*255;
    } else {
        const t3 = [0,0,0];
        const c = [0,0,0];
        const t2 = l < 0.5 ? l * (1+s) : l+s-l*s;
        const t1 = 2 * l - t2;
        const h_ = h / 360;
        t3[0] = h_ + 1/3;
        t3[1] = h_;
        t3[2] = h_ - 1/3;
        for (let i=0; i<3; i++) {
            if (t3[i] < 0) t3[i] += 1;
            if (t3[i] > 1) t3[i] -= 1;
            if (6 * t3[i] < 1)
                c[i] = t1 + (t2 - t1) * 6 * t3[i];
            else if (2 * t3[i] < 1)
                c[i] = t2;
            else if (3 * t3[i] < 2)
                c[i] = t1 + (t2 - t1) * ((2 / 3) - t3[i]) * 6;
            else
                c[i] = t1;
        }
        [r,g,b] = [Math.round(c[0]*255),Math.round(c[1]*255),Math.round(c[2]*255)];
    }
    return [r,g,b];
}

export function clamp(n, min, max) {
    return n < min ? min : n > max ? max : n;
}
