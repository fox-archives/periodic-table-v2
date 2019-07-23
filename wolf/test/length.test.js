let fs = require('fs');

fs.readFile('../all-properties-tab/all-properties-data.json', (err, data) => {
  let allPropertiesData = JSON.parse(data);

  
  console.log('allPropertiesData has length of: ' + allPropertiesData.length);
})