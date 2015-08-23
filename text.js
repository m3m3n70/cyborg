cyborg = require('./');

arg = process.argv[2];

if (!arg){
  // return console.error('string not defined');
  arg = 'what is the distance from sfo to lax';
}

cyborg({string: arg}, function(err, data) {
  if (err) console.log(err);
  console.log(JSON.stringify(data, null, 2));
});
