function rot13(str) {
  const ALPHA = 'abcdefghijklmnopqrstuvwxyz';

  const ROT_BY = 13;
  const ALPHA_LEN = ALPHA.length;

  let returnString = '';
  for (let i = 0; i < str.length; i++) {
    let char = str[i];
    if (char.match(/[A-Z]/i)) {
      let idx = alphaCaseHandler(ALPHA, char, String.prototype.indexOf, char);
      let rotIdx = rotateIdx(idx, ROT_BY, ALPHA_LEN);
      let rotChar = alphaCaseHandler(ALPHA, char, String.prototype.charAt, rotIdx);
      returnString = returnString + rotChar;
    } else {
      returnString = returnString + char;
    }
  }
  return returnString;
}

function alphaCaseHandler(alphString, testChar, fn, fnArg) {
  if (alphString.includes(testChar)) {
    return fn.call(alphString, fnArg);
  } else {
    return fn.call(alphString.toUpperCase(), fnArg);
  }
}

function rotateIdx(idx, rotBy, alphaLen) {
  return (idx + rotBy) % alphaLen
}

const TEST = 'Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.';
const OUTPUT = rot13('Teachers open the door, but you must enter by yourself.');

console.log(OUTPUT);
console.log(OUTPUT == TEST);