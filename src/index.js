const uuid = require("uuid/v4");
const number = 1;


setInterval(() => {
  console.log({ number , rand : uuid()});
}, 1000);
