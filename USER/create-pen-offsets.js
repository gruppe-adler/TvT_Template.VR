const extendLength = 8;
const extendWidth = 8;

const sheepLength = 1.4
const sheepWidth = 0.5

let out = [];

for (let x = -extendLength; x < extendLength; x++) {
    for (let y = -extendWidth; y < extendWidth; y++) {
        let lengthOffset = (y % 3) / 3;
        let fX = String.fromCodePoint(65 + extendLength - x);
        let fY = y+extendWidth
        let a = y*sheepWidth
        let b = x*sheepLength + lengthOffset
        out.push(`class ${fX}${fY} { offset[]={ ${a}, ${b}, -3}; };`)
    };
}

console.log(out.join("\n"))
