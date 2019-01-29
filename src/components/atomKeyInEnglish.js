export default function(key) {
  let newKey;

  switch (key) {
    case "name":
      newKey = "Name";
      break;
    case "abbreviation":
      newKey = "Abbreviation";
      break;
    case "atomicNumber":
      newKey = "Atomic Number";
      break;
    case "atomicWeight":
      newKey = "Atomic Weight";
      break;
    case "boilingPoint":
      newKey = "Boiling Point";
      break;
    case "meltingPoint":
      newKey = "Melting Point";
      break;
    case "radius":
      newKey = "Radius";
      break;
    case "electronegativity":
      newKey = "Electronegativity";
      break;
  }
  return newKey;
}
