/// <reference types="es4x" />
// @ts-check

const PORT = +process.env.port || +process.env.PORT || 8000;

vertx
  .createHttpServer()
  .requestHandler(function (req) {
    const response = {
      status: 200,
      msg: "ES4X API up and running."
    }
    req.response().end(JSON.stringify(response));
  })
  .listen(PORT);

console.log(`Server listening at: http://localhost: ${PORT}/`);
