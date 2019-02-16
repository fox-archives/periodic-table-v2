export default function(key) {
  let newKey = key.replace(/([A-Z])/g, " $1").replace(/^./, function(str) {
    return str.toUpperCase();
  });
  return newKey;
}
