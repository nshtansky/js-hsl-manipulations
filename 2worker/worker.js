/* eslint-disable */
import {rgb2hsl, hsl2rgb, clamp} from "./color.js";

self.addEventListener('message', function(e) {
    const data = e.data;
    self.postMessage({
        'cmd': 'calc',
        'result': adjust(data)
    });
}, false);

function adjust(data)
{
    let pic = data.pic;
    const size = data.w * data.h * 4;

    for (let i = 0; i < size; i += 4) {
        let hsl = rgb2hsl( pic[i], pic[i+1], pic[i+2]);
        hsl[0] += data.hue;
        hsl[0] += 360;
        hsl[0] %= 360;
        hsl[1] += data.chroma;
        hsl[1] = clamp(hsl[1], 0, 1);
        hsl[2] += data.lightness;
        hsl[2] = clamp(hsl[2], 0, 1);
        let rgb = hsl2rgb(hsl[0], hsl[1], hsl[2]);
        pic[i] = rgb[0];
        pic[i+1] = rgb[1];
        pic[i+2] = rgb[2];
    }
    return pic;
}
