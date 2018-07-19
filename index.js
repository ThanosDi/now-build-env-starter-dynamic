const bunny = require("sign-bunny");

// some transient state
let i = 0;

require("http")
  .Server((req, res) => {
    res.writeHead(200, { "Content-Type": "text/plain; charset=utf-8" });
    // respond with the runtime env TEXT
    res.end(bunny(`${process.env.TEXT} ${i++}`));
  })
  .listen(3000);
